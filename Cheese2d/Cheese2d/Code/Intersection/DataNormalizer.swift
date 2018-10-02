//
//  DataNormalizer.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 26/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


class DataNormalizer {
    
    static let convertation_precision: CGFloat = 0.0001
    static let revert_convertation_precision: CGFloat = 10000
    
    static func convert(points: [CGPoint]) -> [Point] {
        let n = points.count
        
        var iPoints = Array<Point>()
        iPoints.reserveCapacity(n)
        
        var i = 0
        var prev = Point(x: Int.max, y: Int.max)
        while i < n {
            let p = points[i]
            i += 1
            let iPoint = Point(x: Int(p.x * revert_convertation_precision), y: Int(p.y * revert_convertation_precision))
            if iPoint.x != prev.x || iPoint.y != prev.y {
                iPoints.append(iPoint)
                prev = iPoint
            }
        }
        
        return iPoints
    }
    
    
    static func convert(iPoints: [Point]) -> [CGPoint] {
        var points = Array<CGPoint>()
        points.reserveCapacity(iPoints.count)
        for p in iPoints {
            points.append(CGPoint(x: CGFloat(p.x) * convertation_precision, y: CGFloat(p.y) * convertation_precision))
        }
        
        return points
    }
    
    
    static func convert(point: Point) -> CGPoint {
        return CGPoint(x: CGFloat(point.x) * convertation_precision, y: CGFloat(point.y) * convertation_precision)
    }
    
    static func convert(point: CGPoint) -> Point {
        return Point(x: Int(point.x * revert_convertation_precision), y: Int(point.y * revert_convertation_precision))
    }

}
