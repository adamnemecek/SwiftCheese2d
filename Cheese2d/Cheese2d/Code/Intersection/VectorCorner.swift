//
//  VectorCorner.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct VectorCorner {
    
    let basis: Point
    let dir: Point
    let spin: Point
    let projection: Int64
    let isCWS: Bool
    
    
    public init(o: CGPoint, a: CGPoint, b: CGPoint) {
        let o = DataNormalizer.convert(point: o)
        let a = DataNormalizer.convert(point: a)
        let b = DataNormalizer.convert(point: b)
        
        self.init(o: o, a: a, b: b)
    }
    

    init(o: Point, a: Point, b: Point) {
        spin = o
        
        dir = a
        basis = VectorCorner.normal(vec: Point(x: spin.x - dir.x, y: spin.y - dir.y))
        
        let satellite = VectorCorner.normal(vec: Point(x: spin.x - b.x, y: spin.y - b.y))
        
        self.projection = basis.mul(vector: satellite)
        self.isCWS = VectorCorner.isCCWDirection(a: dir, b: spin, c: b)
    }
    
    
    public func isBetween(p: CGPoint) -> Bool {
        return isBetween(p: DataNormalizer.convert(point: p))
    }
    
    
    func isBetween(p: Point) -> Bool {
        print("----- isBetween")
        let target = VectorCorner.normal(vec: Point(x: spin.x - p.x, y: spin.y - p.y))
        let targetProjection = basis.mul(vector: target)
        let isTragetCWS = VectorCorner.isCCWDirection(a: dir, b: spin, c: p)

        let result: Bool
        
        if self.isCWS && isTragetCWS {
            result = targetProjection > self.projection
            print("case 1")
        } else if (!self.isCWS && !isTragetCWS) {
            result = targetProjection < self.projection
            print("case 2")
        } else {
            result = !self.isCWS
            print("case 3")
        }
        
        print("isCWS \(isCWS)")
        print("result \(result)")
        
        return result
    }
    
    
   
    private static func isCCWDirection(a: Point, b: Point, c: Point) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
        
        return m0 < m1
    }
    
    
    private static func normal(vec: Point) -> Point {
        var p = DataNormalizer.convert(point: vec)
        let l = sqrt(p.x * p.x + p.y * p.y)
        let k = 1 / l
        p.x *= k
        p.y *= k
        
        return DataNormalizer.convert(point: p)
    }
}

extension Point {
    
    fileprivate func mul(vector: Point) -> Int64 {
        return x * vector.x + vector.y * y
    }

}

