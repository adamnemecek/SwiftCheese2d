//
//  PinHandler.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinHandler: Equatable {
    
    private let sortFactor: SortUnit
    
    let isPinPath: Int              // 0 - false, 1 - true
    let index: Int                  // index in outside array

    init(sortFactor: SortUnit, index: Int, isPinPath: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.sortFactor = sortFactor
    }
    
    
    init(pinPath: PinPath, index: Int) {
        self.index = index
        self.isPinPath = 1
        self.sortFactor = pinPath.v0.sortFactor
    }
    
    
    init(pinPoint: PinPoint, index: Int) {
        self.index = index
        self.isPinPath = 0
        self.sortFactor = pinPoint.sortFactor
    }
    
    
    static func == (lhs: PinHandler, rhs: PinHandler) -> Bool {
        return lhs.sortFactor.index == rhs.sortFactor.index && lhs.sortFactor.offset == rhs.sortFactor.offset
    }
    
}

extension PinHandler {

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
                if SortUnit.compare(a: a.sortFactor, b: b.sortFactor) {
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
