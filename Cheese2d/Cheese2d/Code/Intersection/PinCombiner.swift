//
//  PinCombiner.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinCombiner {
 
    private let pinPathArray: [PinPath]
    private let pinPointArray: [PinPoint]
    private var pinHandlerArray: [PinHandler]
    private let masterCount: Int
    
    init(pinPointArray: [PinPoint], pinPathArray: [PinPath], masterCount: Int) {
        self.pinPointArray = pinPointArray
        self.pinPathArray = pinPathArray
        self.masterCount = masterCount
        self.pinHandlerArray = [PinHandler]()
        pinHandlerArray.reserveCapacity(pinPathArray.count + pinPointArray.count)
    }
    
    mutating func combine() {
        let n = pinPathArray.count
        let m = pinPointArray.count

        var i = 0
        while i < n {
            pinHandlerArray.append(PinHandler(pinPath: pinPathArray[i], index: i))
            i += 1
        }
        
        i = 0
        while i < m {
            pinHandlerArray.append(PinHandler(pinPath: pinPathArray[i], index: i))
            i += 1
        }
    
    }
}
