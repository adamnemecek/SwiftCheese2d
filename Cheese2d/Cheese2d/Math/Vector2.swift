//
//  Vector2.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 06/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import CoreGraphics

public struct Vector2 {
    
    public let x: CGFloat
    public let y: CGFloat
    
    
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    
    init(radius: CGFloat, angle: CGFloat) {
        self.x = radius * cos(angle * .pi / 180.0)
        self.y = radius * sin(angle * .pi / 180.0)
    }    

    
    func scale(scale: CGFloat) -> Vector2 {
        return Vector2(x: scale * x, y: scale * y)
    }
    
    
    func sqrDistance(vector: Vector2) -> CGFloat {
        let dx = vector.x - x
        let dy = vector.y - y
        return dx * dx + dy * dy
    }
    
    
    func dot(vector: Vector2) -> CGFloat {
        return x * vector.y - y * vector.x
    }
    
    func mul(vector: Vector2) -> CGFloat {
        return x * vector.x + vector.y * y
    }
    
    
    func projection(vector: Vector2) -> Vector2 {
        let xx = x * x
        let yy = y * y
        let xy = x * y
        let invert_square_length = 1 / (xx + yy)
        let vx = (xx * vector.x + xy * vector.y) * invert_square_length
        let vy = (yy * vector.y + xy * vector.x) * invert_square_length
        
        return Vector2(x: vx, y: vy)
    }
    
    
    var length: CGFloat {
        return sqrt(x * x + y * y)
    }
    
    
    var normalize: Vector2 {
        let l = self.length
        return Vector2(x: x / l, y: y / l)
    }
    
    
    var description: String {
        return "(\(x), \(y))"
    }

}

func +(left: Vector2, right: Vector2) -> Vector2 {
    return Vector2(x: left.x + right.x, y: left.y + right.y)
}