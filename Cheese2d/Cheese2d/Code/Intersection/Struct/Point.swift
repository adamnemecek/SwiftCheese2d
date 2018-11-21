//
//  Point.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 26/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Point: Equatable, Comparable {
    
    static let zero = Point(x: 0, y: 0)
    
    var x: Int64
    var y: Int64
    
    func sqrDistance(point: Point) -> Int64 {
        let dx = point.x - self.x
        let dy = point.y - self.y
        
        return dx * dx + dy * dy
    }
    
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    
    public static func < (lhs: Point, rhs: Point) -> Bool {
        if lhs.x != rhs.x {
            return lhs.x < rhs.x
        } else {
            return lhs.y < rhs.y
        }
    }
    
    static func +(left: Point, right: Point) -> Point {
        return Point(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func -(left: Point, right: Point) -> Point {
        return Point(x: left.x - right.x, y: left.y - right.y)
    }
}



extension Point: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return self.description
    }
    
    
    public var description: String {
        let point = PointConverter.defaultConverter.convert(point: self)
        return "(\(point.x), \(point.y))"
    }
    
}
