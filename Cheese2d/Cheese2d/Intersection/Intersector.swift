//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public class Intersector {

    public static func findPinPath(rootShape: [Vector2], slaveShape: [Vector2], precision: CGFloat = 0.001) -> [Vector2] {
        let slaveShapeLength = slaveShape.count
        let sqrPrecision = precision * precision
    
        var slaveBoxArea = BoxArea.empty

        var pinPointList = [Vector2]()
    
        var slaveSegmentsBoxArea: [BoxArea] = []
    
    
        var b: Vector2
        
        b = slaveShape[slaveShapeLength - 1]
    
        for i in 0...slaveShapeLength - 1 {
            let a = slaveShape[i]
            slaveBoxArea.assimilate(p: b)
    
            slaveSegmentsBoxArea.append(BoxArea(a: a, b: b))
            b = a
        }
    
    
        
        let rootShapeLength = rootShape.count
        b = rootShape[rootShapeLength - 1]
        
        for i in 0...rootShapeLength - 1 {
            let a = rootShape[i]
            let isIntersectionImpossible = slaveBoxArea.isNotIntersecting(a: a, b: b)

            if isIntersectionImpossible {
                b = a
                continue
            }

            let segmentBoxArea = BoxArea(a: a, b: b)

            var j = 0
            var prev_j = slaveShapeLength - 1
            while j < slaveShapeLength {
                let isIntersectionPossible = slaveSegmentsBoxArea[j].isInterscting(box: segmentBoxArea)
                
                if isIntersectionPossible {
                    let slaveStart = slaveShape[prev_j]
                    let slaveEnd = slaveShape[j]
                    
                    let sqrDistance = LineUtil.sqrDistanceToPoint(a: a, b: b, p: slaveEnd)
                    
                    if sqrDistance > sqrPrecision {
                        let intersectionTest = areSegmentsIntersecting(startA: b, endA: a, startB: slaveStart, endB: slaveEnd)
                        
                        if intersectionTest {
                            let intersectionPoint = Intersector.getIntersectionPoint(startA: b, endA: a, startB: slaveStart, endB: slaveEnd)
                            pinPointList.append(intersectionPoint)
                        }
                    }
                }
                
                prev_j = j
                j += 1
            }
            
            b = a
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
