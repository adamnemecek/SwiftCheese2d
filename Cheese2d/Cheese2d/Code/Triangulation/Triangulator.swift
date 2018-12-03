//
//  Triangulator.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 03/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Triangulator {
    
    
    static func triangulate(path: [IndexPoint]) -> [Int] {
        let n = path.count
        let totalCount = n - 2
        
        var index = [Int]()
        index.reserveCapacity(totalCount)
        
        var count = 0
        var i = 0
        repeat {
            var leftIx = (i - 1 + n) % n
            var rightIx = (i + 1) % n
            
            var isCCW = Triangulator.isCCW(a: path[leftIx].point, b: path[i].point, c: path[rightIx].point)
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
                isCCW = Triangulator.isCCW(a: start, b: prev, c: next)
                prev = next
            }
            rightIx = nextIx
            
            // find left end
            nextIx = leftIx
            prev = path[leftIx].point
            while isCCW && nextIx != rightIx {
                nextIx = (nextIx - 1 + n) % n
                let next = path[nextIx].point
                isCCW = Triangulator.isCCW(a: start, b: next, c: prev)
                prev = next
            }
            leftIx = nextIx

        } while count < totalCount
        
        
        return index
    }

    private static func isCCW(a: Point, b: Point, c: Point) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
        
        return m0 < m1
    }
    
}
