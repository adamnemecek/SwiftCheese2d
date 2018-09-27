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
        
        let posMatrix = self.buildPossibilityMatrix(master: iMaster, slave: iSlave)

        let masterIndices = posMatrix.masterIndices
        let slaveIndices = posMatrix.adjacencies

        
        
        
        return []
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

    
    
    
    // 1 - intersecting, -1 not intersecting, 0 same line
    private static func disposition(startA: Point, endA: Point, startB: Point, endB: Point) -> Int {
        let d0 = Intersector.isCCW(a: startA, b: startB, c: endB)
        let d1 = Intersector.isCCW(a: endA, b: startB, c: endB)
        let d2 = Intersector.isCCW(a: startA, b: endA, c: startB)
        let d3 = Intersector.isCCW(a: startA, b: endA, c: endB)
    
        if d0 != 0 && d1 != 0 && d2 != 0 && d3 != 0 {
            let t0 = d0 < 0
            let t1 = d1 < 0
            let t2 = d2 < 0
            let t3 = d3 < 0
            
            if (t0 != t1) && (t2 != t3) {
                return 1
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
    
    
    private static func cross(startA: Point, endA: Point, startB: Point, endB: Point) -> Point {
        let dxA = Int64(startA.x - endA.x)
        let dyB = Int64(startB.y - endB.y)
        let dyA = Int64(startA.y - endA.y)
        let dxB = Int64(startB.x - endB.x)

        let divider = dxA * dyB - dyA * dxB
    
        assert(divider == 0)
        
        let xyA = CGFloat(startA.x * endA.y - startA.y * endA.x)
        let xyB = CGFloat(startB.x * endB.y - startB.y * endB.x)
        
        let  invert_divider: CGFloat = 1.0 / CGFloat(divider)
        
        let x = xyA * CGFloat(startB.x - endB.x) - CGFloat(startA.x - endA.x) * xyB
        let y = xyA * CGFloat(startB.y - endB.y) - CGFloat(startA.y - endA.y) * xyB
        
        return Point(x: Int(x * invert_divider), y: Int(y * invert_divider))
    }
    
}
