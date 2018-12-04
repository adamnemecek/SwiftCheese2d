//
//  Point+Array.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 02/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


extension Array where Iterator.Element == Point {
    
    func isClockWise() -> Bool {
        var sum: Int64 = 0
        var p1 = self[self.count - 1]
        for p2 in self {
            let difX = p2.x - p1.x
            let sumY = p2.y + p1.y
            sum += difX * sumY
            p1 = p2
        }
        
        return sum >= 0
    }
}
