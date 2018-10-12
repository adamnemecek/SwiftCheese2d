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
        var i = 0
        while i < pinPathArray.count {
            pinHandlerArray.append(PinHandler(pinPath: pinPathArray[i], index: i))
            i += 1
        }
        
        i = 0
        while i < pinPointArray.count {
            pinHandlerArray.append(PinHandler(pinPoint: pinPointArray[i], index: i))
            i += 1
        }

        PinHandler.sort(array: &pinHandlerArray)
    }
    
    
    private func cleanDoubles() {
        var delete = [Int]()
        
        var i = 1
        var prev = pinHandlerArray[0]
        while i < pinHandlerArray.count {
            let handler = pinHandlerArray[i]
            if handler != prev {
                prev = handler
            } else {
                if handler.isPinPath == 0 {
                    delete.append(i)
                } else {
                    prev = handler
                    delete.append(i - 1)
                }
            }
            i += 1
        }
        
        
        if delete.count > 0 {
            while i < pinHandlerArray.count {
                let handler = pinHandlerArray[i]
                if handler != prev {
                    prev = handler
                } else {
                    delete.append(i)
                }
                i += 1
            }
        }
    }
    
}
