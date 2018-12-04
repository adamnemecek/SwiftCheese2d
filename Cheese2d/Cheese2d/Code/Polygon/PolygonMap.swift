//
//  PolygonMap.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 04/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PolygonMap {
    
    let vertex: [IndexPoint]

    init(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) {
        var vertex = [IndexPoint]()
        vertex.reserveCapacity(points.count)
        var i = 0
        for point in points {
            vertex.append(IndexPoint(index: i, point: converter.convert(point: point)))
            i += 1
        }
        
        self.vertex = vertex
    }
    
    
    init(vertex: [IndexPoint]) {
        self.vertex = vertex
    }
    
    
    func isIntersected(a: IndexPoint, b: IndexPoint) -> Bool {
        var i = 0
        let n = vertex.count
        var d = vertex[n - 1]
        while i < n {
            let c = vertex[i]
            
            if a.index != c.index && a.index != d.index && b.index != c.index && b.index != d.index {
                if PolygonMap.areSegmentsIntersecting(a: a, b: b, c: c, d: d) {
                    return true
                }
            }
            d = c
            i += 1
        }
        
        return false
    }
    
    private static func areSegmentsIntersecting(a: IndexPoint, b: IndexPoint, c: IndexPoint, d: IndexPoint) -> Bool {
        return Triangle.isCCW(a: a.point, b: c.point, c: d.point) != Triangle.isCCW(a: b.point, b: c.point, c: d.point)
            && Triangle.isCCW(a: a.point, b: b.point, c: c.point) != Triangle.isCCW(a: a.point, b: c.point, c: d.point)
    }

}
