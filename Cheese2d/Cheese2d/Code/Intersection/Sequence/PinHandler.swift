//
//  PinHandler.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinHandler: Equatable {
    
    let masterSortFactor: PathMileStone
    
    let isPinPath: Int              // 0 - false, 1 - true
    let index: Int                  // index in outside array
    
    var marker: Int = 0             // 0 - present, 1 - removed

    init(sortFactor: PathMileStone, index: Int, isPinPath: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
    }
    
    
    init(sortFactor: PathMileStone, index: Int, isPinPath: Int, marker: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
        self.marker = marker
    }
    
    
    init(pinPoint: PinPoint, index: Int) {
        self.index = index
        self.isPinPath = 0
        self.masterSortFactor = pinPoint.masterMileStone
    }
    
    
    static func == (lhs: PinHandler, rhs: PinHandler) -> Bool {
        return lhs.masterSortFactor.index == rhs.masterSortFactor.index && lhs.masterSortFactor.offset == rhs.masterSortFactor.offset
    }
    
}
