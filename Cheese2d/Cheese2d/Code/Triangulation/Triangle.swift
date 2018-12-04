//
//  Triangle.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 04/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct Triangle {

    static func isCCW(a: Point, b: Point, c: Point) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
        
        return m0 < m1
    }
}
