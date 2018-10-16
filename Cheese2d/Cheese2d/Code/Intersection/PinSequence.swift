//
//  PinCombiner.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinSequence {
 
    let pinPathArray: [PinPath]
    let pinPointArray: [PinPoint]
    private (set) var pinHandlerArray: [PinHandler]
    private let masterCount: Int
    
    init(pinPointArray: [PinPoint], pinPathArray: [PinPath], masterCount: Int) {
        self.pinPointArray = pinPointArray
        self.pinPathArray = pinPathArray
        self.masterCount = masterCount
        self.pinHandlerArray = [PinHandler]()
        pinHandlerArray.reserveCapacity(pinPathArray.count + pinPointArray.count)
    }
    
    mutating func prepareData() {
        var i = 0
        while i < pinPathArray.count {
            let path = pinPathArray[i]
            
            let pathHandlers = path.extract(index: i, pathCount: masterCount)
            
            pinHandlerArray.append(contentsOf: pathHandlers)
            
            i += 1
        }
        
        i = 0
        while i < pinPointArray.count {
            pinHandlerArray.append(PinHandler(pinPoint: pinPointArray[i], index: i))
            i += 1
        }
        
        var compact = self.compact()

        print("points: \(compact.points.count), paths: \(compact.paths.count)")
        
        
        self.sort()
        
        self.cleanDoubles()
        
        compact = self.compact()
        
        print("points: \(compact.points.count), paths: \(compact.paths.count)")
    }
    
    
    private mutating func cleanDoubles() {
        var delete = [Int]()
        
        var i = 1
        var prevIndex = 0
        var prev = pinHandlerArray[prevIndex]
        while i < pinHandlerArray.count {
            var handler = pinHandlerArray[i]
            if handler != prev {
                prev = handler
                prevIndex = i
            } else {
                if handler.isPinPath == 0 {
                    handler.marker = 1
                    pinHandlerArray[i] = handler
                } else {
                    prev.marker = 1
                    pinHandlerArray[prevIndex] = prev
                    prev = handler
                    prevIndex = i
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
    
    
    private mutating func sort() {
        // this array is mostly sorted
        
        let n = pinHandlerArray.count
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = pinHandlerArray[0]
            var i = 1
            while i < m {
                let b = pinHandlerArray[i]
                if PathMileStone.compare(a: a.sortFactor, b: b.sortFactor) {
                    pinHandlerArray[i - 1] = b
                    isNotSorted = true
                } else {
                    pinHandlerArray[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            pinHandlerArray[m] = a
        } while isNotSorted
    }
    
    
    func compact() -> (points: [PinPoint], paths: [PinPath]) {
        var paths = [PinPath]()
        var points = [PinPoint]()
        
        for pinHandler in self.pinHandlerArray {
            if pinHandler.marker == 0 {
                let index = pinHandler.index
                if pinHandler.isPinPath == 1 {
                    let path = self.pinPathArray[index]
                    paths.append(path)
                } else {
                    let pin = self.pinPointArray[index]
                    points.append(pin)
                }
            }
        }
        
        return (points: points, paths: paths)
    }

}
