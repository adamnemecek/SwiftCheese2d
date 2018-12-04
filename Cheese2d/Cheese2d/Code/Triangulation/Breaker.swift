//
//  Breaker.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 03/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Breaker {
    
    
    static func triangulate(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> [Int] {
        let map = PolygonMap(points: points, converter: converter)
        
        return Breaker.triangulate(map: map)
    }
    
    
    private static func triangulate(map: PolygonMap) -> [Int] {
        var path = map.vertex

        let n = path.count
        let totalCount = n - 2
        
        var index = [Int]()
        index.reserveCapacity(3 * totalCount)
        
        var count = 0
        var i = 0
        repeat {
            var leftIx = (i - 1 + n) % n
            var rightIx = (i + 1) % n
            
            var isCCW = Triangle.isCCW(a: path[leftIx].point, b: path[i].point, c: path[rightIx].point)
            if !isCCW {
                i = rightIx
                continue
            }
            
            let start = path[i].point

            // find right end
            var nextIx = rightIx
            var prev = path[rightIx].point
            while isCCW && nextIx != leftIx {
                nextIx = (nextIx + 1) % n
                let next = path[nextIx].point
                isCCW = Triangle.isCCW(a: start, b: prev, c: next)
                prev = next
            }
            rightIx = nextIx
            
            // find left end
            nextIx = leftIx
            prev = path[leftIx].point
            while isCCW && nextIx != rightIx {
                nextIx = (nextIx - 1 + n) % n
                let next = path[nextIx].point
                isCCW = Triangle.isCCW(a: start, b: next, c: prev)
                prev = next
            }
            leftIx = nextIx

            while map.isIntersected(a: path[leftIx], b: path[rightIx]) && leftIx != rightIx {
                leftIx = (i + 1) % n
            }
            
            let first = leftIx
            leftIx = (i + 1) % n
            while leftIx != rightIx {
                let j = 3 * count
                index[j] = first
                index[j + 1] = leftIx
                index[j + 2] = rightIx
                count += 1
            }

        } while count < totalCount
        
        
        return index
    }
}
