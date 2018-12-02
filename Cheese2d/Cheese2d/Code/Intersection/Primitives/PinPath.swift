//
//  PinPath.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinPath {
    
    let v0: PinPoint
    let v1: PinPoint
    
    init(v0: PinPoint, v1: PinPoint, type: Int) {
        self.v0 = PinPoint(pin: v0, type: type)
        self.v1 = PinPoint(pin: v1, type: type)
    }
    
    
    func getLength(count: Int) -> Int {
        let a = v0.masterMileStone
        let b = v1.masterMileStone
        var length: Int = 0
        if PathMileStone.compare(a: a, b: b) {
            length = count
        }
        length += b.index - a.index
        if b.offset != 0 {
            length += 1
        }
        return length
    }
    
    
    func extract(index: Int, pathCount: Int) -> [PinHandler] {
        let n = pathCount
        
        let firstHandler = PinHandler(sortFactor: v0.masterMileStone, index: index, isPinPath: 1, marker: 0, type: v0.type)
        let lastHandler = PinHandler(sortFactor: v1.masterMileStone, index: index, isPinPath: 1, marker: 1, type: v0.type)
    
        let length = getLength(count: n)
        
        guard length > 1 else {
            return [firstHandler, lastHandler]
        }
        
        guard length != 2 else {
            let middleIndex = (v0.masterMileStone.index + 1) % n
            let middleSortFactor = PathMileStone(index: middleIndex, offset: 0)
            let middle = PinHandler(sortFactor: middleSortFactor, index: index, isPinPath: 1, marker: 1, type: v0.type)
            return [firstHandler, middle, lastHandler]
        }
        
        var handlers = [PinHandler]()
        handlers.reserveCapacity(length + 1)
        handlers.append(firstHandler)
        
        var i = (v0.masterMileStone.index + 1) % n
        let endIndex: Int
        if v1.masterMileStone.offset != 0 {
            endIndex = v1.masterMileStone.index
        } else {
            endIndex = (v1.masterMileStone.index - 1 + n) % n
        }

        while i != endIndex {
            handlers.append(PinHandler(sortFactor: PathMileStone(index: i, offset: 0), index: index, isPinPath: 1, marker: 1, type: v0.type))
            i = (i + 1) % n
        }
        
        handlers.append(PinHandler(sortFactor: PathMileStone(index: endIndex, offset: 0), index: index, isPinPath: 1, marker: 1, type: v0.type))

        handlers.append(lastHandler)
        
        return handlers
    }

}


