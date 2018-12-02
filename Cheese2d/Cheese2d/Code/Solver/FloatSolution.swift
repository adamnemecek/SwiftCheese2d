//
//  FloatSolution.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct FloatSolution {
    
    public let polygons: [FloatPolygon]
    public let disposition: Disposition
 
    
    init(solution: Solution, converter: PointConverter) {
        var polygons = [FloatPolygon]()
        polygons.reserveCapacity(solution.polygons.count)
        for polygon in solution.polygons {
            let path = converter.convert(iPoints: polygon.path)
            polygons.append(FloatPolygon(path: path, isHole: polygon.isHole))
        }
        
        self.polygons = polygons
        self.disposition = solution.disposition
    }
    
}
