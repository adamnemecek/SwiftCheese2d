//
//  PathMileStone.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 12/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PathMileStone {
    
    let index: Int
    let offset: Int64
 
    
    static func compare(a: PathMileStone, b: PathMileStone) -> Bool {
        if a.index != b.index {
            return a.index > b.index
        } else {
            return a.offset > b.offset
        }
    }
}