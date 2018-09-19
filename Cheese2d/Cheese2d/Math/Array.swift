//
//  Array.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 19/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public extension Array where Element == CGPoint {
    
    public func convert() -> [Vector2] {
        var vectors = [Vector2]()
        for p in self {
            vectors.append(Vector2(point: p))
        }
        return vectors
    }
    
}

public extension Array where Element == Vector2 {
    
    public func convert() -> [CGPoint] {
        var points = [CGPoint]()
        for v in self {
            points.append(CGPoint(vector: v))
        }
        return points
    }
    
}
