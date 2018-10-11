//
//  PinHandler.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinHandler: Equatable {
    
    private let masterIndex: Int
    private let offsetFactor: Int64
    
    let isPinPath: Int           // 0 - false, 1 - true
    let index: Int              // index in outside array

    init(point: Point, masterPoint: Point, masterIndex: Int, index: Int, isPinPath: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterIndex = masterIndex
        
        let dx = point.x - masterPoint.x
        let dy = point.x - masterPoint.x
        
        self.offsetFactor = dx * dx + dy * dy
    }
    
    
    static func == (lhs: PinHandler, rhs: PinHandler) -> Bool {
        return lhs.masterIndex == rhs.masterIndex &&
            lhs.offsetFactor == rhs.offsetFactor
    }
    
}

extension PinHandler {
    
    private static func compare(a: PinHandler, b: PinHandler) -> Bool {
        if a.masterIndex != b.masterIndex {
            return a.masterIndex > b.masterIndex
        } else {
            return a.offsetFactor > b.offsetFactor
        }
    }


    static func sort(array: inout [PinHandler]) {
        // this array is mostly sorted
        
        let n = array.count
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = array[0]
            var i = 1
            while i < m {
                let b = array[i]
                if PinHandler.compare(a: a, b: b) {
                    array[i - 1] = b
                    isNotSorted = true
                } else {
                    array[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            array[m] = a
        } while isNotSorted
    }
    
}
