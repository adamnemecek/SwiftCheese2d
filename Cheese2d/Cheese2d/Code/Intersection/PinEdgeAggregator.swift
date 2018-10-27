//
//  PinEdgeAggregator.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 05/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinEdgeAggregator {
    
    private var pinEdges: [PinEdge]
    private let masterCount: Int
    
    init(edges: [PinEdge], masterCount: Int) {
        self.pinEdges = edges
        self.masterCount = masterCount
    }
    
    
    mutating func merge() -> [PinPath] {
        let n = pinEdges.count
        guard n > 0 else {
            return []
        }
        
        self.sort()
        
        var paths = [PinPath]()
        paths.reserveCapacity(n)

        var i = 0
        while i < n {
            let border = pinEdges[i]
            
            var v1 = border.v1
            
            var length = 1
            
            var j = i + 1
            
            while j < n {
                let next = pinEdges[j]
                
                // must be same or next edge
                if v1.point == next.v0.point {
                    j += 1
                    v1 = next.v1
                    length += 1
                } else {
                    break
                }
            }
            
            let path = PinPath(v0: border.v0, v1: v1, length: length)
            
            paths.append(path)
            
            i = j
        }
        
        if paths.count > 1 {
            let first = paths[0]
            let last = paths[paths.count - 1]
            
            if first.v0.point == last.v1.point {
                // TODO master path != slave path
                paths[0] = PinPath(v0: last.v0, v1: first.v1, length: first.length + last.length)
                paths.remove(at: paths.count - 1)
            }
        }

        return paths
    }
    
    mutating func sort() {
        // this array is already sorted by edge index
        
        let n = pinEdges.count
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = pinEdges[0]
            var i = 1
            while i < m {
                let b = pinEdges[i]
                if PathMileStone.compare(a: a.v0.masterMileStone, b: b.v0.masterMileStone) {
                    pinEdges[i - 1] = b
                    isNotSorted = true
                } else {
                    pinEdges[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            pinEdges[m] = a
        } while isNotSorted
    }

}
