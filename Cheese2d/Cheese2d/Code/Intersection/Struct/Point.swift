//
//  Point.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 26/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Point: Equatable {
    
    static let zero = Point(x: 0, y: 0)
    
    var x: Int64
    var y: Int64

    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Point: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return self.description
    }
    
    
    public var description: String {
        return "(\(CGFloat(x) * DataNormalizer.convertation_precision), \(CGFloat(y) * DataNormalizer.convertation_precision))"
    }
    
}
