//
//  Solver.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 06/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Solver {
    
    
    public static func substract(master: [CGPoint], slave: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> FloatSolution {
        let iMaster = converter.convert(points: master)
        let iSlave = converter.convert(points: slave)
        
        let solution = Solver.substract(master: iMaster, slave: iSlave, converter: converter)
        
        if solution.disposition == .hasIntersections {
            var pathCollection = Array<[CGPoint]>()
            pathCollection.reserveCapacity(solution.pathCollection.count)
            for p in solution.pathCollection {
                let path = converter.convert(iPoints: p)
                pathCollection.append(path)
            }
            return FloatSolution(pathCollection: pathCollection, disposition: .hasIntersections)
        } else {
            return FloatSolution(pathCollection: [], disposition: .noIntersections)
        }

    }

    
    public static func substract(master: [Point], slave: [Point], converter: PointConverter = PointConverter.defaultConverter) -> Solution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, converter: converter, exclusionPinType: PinPoint.in_out)

        var cursor = navigator.nextSub()
        
        guard cursor.isNotEmpty else {
            return Solution(pathCollection: [], disposition: .noIntersections)
        }

        var result = [[Point]]()
        
        let masterCount = master.count
        let masterLastIndex = masterCount - 1
        
        let slaveCount = slave.count
        let slaveLastIndex = slaveCount - 1
        
        while cursor.isNotEmpty {

            navigator.mark(cursor: cursor)

            var path = [Point]()
            let start = cursor

            repeat {
                // in-out slave path
                
                let outCursor = navigator.nextSlaveOut(cursor: cursor, stop: start)

                let inSlaveStart = navigator.slaveStartStone(cursor: cursor)
                
                let outSlaveEnd: PathMileStone

                let isOutInStart = outCursor == start && path.count > 0
                
                if !isOutInStart {
                   outSlaveEnd = navigator.slaveEndStone(cursor: outCursor)
                } else {
                    // possible if we start with out-in
                    outSlaveEnd = navigator.slaveStartStone(cursor: outCursor)
                }
                
                let startPoint = navigator.slaveStartPoint(cursor: cursor)
                path.append(startPoint)
                
                let isInSlaveNotOverflow: Bool
                let inSlaveIndex: Int
                if inSlaveStart.index + 1 < slaveCount {
                    isInSlaveNotOverflow = true
                    inSlaveIndex = inSlaveStart.index + 1
                } else {
                    isInSlaveNotOverflow = false
                    inSlaveIndex = 0
                }
                
                
                let isOutSlaveNotOverflow: Bool
                let outSlaveIndex: Int
                
                if outSlaveEnd.offset != 0 {
                    isOutSlaveNotOverflow = true
                    outSlaveIndex = outSlaveEnd.index
                } else {
                    if outSlaveEnd.index != 0 {
                        isOutSlaveNotOverflow = true
                        outSlaveIndex = outSlaveEnd.index - 1
                    } else {
                        isOutSlaveNotOverflow = false
                        outSlaveIndex = slaveCount - 1
                    }
                }
                
                if PathMileStone.moreOrEqual(a: inSlaveStart, b: outSlaveEnd) {
                    // a > b
                    if isInSlaveNotOverflow {
                        let sliceA = slave[inSlaveIndex...slaveLastIndex]
                        path.append(contentsOf: sliceA)
                    }

                    if isOutSlaveNotOverflow {
                        let sliceB = slave[0...outSlaveIndex]
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInSlaveNotOverflow && isOutSlaveNotOverflow && inSlaveIndex <= outSlaveIndex {
                        let slice = slave[inSlaveIndex...outSlaveIndex]
                        path.append(contentsOf: slice)
                    }
                }

                if isOutInStart {
                    // possible if we start with out-in
                    break
                }
                
                let endPoint = navigator.slaveEndPoint(cursor: outCursor)
                path.append(endPoint)
                
                cursor = navigator.nextMaster(cursor: outCursor)
                navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = navigator.masterEndStone(cursor: outCursor)
                let inMasterStart = navigator.masterStartStone(cursor: cursor)
                
                
                let isOutMsterNotOverflow: Bool
                let outMasterIndex: Int
                if outMasterEnd.index + 1 < masterCount {
                    outMasterIndex = outMasterEnd.index + 1
                    isOutMsterNotOverflow = true
                } else {
                    outMasterIndex = 0
                    isOutMsterNotOverflow = false
                }
                
                
                let isInMsterNotOverflow: Bool
                let inMasterIndex: Int
                if inMasterStart.offset != 0 {
                    inMasterIndex = inMasterStart.index
                    isInMsterNotOverflow = true
                } else {
                    if inMasterStart.index != 0 {
                        inMasterIndex = inMasterStart.index - 1
                        isInMsterNotOverflow = true
                    } else {
                        inMasterIndex = masterCount - 1
                        isInMsterNotOverflow = false
                    }
                }
                
                
                if PathMileStone.moreOrEqual(a: outMasterEnd, b: inMasterStart) {
                    // a > b
                    if isOutMsterNotOverflow {
                        let sliceA = master[outMasterIndex...masterLastIndex]
                        path.append(contentsOf: sliceA)
                    }
                    if isInMsterNotOverflow {
                        let sliceB = master[0...inMasterIndex]
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInMsterNotOverflow && isOutMsterNotOverflow && outMasterIndex <= inMasterIndex {
                        let slice = master[outMasterIndex...inMasterIndex]
                        path.append(contentsOf: slice)
                    }
                }
            } while cursor != start
            
            result.append(path)

            cursor = navigator.nextSub()
        }
        
        let solution: Solution
        
        if result.count > 0 {
            solution = Solution(pathCollection: result, disposition: .hasIntersections)
        } else {
            solution = Solution(pathCollection: [], disposition: .noIntersections)
        }

        return solution
    }
    
}


fileprivate extension PinNavigator {
    
    fileprivate mutating func nextSub() -> Cursor {
        var cursor = self.next()

        while cursor.isNotEmpty && cursor.type != PinPoint.inside && cursor.type != PinPoint.out_in {
            self.mark(cursor: cursor)
            cursor = self.next()
        }
        
        return cursor
    }
    
}


fileprivate extension PinNavigator {
    
    fileprivate mutating func nextSlaveOut(cursor: Cursor, stop: Cursor) -> Cursor {
        let start: Cursor = cursor
        
        var prev = cursor
        var cursor = self.nextSlave(cursor: cursor)

        while start != cursor && stop != cursor && cursor.type == PinPoint.out_in {
            let nextMaster = self.nextMaster(cursor: cursor)

            if nextMaster == start {
                return cursor
            }
            
            let nextSlave = self.nextSlave(cursor: cursor)
            
            let isCanSkip = self.isCanSkip(prev: prev, cursor: cursor, nextSlave: nextSlave)
            if !isCanSkip {
                return cursor
            }

            self.mark(cursor: cursor)
            prev = cursor
            cursor = nextSlave
        }
        
        
        return cursor
    }
    
    private mutating func isCanSkip(prev: Cursor, cursor: Cursor, nextSlave: Cursor) -> Bool {
        var nextMaster = cursor
        var isFoundMaster = false
        var isFoundStart = false
        repeat {
            nextMaster = self.nextMaster(cursor: nextMaster)
            isFoundMaster = nextMaster == nextSlave
            isFoundStart = nextMaster == prev
        } while !(isFoundMaster || isFoundStart)
        
        
        return isFoundMaster
    }
}

