//
//  PinHandler.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinHandler: Equatable {
    
    let sortFactor: PathMileStone
    
    let isPinPath: Int              // 0 - false, 1 - true
    let index: Int                  // index in outside array
    
    var marker: Int = 0             // 0 - present, 1 - removed

    init(sortFactor: PathMileStone, index: Int, isPinPath: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.sortFactor = sortFactor
    }
    
    
    init(sortFactor: PathMileStone, index: Int, isPinPath: Int, marker: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.sortFactor = sortFactor
        self.marker = marker
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
