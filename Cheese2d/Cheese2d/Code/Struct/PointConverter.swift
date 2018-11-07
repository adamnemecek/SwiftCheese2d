//
//  PointConverter.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 06/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public struct PointConverter {
    
    public static let defaultConverter = PointConverter()
    public static let defaultPrecision: CGFloat = 0.0001
    
    private let directConvertationScale: CGFloat
    private let revertConvertationScale: CGFloat
    
    public init(precision: CGFloat = PointConverter.defaultPrecision) {
        self.directConvertationScale = precision
        self.revertConvertationScale = 1.0 / precision
    }
    
    func convert(points: [CGPoint]) -> [Point] {
        let n = points.count
        
        var iPoints = Array<Point>()
        iPoints.reserveCapacity(n)
        
        var i = 0
        var prev = Point(x: Int64.max, y: Int64.max)
        while i < n {
            let p = points[i]
            i += 1
            let iPoint = Point(x: Int64(p.x * revertConvertationScale), y: Int64(p.y * revertConvertationScale))
            if iPoint.x != prev.x || iPoint.y != prev.y {
                iPoints.append(iPoint)
                prev = iPoint
            }
        }
        
        return iPoints
    }
    
    
    func convert(iPoints: [Point]) -> [CGPoint] {
        var points = Array<CGPoint>()
        points.reserveCapacity(iPoints.count)
        for p in iPoints {
            points.append(CGPoint(x: CGFloat(p.x) * directConvertationScale, y: CGFloat(p.y) * directConvertationScale))
        }
        
        return points
    }
    
    
    func convert(point: Point) -> CGPoint {
        return CGPoint(x: CGFloat(point.x) * directConvertationScale, y: CGFloat(point.y) * directConvertationScale)
    }
    
    func convert(point: CGPoint) -> Point {
        return Point(x: Int64(point.x * revertConvertationScale), y: Int64(point.y * revertConvertationScale))
    }
    
}
