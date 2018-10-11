//
//  Point+VectorExtension.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


extension Point {
    
    func mul(vector: Point) -> Int64 {
        return x * vector.x + vector.y * y
    }
}
