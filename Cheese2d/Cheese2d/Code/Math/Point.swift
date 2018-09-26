//
//  Point.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 26/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct Point {
    
    static let zero = Point(x: 0, y: 0)
    
    var x: Int
    var y: Int

}

extension Point: CustomStringConvertible {
    
    var description: String {
        return "(\(CGFloat(x) * DataNormalizer.convertation_precision), \(CGFloat(y) * DataNormalizer.convertation_precision))"
    }
    
}
