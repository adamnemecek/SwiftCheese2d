//
//  EdgeLine.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 24/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct EdgeLine {
    
    private let k: CGFloat
    private let b: CGFloat
    private let type: Int // 0 - default line, 1 - line || Oy
    
    
    init(p0: Vector2, p1: Vector2, precision: CGFloat = 0.0001) {
        let dx = p0.x - p1.x
        if dx * dx > precision * precision {
            type = 0
            k = (p0.y - p1.y) / dx
            b = p0.y - k * p0.x
        } else {
            type = 1
            b = p0.x
            k = 0
        }
    }
    
    
    func isParallel(p0: Vector2, p1: Vector2, sqrPrecision: CGFloat = 0.00_000_001) -> Bool {
        if type == 0 {
            let y0 = k * p0.x + b
            let y1 = k * p1.x + b
            let dy0 = p0.y - y0
            let dy1 = p1.y - y1
            
            return dy0 * dy0 < sqrPrecision && dy1 * dy1 < sqrPrecision
        } else {
            let dx0 = b - p0.x
            let dx1 = b - p1.x
            
            return dx0 * dx0 < sqrPrecision && dx1 * dx1 < sqrPrecision
        }
    }
    
}
