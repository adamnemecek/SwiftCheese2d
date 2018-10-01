//
//  BPoint.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 01/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct BPoint {
    
    let index: Int
    let point: Point
    
    
    func isBigger(a: BPoint) -> Bool {
        if a.point.x != point.x {
            return a.point.x < point.x
        } else {
            return a.point.y < point.y
        }
    }

}
