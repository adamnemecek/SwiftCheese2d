//
//  Solution.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 08/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Solution {
    
    public let polygons: [Polygon]
    public let disposition: Disposition

    
    init(polygons: [Polygon], disposition: Disposition) {
        self.polygons = polygons
        self.disposition = disposition
    }
}
