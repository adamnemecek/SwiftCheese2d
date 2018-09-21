//
//  CGPoint+extension.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import CoreGraphics

public extension CGPoint {

    public init(vector: Vector2) {
        self.init(x: vector.x, y: vector.y)
    }
    
}
