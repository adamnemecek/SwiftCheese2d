//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public class Intersector {

    /*
    public static func findPinPath(master: [Vector2], slave: [Vector2], precision: CGFloat = 0.001) -> [Vector2] {
        
        let sqrPrecision = precision * precision
        
        let slaveLength = slave.count
    
        var slaveBoxArea = BoxArea.empty

        var pinPointList = [Vector2]()
    
        var slaveSegmentsBoxArea: [BoxArea] = []
    
        var b = slave[slaveLength - 1]
    
        for i in 0...slaveLength - 1 {
            let slave_0 = slave[i]
            slaveBoxArea.assimilate(p: b)
    
            slaveSegmentsBoxArea.append(BoxArea(a: slave_0, b: b))
            b = slave_0
        }

        let masterLength = master.count
        var master_x = master[masterLength - 1]
        
        var possibleIntersectionAdjacency = AdjacencyMatrix(size: 0)
        
        var isSimpleCase = true
        
        for i in 0...masterLength - 1 {
            let master_0 = master[i]
            let isIntersectionImpossible = slaveBoxArea.isNotIntersecting(a: master_0, b: master_x)

            if isIntersectionImpossible {
                master_x = master_0
                continue
            }

            let segmentBoxArea = BoxArea(a: master_0, b: master_x)

            var j = 0
            var prev_j = slaveLength - 1
            while j < slaveLength {
                let isIntersectionPossible = slaveSegmentsBoxArea[j].isInterscting(box: segmentBoxArea)

                if isIntersectionPossible {
                    possibleIntersectionAdjacency.addMate(master: i, slave: prev_j)
                    
                    
                    let slave_0 = slave[prev_j]
                    let slave_x = slave[j]

                    let intersectionTest = areSegmentsIntersecting(startA: master_x, endA: master_0, startB: slave_0, endB: slave_x)

                    if intersectionTest {
                        let xPoint = Intersector.getIntersectionPoint(startA: master_x, endA: master_0, startB: slave_0, endB: slave_x)

                        let sqrMasterEdgePrecision = sqrPrecision * master_x.sqrDistance(vector: master_0)
                        
                        if isSimpleCase {
                            let isEndm_x = master_x.isNear(vector: xPoint, sqrDistance: sqrMasterEdgePrecision)
                            let isEndm_0 = master_0.isNear(vector: xPoint, sqrDistance: sqrMasterEdgePrecision)
                            let isEnds_x = slave_x.isNear(vector: xPoint, sqrDistance: sqrMasterEdgePrecision)
                            let isEnds_0 = slave_0.isNear(vector: xPoint, sqrDistance: sqrMasterEdgePrecision)
                            
                            isSimpleCase = !isEndm_x && !isEndm_0 && !isEnds_x && !isEnds_0
                        }

                        pinPointList.append(xPoint)
 
                    }
                }
                prev_j = j
                j += 1
            }
            
            master_x = master_0
        }
        
        if isSimpleCase {
            return pinPointList
        } else {
            return []
        }
 
        return []
    }
 */
 
    public static func findPinPath(master: [CGPoint], slave: [CGPoint]) -> [CGPoint] {
        let iMaster = DataNormalizer.convert(points: master)
        let iSlave = DataNormalizer.convert(points: slave)
        
        print(iMaster)
        print(iSlave)
        
        let posMatrix = self.buildPossibilityMatrix(master: iMaster, slave: iSlave)

        let masterIndices = posMatrix.masterIndices.numbers
        let slaveIndices = posMatrix.adjacencies
        
        print(masterIndices)
        print(slaveIndices)
        
        var crossMap = AdjacencyMap<Point>()
        var extremes = AdjacencyMap<Int>()
        var borders = [Border]()
        
        let n = masterIndices.count
        var i = 0
        let msLastIx = iMaster.count - 1
        let slLastIx = iSlave.count - 1
        
        while i < n {
            let msIx0 = masterIndices[i]
            let msIx1 = msIx0 < msLastIx ? msIx0 + 1 : 0
            
            let ms0 = iMaster[msIx0]
            let ms1 = iMaster[msIx1]
            
            var j = i
            
            repeat {
                
                let slIx0 = slaveIndices[j]
                let slIx1 = slIx0 < slLastIx ? slIx0 + 1 : 0
                
                let sl0 = iSlave[slIx0]
                let sl1 = iSlave[slIx1]
                
                let intersectionTest = Intersector.disposition(a0: ms0, a1: ms1, b0: sl0, b1: sl1)
                
                j += 1
                if intersectionTest == -1 {
                    continue
                } else if intersectionTest > 0 {
                    let point = Intersector.cross(a0: ms0, a1: ms1, b0: sl0, b1: sl1)
                    if intersectionTest == 1 {
                        crossMap.addMate(master: msIx0, slave: slIx0, value: point)
                    } else {
                        var extremeMsIx = -1
                        var extremeSlIx = -1
                        if ms0 == point {
                            extremeMsIx = msIx0
                        } else if ms1 == point {
                            extremeMsIx = msIx1
                        }
                        
                        if sl0 == point {
                            extremeSlIx = slIx0
                        } else if sl1 == point {
                            extremeSlIx = slIx1
                        }

                        if extremeMsIx >= 0 && extremeSlIx >= 0 {
                            extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 0)
                        } else if extremeMsIx >= 0 {
                            extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 1)
                        } else if extremeSlIx >= 0 {
                            extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 2)
                        }
                    }
                } else {
                    
                    borders.append()
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i += j
        }
        
        
        
        return DataNormalizer.convert(iPoints: crossMap.values)
    }
    
    
    private static func buildPossibilityMatrix(master: [Point], slave: [Point]) -> AdjacencyMatrix {

        var slaveBoxArea = BoxArea.empty

        var slaveSegmentsBoxArea: [BoxArea] = []
        
        let lastSlaveIndex = slave.count - 1
        
        for i in 0...lastSlaveIndex {
            let a = slave[i]
            let b = slave[i != lastSlaveIndex ? i + 1 : 0]
            
            slaveBoxArea.assimilate(p: a)
            slaveSegmentsBoxArea.append(BoxArea(a: a, b: b))
        }
        
        var posMatrix = AdjacencyMatrix(size: 0)

        let lastMasterIndex = master.count - 1
        
        for i in 0...lastMasterIndex {
            let master_0 = master[i]
            let master_1 = master[i != lastMasterIndex ? i + 1 : 0]
            
            let isIntersectionImpossible = slaveBoxArea.isNotIntersecting(a: master_0, b: master_1)
            
            if isIntersectionImpossible {
                continue
            }
            
            let segmentBoxArea = BoxArea(a: master_0, b: master_1)
        
            
            for j in 0...lastSlaveIndex {
                let isIntersectionPossible = slaveSegmentsBoxArea[j].isInterscting(box: segmentBoxArea)
                
                if isIntersectionPossible {
                    posMatrix.addMate(master: i, slave: j)
                }
            }
        }
        
        return posMatrix
    }

    
    
    
    // -1 not intersecting, 0 same line, 1 - intersecting, 2 - possible end
    private static func disposition(a0: Point, a1: Point, b0: Point, b1: Point) -> Int {
        print("a0: \(a0), a1: \(a1), b0: \(b0), b1: \(b1)")
        let d0 = Intersector.isCCW(a: a0, b: b0, c: b1)
        let d1 = Intersector.isCCW(a: a1, b: b0, c: b1)
        let d2 = Intersector.isCCW(a: a0, b: a1, c: b0)
        let d3 = Intersector.isCCW(a: a0, b: a1, c: b1)
    
        if d0 != 0 || d1 != 0 || d2 != 0 || d3 != 0 {
            let t0 = d0 < 0
            let t1 = d1 < 0
            let t2 = d2 < 0
            let t3 = d3 < 0
            
            if (t0 != t1) && (t2 != t3) {
                if d0 != 0 && d1 != 0 && d2 != 0 && d3 != 0 {
                    return 1
                } else {
                    return 2
                }
                
            } else {
                return -1
            }
        } else {
            return 0
        }
    }
    
    
    private static func isCCW(a: Point, b: Point, c: Point) -> Int {
        let m0 = Int64(c.y - a.y) * Int64(b.x - a.x)
        let m1 = Int64(b.y - a.y) * Int64(c.x - a.x)
    
        if m0 < m1 {
            return -1
        } else if m0 > m1 {
            return 1
        } else {
            return 0
        }
    }
    
    
    private static func cross(a0: Point, a1: Point, b0: Point, b1: Point) -> Point {
        let dxA = Int64(a0.x - a1.x)
        let dyB = Int64(b0.y - b1.y)
        let dyA = Int64(a0.y - a1.y)
        let dxB = Int64(b0.x - b1.x)

        let divider = dxA * dyB - dyA * dxB
    
        assert(divider != 0)
        
        let xyA = CGFloat(a0.x * a1.y - a0.y * a1.x)
        let xyB = CGFloat(b0.x * b1.y - b0.y * b1.x)
        
        let  invert_divider: CGFloat = 1.0 / CGFloat(divider)
        
        let x = xyA * CGFloat(b0.x - b1.x) - CGFloat(a0.x - a1.x) * xyB
        let y = xyA * CGFloat(b0.y - b1.y) - CGFloat(a0.y - a1.y) * xyB
        
        return Point(x: Int(x * invert_divider), y: Int(y * invert_divider))
    }
    
}
