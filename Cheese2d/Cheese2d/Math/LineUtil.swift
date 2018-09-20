//
//  LineUtil.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import CoreGraphics


struct LineUtil {
    
    static func sqrDistanceToPoint(a: Vector2, b: Vector2, p: Vector2) -> CGFloat {
        let vecBA = Vector2(x: a.x - b.x, y: a.y - b.y)
        let vecBP = Vector2(x: p.x - b.x, y: p.y - b.y)
        let vecBO = vecBA.projection(vector: vecBP)
        let dx = p.x - (vecBO.x + b.x)
        let dy = p.y - (vecBO.y + b.y)
    
        return dx * dx + dy * dy
    }
    
    
    static func distanceToPoint(a: Vector2, b: Vector2, p: Vector2) -> CGFloat {
        return sqrt(sqrDistanceToPoint(a: a, b: b, p: p))
    }
/*
    static func isContain(a: Vector2, b: Vector2, p: Vector2, sqrPrecision: CGFloat) -> Bool {
        let vecBA = Vector2(x: a.x - b.x, y: a.y - b.y)
        let vecBP = Vector2(x: p.x - b.x, y: p.y - b.y)
        let vecBO = vecBA.projection(vector: vecBP)
        let dx = p.x - (vecBO.x + b.x)
        let dy = p.y - (vecBO.y + b.y)
        
        let sqrDistance = dx * dx + dy * dy
        
        guard sqrDistance < sqrPrecision else {
            return false
        }
        
        
    }
    */
    
}
