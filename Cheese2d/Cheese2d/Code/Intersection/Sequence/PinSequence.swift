//
//  PinCombiner.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinSequence {
 
    private (set) var pinPathArray: [PinPath]
    private (set) var pinPointArray: [PinPoint]
    private (set) var handlerArray: [PinHandler]
    
    private let masterCount: Int
    
    init(pinPointArray: [PinPoint], pinPathArray: [PinPath], masterCount: Int) {
        self.pinPointArray = pinPointArray
        self.pinPathArray = pinPathArray
        self.masterCount = masterCount
        self.handlerArray = [PinHandler]()
        self.handlerArray.reserveCapacity(pinPathArray.count + pinPointArray.count)
    }
    
    
    mutating func buildNavigator(exclusionPinType: Int) -> PinNavigator {
        var i = 0
        while i < pinPathArray.count {
            let path = pinPathArray[i]
            
            let pathHandlers = path.extract(index: i, pathCount: masterCount)
            
            handlerArray.append(contentsOf: pathHandlers)
            
            i += 1
        }
        
        i = 0
        while i < pinPointArray.count {
            handlerArray.append(PinHandler(pinPoint: pinPointArray[i], index: i))
            i += 1
        }

        guard handlerArray.count > 0 else {
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [])
        }
        
        self.sortMaster()
        self.cleanDoubles(exclusionPinType: exclusionPinType)
        
        guard handlerArray.count > 0 else {
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [])
        }
        
        let slavePath = self.buildSlavePath()
        
        let n = slavePath.count
        
        var nodes = Array<PinNode>(repeating: PinNode(isPinPath: 0), count: n)
        for j in 0...n-1 {
            var node = nodes[j]
            let handler = handlerArray[j]
            node.isPinPath = handler.isPinPath
            node.index = handler.index
            node.masterIndex = j
            nodes[j] = node
            
            let slaveIndex = slavePath[j]
            node = nodes[slaveIndex]
            node.slaveIndex = j
            nodes[slaveIndex] = node
        }

        
        return PinNavigator(slavePath: slavePath,
                            pinPathArray: pinPathArray, pinPointArray: pinPointArray,
                            nodeArray: nodes)
    }
    
    
    private mutating func sortMaster() {
        // this array is mostly sorted
        
        let n = handlerArray.count
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = handlerArray[0]
            var i = 1
            while i < m {
                let b = handlerArray[i]
                if PathMileStone.compare(a: a.masterSortFactor, b: b.masterSortFactor) {
                    handlerArray[i - 1] = b
                    isNotSorted = true
                } else {
                    handlerArray[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            handlerArray[m] = a
        } while isNotSorted
    }
    
    
    private mutating func cleanDoubles(exclusionPinType: Int) {
        var i = 1
        var prevIndex = 0
        var prev = handlerArray[prevIndex]
        var isCompactRequired = pinPathArray.count > 0
        while i < handlerArray.count {
            var handler = handlerArray[i]
            if handler != prev {
                prev = handler
                prevIndex = i
            } else {
                if handler.isPinPath == 0 {
                    handler.marker = 1
                    handlerArray[i] = handler
                    isCompactRequired = true
                } else {
                    prev.marker = 1
                    handlerArray[prevIndex] = prev
                    prev = handler
                    prevIndex = i
                    isCompactRequired = true
                }
            }
            i += 1
        }
        
        i = 0
        while i < handlerArray.count {
            var handler = handlerArray[i]
            if handler.marker == 0 && handler.type == exclusionPinType {
                handler.marker = 1
                handlerArray[i] = handler
                isCompactRequired = true
            }
            i += 1
        }
        
        if isCompactRequired {
            self.compact()
        }
    }
    
    
    private mutating func compact() {
        var paths = [PinPath]()
        var points = [PinPoint]()
        var handlers = [PinHandler]()
        paths.reserveCapacity(self.pinPathArray.count)
        points.reserveCapacity(self.pinPointArray.count)
        
        for pinHandler in self.handlerArray {
            if pinHandler.marker == 0 {
                let index = pinHandler.index
                if pinHandler.isPinPath == 1 {
                    let path = self.pinPathArray[index]
                    paths.append(path)

                    let handler = PinHandler(sortFactor: pinHandler.masterSortFactor, index: paths.count - 1, isPinPath: 1, type: pinHandler.type)
                    handlers.append(handler)
                } else {
                    let pin = self.pinPointArray[index]
                    points.append(pin)

                    let handler = PinHandler(sortFactor: pinHandler.masterSortFactor, index: points.count - 1, isPinPath: 0, type: pinHandler.type)
                    handlers.append(handler)
                }
            }
        }
        
        self.pinPathArray = paths
        self.pinPointArray = points
        self.handlerArray = handlers
    }

    private func buildSlavePath() -> [Int] {
        let n = handlerArray.count
        
        var iStones = [IndexMileStone]()
        iStones.reserveCapacity(n)
        
        for j in 0...n - 1 {
            let handler = handlerArray[j]
            let index = handler.index
            if handler.isPinPath == 0 {
                let point = self.pinPointArray[index]
                iStones.append(IndexMileStone(index: j, stone: point.slaveMileStone))
            } else {
                let path = self.pinPathArray[index]
                iStones.append(IndexMileStone(index: j, stone: path.v0.slaveMileStone))
            }
        }
        
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = iStones[0]
            var i = 1
            while i < m {
                let b = iStones[i]
                if PathMileStone.compare(a: a.stone, b: b.stone) {
                    iStones[i - 1] = b
                    isNotSorted = true
                } else {
                    iStones[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            iStones[m] = a
        } while isNotSorted
        
        var indexArray = Array<Int>(repeating: 0, count: n)
        
        for j in 0...n - 1 {
            indexArray[j] = iStones[j].index
        }
        
        return indexArray
    }
    
    
    private func buildMasterPath() -> [Int] {
        let n = handlerArray.count
        
        var indexArray = Array<Int>(repeating: 0, count: n)
        
        for i in 0...n - 1 {
            indexArray[i] = i
        }
        
        return indexArray
    }
}
