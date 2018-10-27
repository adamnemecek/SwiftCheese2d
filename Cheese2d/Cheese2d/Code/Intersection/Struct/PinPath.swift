//
//  PinPath.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinPath {
    // Edge
    let v0: PinPoint
    let v1: PinPoint

    let length: Int
    
    
    init(v0: PinPoint, v1: PinPoint, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.length = length
    }
    
    
    func extract(points: [Point]) -> [CGPoint] {
        let n = points.count
        var path = [CGPoint]()
        
        guard length > 1 else {
            return [DataNormalizer.convert(point: v0.point), DataNormalizer.convert(point: v1.point)]
        }
        
        guard length != 2 else {
            let middle = DataNormalizer.convert(point: points[(v0.masterMileStone.index + 1 ) % n])
            return [DataNormalizer.convert(point: v0.point), middle, DataNormalizer.convert(point: v1.point)]
        }
        
        path.reserveCapacity(length + 1)
        path.append(DataNormalizer.convert(point: v0.point))

        var a = (v0.masterMileStone.index + 1) % n
        let b = (v1.masterMileStone.index - 1 + n) % n

        path.append(DataNormalizer.convert(point: points[a % n]))
        
        while a <= b {
            a += 1
            let index = a % n
            path.append(DataNormalizer.convert(point: points[index]))
        }
        
        path.append(DataNormalizer.convert(point: v1.point))
 
        return path
    }
    
    
    func extract(index: Int, pathCount: Int) -> [PinHandler] {
        let n = pathCount
        var handlers = [PinHandler]()
        
        let firstHandler = PinHandler(sortFactor: v0.masterMileStone, index: index, isPinPath: 1, marker: 0)
        let lastHandler = PinHandler(sortFactor: v1.masterMileStone, index: index, isPinPath: 1, marker: 1)
        
        guard length > 1 else {
            return [firstHandler, lastHandler]
        }
        
        guard length != 2 else {
            let middleIndex = (v0.masterMileStone.index + 1) % n
            let middleSortFactor = PathMileStone(index: middleIndex, offset: 0)
            let middle = PinHandler(sortFactor: middleSortFactor, index: index, isPinPath: 1, marker: 1)
            return [firstHandler, middle, lastHandler]
        }
        
        handlers.reserveCapacity(length + 1)
        handlers.append(firstHandler)
        
        var a = (v0.masterMileStone.index + 1) % n
        let b = (v1.masterMileStone.index - 1 + n) % n
        
        handlers.append(PinHandler(sortFactor: PathMileStone(index: a % n, offset: 0), index: index, isPinPath: 1, marker: 1))
        
        while a <= b {
            a += 1
            handlers.append(PinHandler(sortFactor: PathMileStone(index: a % n, offset: 0), index: index, isPinPath: 1, marker: 1))
        }
        
        handlers.append(lastHandler)
        
        return handlers
    }

}


