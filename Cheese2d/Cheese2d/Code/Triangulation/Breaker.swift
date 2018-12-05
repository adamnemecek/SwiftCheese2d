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
            
            if n == 3 {
                index.append(path[0].index)
                index.append(path[1].index)
                index.append(path[2].index)
                break
            }
            
            
            let start = path[i].point
            let prev = path[(i - 1 + n) % n].point
            var nextIx = (i + 1) % n
            var next0 = path[nextIx].point
            var isCCW = true
            repeat {
                nextIx = (nextIx + 1) % n
                let next1 = path[nextIx].point
                let isCCW0 = Triangle.isCCW(a: start, b: next0, c: next1)
                //let isCCW1 = Triangle.isCCW(a: prev, b: start, c: next1)
                isCCW = isCCW0 //&& isCCW1
                next0 = next1
            } while isCCW && nextIx != i
            
            var endIx = (nextIx - 2 + n) % n
            
            let first = path[i]
            while map.isIntersected(a: first, b: path[endIx]) && i != endIx {
                endIx = (endIx - 1 + n) % n
            }
            
            nextIx = (i + 1) % n
            if nextIx == endIx {
                i = (i + 1) % n
                continue
            }
            
            let firstIx = path[i].index
            
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
            
            let a = (i + 1) % n
            let b = (endIx - 1 + n) % n
            
            if a <= b {
                path.removeSubrange(a...b)
            } else {
                path.removeSubrange(a...n - 1)
                path.removeSubrange(0...b)
            }
            n = path.count

            i = (i + 1) % n

        } while count < totalCount
        
        
        return index
    }
}
