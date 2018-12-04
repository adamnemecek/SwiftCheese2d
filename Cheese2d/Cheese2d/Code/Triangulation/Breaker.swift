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
        
        //return []
        var path = map.vertex

        var n = path.count
        let totalCount = n - 2
        
        var index = [Int]()
        index.reserveCapacity(3 * totalCount)
        
        var count = 0
        var i = 0
        repeat {
            let start = path[i].point
            let prev = path[(i - 1 + n) % n].point
            var nextIx = (i + 1) % n
            var next0 = path[nextIx].point
            var isCCW = true
            repeat {
                nextIx = (nextIx + 1) % n
                let next1 = path[nextIx].point
                let isCCW0 = Triangle.isCCW(a: start, b: next0, c: next1)
                let isCCW1 = Triangle.isCCW(a: prev, b: start, c: next1)
                isCCW = isCCW0 && isCCW1
                next0 = next1
            } while isCCW && nextIx != i
            
            var endIx = (nextIx - 1 + n) % n
            
            let first = path[i]
            while map.isIntersected(a: first, b: path[endIx]) && i != endIx {
                endIx = (endIx - 1 + n) % n
            }
            
            let firstIx = path[i].index
            nextIx = (i + 1) % n
            var index0 = path[nextIx].index
            while nextIx != endIx {
                nextIx = (nextIx + 1) % n
                let index1 = path[nextIx].index
                index.append(firstIx)
                index.append(index0)
                index.append(index1)
                count += 1
                index0 = index1
            }
            
            i = (endIx + 1) % n
            
            if i < endIx {
                let length = endIx - i
                let range = endIx...n - 1
                var slice = path[range]
                slice.replaceSubrange(i...i + length, with: slice)
            } else if i > endIx {
                let length = i - endIx
                let range = endIx...n - 1
                var slice = path[range]
                slice.replaceSubrange(0...length, with: slice)
            }
            
            
            
            path = 

        } while count < totalCount
        
        
        return index
    }
}
