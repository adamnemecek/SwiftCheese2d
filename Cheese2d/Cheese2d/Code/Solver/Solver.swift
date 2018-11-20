//
//  Solver.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 06/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Solver {
    
    private let master: [Point]
    private let slave: [Point]
    private let converter: PointConverter
    
    
    public init(master: [CGPoint], slave: [CGPoint], precision: CGFloat = PointConverter.defaultPrecision) {
        let converter = PointConverter(precision: precision)
        self.master = converter.convert(points: master)
        self.slave = converter.convert(points: slave)
        self.converter = converter
    }
    
    
    public init(master: [Point], slave: [Point], precision: CGFloat = PointConverter.defaultPrecision) {
        self.master = master
        self.slave = slave
        self.converter = PointConverter(precision: precision)
    }
    
    
    public func substract() -> FloatSolution {
        let solution: Solution = self.substract()
        
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

    
    public func substract() -> Solution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, converter: converter)

        var cursor = navigator.nextSub()
        
        guard cursor.isNotEmpty else {
            return Solution(pathCollection: [], disposition: .noIntersections)
        }
        
        
        navigator.mark(cursor: cursor)

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
                // in-out slave ppath
                
                let outCursor = navigator.nextSlave(cursor: cursor)
                
                let inSlaveStart = navigator.slaveStartStone(cursor: cursor)
                let outSlaveEnd = navigator.slaveEndStone(cursor: outCursor)
                
                
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
                    if outMasterIndex <= inMasterIndex {
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
