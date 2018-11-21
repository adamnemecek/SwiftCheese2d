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
    private let converter: PointConverter
    
    init(edges: [PinEdge], converter: PointConverter) {
        self.pinEdges = edges
        self.converter = converter
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
            
            let path = PinEdge(v0: edge.v0, v1: v1, interposition: edge.interposition)
            
            mergedEdges.append(path)
            
            i = j
        }
        
        if mergedEdges.count > 1 {
            let first = mergedEdges[0]
            let last = mergedEdges[mergedEdges.count - 1]
            
            if first.v0.point == last.v1.point {

                mergedEdges[0] = PinEdge(v0: last.v0, v1: first.v1, interposition: first.interposition)
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
            let type = self.getType(edge: edge, master: master, slave: slave)
            let path = PinPath(v0: edge.v0, v1: edge.v1, type: type)
            pathList.append(path)
        }
        
        return pathList
    }
    
    private func getType(edge: PinEdge, master: [Point], slave: [Point]) -> Int {

        let type0 = self.getStartDisposition(vertex: edge.v0, master: master, slave: slave, iterposition: edge.interposition)
        let type1 = self.getEndDisposition(vertex: edge.v1, master: master, slave: slave, iterposition: edge.interposition)
        
        if type0 == PinPoint.null || type1 == PinPoint.null {
            if type0 > 0 || type1 > 0 {
                return PinPoint.inside
            } else if type0 < 0 || type1 < 0 {
                return PinPoint.outside
            } else {
                fatalError("impossible")
            }
        }
        
        
        if type0 == PinPoint.in_null && type1 == PinPoint.null_in || type1 == PinPoint.in_null && type0 == PinPoint.null_in {
            return PinPoint.inside
        }
        
        if type0 == PinPoint.out_null && type1 == PinPoint.null_out || type1 == PinPoint.out_null && type0 == PinPoint.null_out {
            return PinPoint.outside
        }
        
        if type0 == PinPoint.out_null && type1 == PinPoint.null_in || type1 == PinPoint.out_null && type0 == PinPoint.null_in {
            return PinPoint.out_in
        }
        
        if type0 == PinPoint.in_null && type1 == PinPoint.null_out || type1 == PinPoint.in_null && type0 == PinPoint.null_out {
            return PinPoint.in_out
        }
        
        fatalError("impossible")
    }
    
    
    private struct Disposition {
        
        let isSameDirection: Bool
        
        let isBetween: Bool
        
    }
    
    private func getStartDisposition(vertex: PinPoint, master: [Point], slave: [Point], iterposition: Int) -> Int {
        
        let i = vertex.slaveMileStone.index
        let n = slave.count
        let s: Point

        if iterposition != 1 {
            if vertex.slaveMileStone.offset != 0 {
                s = slave[i]
            } else {
                s = slave[(i + 1 + n) % n]
            }
        } else {
            s = slave[(i - 1 + n) % n]
        }
        
        
        
        let corner = PinPathBuilder.buildCorner(vertex: vertex, master: master, converter: converter)

        if corner.isOnBorder(p: s) {
            return PinPoint.null
        }
        
        let isBetween = corner.isBetween(p: s, clockwise: true)
        
        let type: Int

        if iterposition == 1 {
            if isBetween {
                type = PinPoint.in_null
            } else {
                type = PinPoint.out_null
            }
        } else {
            if isBetween {
                type = PinPoint.null_out
            } else {
                type = PinPoint.null_in
            }
        }
        
        return type
    }
    
    
    private func getEndDisposition(vertex: PinPoint, master: [Point], slave: [Point], iterposition: Int) -> Int {

        let i = vertex.slaveMileStone.index
        let n = slave.count
        let s: Point
        
        if iterposition != 1 {
            if vertex.slaveMileStone.offset != 0 {
                s = slave[i]
            } else {
                s = slave[(i - 1 + n) % n]
            }
        } else {
            s = slave[(i + 1) % n]
        }

        
        let corner = PinPathBuilder.buildCorner(vertex: vertex, master: master, converter: converter)
        
        if corner.isOnBorder(p: s) {
            return PinPoint.null
        }
        
        let isBetween = corner.isBetween(p: s, clockwise: true)
        
        let type: Int
        
        if iterposition == 1 {
            if isBetween {
                type = PinPoint.null_out
            } else {
                type = PinPoint.null_in
            }
        } else {
            if isBetween {
                type = PinPoint.in_null
            } else {
                type = PinPoint.out_null
            }
        }
        
        return type
    }
    
    
    private static func buildCorner(vertex: PinPoint, master: [Point], converter: PointConverter) -> Corner {
        let mi = vertex.masterMileStone.index
        let mn = master.count
        let m0: Point
        let m1 = vertex.point
        let m2 = master[(mi + 1) % mn]
        
        if vertex.masterMileStone.offset != 0 {
            m0 = master[mi]
        } else {
            m0 = master[(mi - 1 + mn) % mn]
        }

        return Corner(o: m1, a: m0, b: m2, converter: converter)
    }
    
    
}
