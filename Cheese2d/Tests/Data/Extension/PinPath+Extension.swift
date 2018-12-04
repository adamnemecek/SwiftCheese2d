//
//  PinPath+Extension.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 28/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

extension PinPath {
    
    func extract(points: [Point], converter: PointConverter) -> [CGPoint] {
        let n = points.count
        
        let length = getLength(count: n)
        
        guard length > 1 else {
            return [converter.convert(point: v0.point), converter.convert(point: v1.point)]
        }
        
        guard length != 2 else {
            let middle = converter.convert(point: points[(v0.masterMileStone.index + 1 ) % n])
            return [converter.convert(point: v0.point), middle, converter.convert(point: v1.point)]
        }
        
        var path = [CGPoint]()
        path.reserveCapacity(length + 1)
        path.append(converter.convert(point: v0.point))
        
        
        var i = (v0.masterMileStone.index + 1) % n
        let endIndex: Int
        if v1.masterMileStone.offset != 0 {
            endIndex = v1.masterMileStone.index
        } else {
            endIndex = (v1.masterMileStone.index - 1 + n) % n
        }
        
        while i != endIndex {
            path.append(converter.convert(point: points[i]))
            i = (i + 1) % n
        }
        path.append(converter.convert(point: points[endIndex]))
        
        path.append(converter.convert(point: v1.point))
        
        return path
    }
    
}
