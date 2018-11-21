//
//  Corner.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Corner {
    
    private let basis: Point
    private let a: Point
    private let b: Point
    private let o: Point
    private let projection: Int64
    private let isCWS: Bool
    private let converter: PointConverter
    
    
    public init(o: CGPoint, a: CGPoint, b: CGPoint, converter: PointConverter = PointConverter()) {
        let o = converter.convert(point: o)
        let a = converter.convert(point: a)
        let b = converter.convert(point: b)
        
        self.init(o: o, a: a, b: b, converter: converter)
    }
    

    init(o: Point, a: Point, b: Point, converter: PointConverter) {
        self.o = o
        self.a = a
        self.b = b
        self.basis = Corner.normal(vec: Point(x: o.x - a.x, y: o.y - a.y), converter: converter)
        
        let satellite = Corner.normal(vec: Point(x: o.x - b.x, y: o.y - b.y), converter: converter)
        
        self.projection = basis.mul(vector: satellite)
        self.isCWS = Corner.isCCWDirection(a: a, b: o, c: b)
        self.converter = converter
    }
    
    
    public func isBetween(p: CGPoint, clockwise: Bool = false) -> Bool {
        return isBetween(p: converter.convert(point: p), clockwise: clockwise)
    }
    
    
    func isBetween(p: Point, clockwise: Bool = false) -> Bool {
        let target = Corner.normal(vec: Point(x: o.x - p.x, y: o.y - p.y), converter: converter)
        let targetProjection = basis.mul(vector: target)
        let isTragetCWS = Corner.isCCWDirection(a: a, b: o, c: p)

        let result: Bool
        
        if self.isCWS && isTragetCWS {
            result = targetProjection > self.projection
        } else if (!self.isCWS && !isTragetCWS) {
            result = targetProjection < self.projection
        } else {
            result = !self.isCWS
        }

        return result != clockwise
    }

    func isOnBorder(p: CGPoint) -> Bool {
        return isOnBorder(p: converter.convert(point: p))
    }
    
    
    func isOnBorder(p: Point) -> Bool {
        let dir = p - o
        let testA = Corner.isSameDirection(a: a - o, b: dir)
        let testB = Corner.isSameDirection(a: b - o, b: dir)

        return testA || testB
    }
    
    private static func isSameDirection(a: Point, b: Point) -> Bool {
        let isSameLine = a.x * b.y == a.y * b.x
        let isSameDirection = a.x * b.x >= 0 && a.y * b.y >= 0
        return isSameLine && isSameDirection
    }
    
    
    private static func isCCWDirection(a: Point, b: Point, c: Point) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
        
        return m0 < m1
    }
    
    
    private static func normal(vec: Point, converter: PointConverter) -> Point {
        var p = converter.convert(point: vec)
        let l = sqrt(p.x * p.x + p.y * p.y)
        let k = 1 / l
        p.x *= k
        p.y *= k
        
        return converter.convert(point: p)
    }
}

extension Point {
    
    fileprivate func mul(vector: Point) -> Int64 {
        return x * vector.x + vector.y * y
    }

}

