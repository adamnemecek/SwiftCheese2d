//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public class Intersector {

    public static func findPinPath(master: [Vector2], slave: [Vector2], precision: CGFloat = 0.001) -> [Vector2] {
        let slaveLength = slave.count
        let sqrPrecision = precision * precision
    
        var slaveBoxArea = BoxArea.empty

        var pinPointList = [Vector2]()
    
        var slaveSegmentsBoxArea: [BoxArea] = []
    
        var b = slave[slaveLength - 1]
    
        for i in 0...slaveLength - 1 {
            let master_0 = slave[i]
            slaveBoxArea.assimilate(p: b)
    
            slaveSegmentsBoxArea.append(BoxArea(a: master_0, b: b))
            b = master_0
        }
    
    
        
        let masterLength = master.count
        var master_x = master[masterLength - 1]
        
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
                    let slave_0 = slave[prev_j]
                    let slave_x = slave[j]
                    
                    let sqrDistance = LineUtil.sqrDistanceToPoint(a: master_0, b: master_x, p: slave_x)
                    
                    if sqrDistance > sqrPrecision {
                        let intersectionTest = areSegmentsIntersecting(startA: master_x, endA: master_0, startB: slave_0, endB: slave_x)
                        
                        if intersectionTest {
                            let intersectionPoint = Intersector.getIntersectionPoint(startA: master_x, endA: master_0, startB: slave_0, endB: slave_x)
                            pinPointList.append(intersectionPoint)
                        }
                    }
                }
                
                prev_j = j
                j += 1
            }
            
            master_x = master_0
        }

        return pinPointList
    }
    
    
    private static func areSegmentsIntersecting(startA: Vector2, endA: Vector2, startB: Vector2, endB: Vector2) -> Bool {
        let t0 = Intersector.arePointsCCW(a: startA, b: startB, c: endB)
        let t1 = Intersector.arePointsCCW(a: endA, b: startB, c: endB)
        let t2 = Intersector.arePointsCCW(a: startA, b: endA, c: startB)
        let t3 = Intersector.arePointsCCW(a: startA, b: endA, c: endB)
    
        return (t0 != t1) && (t2 != t3);
    }
    
    
    private static func arePointsCCW(a: Vector2, b: Vector2, c: Vector2) -> Bool {
        let d0 = (c.y - a.y) * (b.x - a.x)
        let d1 = (b.y - a.y) * (c.x - a.x)
    
        return d0 < d1;
    }
    
    
    private static func getIntersectionPoint(startA: Vector2, endA: Vector2, startB: Vector2, endB: Vector2) -> Vector2 {
    
        let divider = (startA.x - endA.x) * (startB.y - endB.y) - (startA.y - endA.y) * (startB.x - endB.x);
    
        if divider != 0.0 {
            let xyA = startA.x * endA.y - startA.y * endA.x
            let xyB = startB.x * endB.y - startB.y * endB.x
    
            let  invert_divider = 1.0 / divider
    
            let x = xyA * (startB.x - endB.x) - (startA.x - endA.x) * xyB
            let y = xyA * (startB.y - endB.y) - (startA.y - endA.y) * xyB
    
            return Vector2(x: x * invert_divider, y: y * invert_divider)
        }
    
        return 0.5 * (startA + endA)
    }
    
}
