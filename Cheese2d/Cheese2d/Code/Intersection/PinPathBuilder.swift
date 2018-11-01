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
    
    private func getType(v0: PinPoint, master: [Point], slave: [Point]) -> Int {

        let mi = v0.masterMileStone.index
        let mn = master.count
        let m0: Point
        let m1 = v0.point
        let m2 = master[(mi + 1) % mn]
        
        if v0.masterMileStone.offset != 0 {
            m0 = master[mi]
        } else {
            m0 = master[(mi - 1 + mn) % mn]
        }

        let si = v0.slaveMileStone.index
        let sn = slave.count
        let s0: Point
        let s1 = v0.point
        let s2 = slave[(si + 1) % sn]
        
        if v0.slaveMileStone.offset != 0 {
            s0 = slave[si]
        } else {
            s0 = slave[(si - 1 + sn) % sn]
        }
        
        let isSameDirection = (s1 < s2) == (m1 > m2)
        
        let corner = Corner(o: m1, a: m0, b: m2)
        
        let isBetween = corner.isBetween(p: s0)
        
        
        if isSameDirection {
            if isBetween {
                return PinPoint.null_in
            } else {
                return PinPoint.null_out
            }
        } else {
            if isBetween {
                return PinPoint.null_in
            } else {
                return PinPoint.null_out
            }
        }
    }
    
    
}
