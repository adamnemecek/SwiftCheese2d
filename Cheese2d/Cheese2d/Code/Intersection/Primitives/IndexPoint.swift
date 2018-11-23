//
//  IndexPoint.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 01/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct IndexPoint: Comparable {

    let index: Int
    let point: Point
    
    
    func scrDistance(stone: Point) -> PathMileStone {
        return PathMileStone(index: index, offset: point.sqrDistance(point: stone))
    }
    
    
    static func == (lhs: IndexPoint, rhs: IndexPoint) -> Bool {
        return lhs.point == rhs.point
    }
    
    
    static func < (lhs: IndexPoint, rhs: IndexPoint) -> Bool {
        return lhs.point < rhs.point
    }
}
