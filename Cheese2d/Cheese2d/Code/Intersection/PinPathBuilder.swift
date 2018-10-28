//
//  PinPathBuilder.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 05/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinPathBuilder {
    
    private var pinEdges: [PinEdge]
    
    init(edges: [PinEdge]) {
        self.pinEdges = edges
    }
    
    
    mutating func build(master: [Point], slave: [Point]) -> [PinPath] {
        let n = pinEdges.count
        guard n > 0 else {
            return []
        }
        
        self.sort()
        
        var mergedEdges = [PinEdge]()
        mergedEdges.reserveCapacity(n)

        var i = 0
        while i < n { // todo repeat
            let edge = pinEdges[i]
            
            var v1 = edge.v1
            
            var j = i + 1
            
            while j < n {
                let next = pinEdges[j]
                
                // must be same or next edge
                if v1.point == next.v0.point {
                    j += 1
                    v1 = next.v1
                } else {
                    break
                }
            }
            
            let path = PinEdge(v0: edge.v0, v1: v1)
            
            mergedEdges.append(path)
            
            i = j
        }
        
        if mergedEdges.count > 1 {
            let first = mergedEdges[0]
            let last = mergedEdges[mergedEdges.count - 1]
            
            if first.v0.point == last.v1.point {

                mergedEdges[0] = PinEdge(v0: last.v0, v1: first.v1)
                mergedEdges.remove(at: mergedEdges.count - 1)
            }
        }
        
        let pathList = self.buildPath(edges: mergedEdges, master: master, slave: slave)

        return pathList
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


    private func buildPath(edges: [PinEdge], master: [Point], slave: [Point]) -> [PinPath] {
        var pathList = [PinPath]()
        pathList.reserveCapacity(edges.count)
        for edge in edges {
            let path = PinPath(v0: edge.v0, v1: edge.v1, type: 0)
            pathList.append(path)
        }
        
        return pathList
    }
    
    
}
