//
//  PointConverter.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 06/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PointConverter {
    
    private let convertation_precision: CGFloat
    private let revert_convertation_precision: CGFloat
    
    init(precision: CGFloat) {
        self.convertation_precision = precision
        self.revert_convertation_precision = 1.0 / precision
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
            let iPoint = Point(x: Int64(p.x * revert_convertation_precision), y: Int64(p.y * revert_convertation_precision))
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
            points.append(CGPoint(x: CGFloat(p.x) * convertation_precision, y: CGFloat(p.y) * convertation_precision))
        }
        
        return points
    }
    
    
    func convert(point: Point) -> CGPoint {
        return CGPoint(x: CGFloat(point.x) * convertation_precision, y: CGFloat(point.y) * convertation_precision)
    }
    
    func convert(point: CGPoint) -> Point {
        return Point(x: Int64(point.x * revert_convertation_precision), y: Int64(point.y * revert_convertation_precision))
    }
    
}
