//
//  Polygon.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 24/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct Polygon {
    
    static func normalize(points: [Vector2], minLength: CGFloat) -> [Vector2] {
        let n = points.count
        guard let else {
            return points
        }
        
        let sqrMinLength = minLength * minLength
        
        var a = points[n - 1]
        var indexToRemove = [Int]()
        
        for i in 0...n-1 {
            let b = points[i]
            if !a.isNear(vector: b, sqrDistance: sqrMinLength) {
                a = b
            } else {
                indexToRemove.append(i)
            }
        }

        if indexToRemove.count > 0 {
            var i = indexToRemove.count
            while i >= 0 {
                points.remove(at: indexToRemove)
                i -= 1
            }
        }
        
        return points
    }
    
    
}
