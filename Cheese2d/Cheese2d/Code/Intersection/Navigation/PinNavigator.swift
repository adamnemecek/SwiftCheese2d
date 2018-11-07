//
//  PinNavigator.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 17/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation




struct PinNavigator {
    
    struct Cursor {
        let type: Int
        let isPath: Int
    }
    
    // TODO optimise, we could remove masterPath
    
    let masterPath: [Int]
    let slavePath: [Int]
    let pinPathArray: [PinPath]
    let pinPointArray: [PinPoint]
    var nodeArray: [PinNode]

    private var markIndex: Int = 0
    
    init(masterPath: [Int], slavePath: [Int], pinPathArray: [PinPath], pinPointArray: [PinPoint], nodeArray: [PinNode]) {
        self.masterPath = masterPath
        self.slavePath = slavePath
        self.pinPathArray = pinPathArray
        self.pinPointArray = pinPointArray
        self.nodeArray = nodeArray
    }
    

    mutating func hasNext() -> Bool {
        var i = markIndex
        let n = nodeArray.count
        repeat {
            let node = nodeArray[i]
            if node.marker == 0 {
                markIndex = i
                return true
            }
            i = (i + 1) % n
        } while i != markIndex

        return false
    }

    
    mutating func current() -> Cursor {
        let node = nodeArray[markIndex]
        
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return Cursor(type: pin.type, isPath: 0)
        } else {
            let path = pinPathArray[node.index]
            return Cursor(type: path.v0.type, isPath: 1)
        }
    }
    
    
    mutating func mark() {
        var node = nodeArray[markIndex]
        node.marker = 1
        nodeArray[markIndex] = node
    }
    
    
    mutating func nextSlave() -> Cursor {
        let node = nodeArray[markIndex]
        
        let n = slavePath.count
        let nextSlaveIndex = (node.slaveIndex + 1) % n
        markIndex = slavePath[nextSlaveIndex]
        
       return self.current()
    }

    
    mutating func nextMaster() -> Cursor {
        let node = nodeArray[markIndex]
        
        let n = masterPath.count
        let nextMasterIndex = (node.masterIndex + 1) % n
        markIndex = masterPath[nextMasterIndex]
        
        return self.current()
    }
    
    
    func pin() -> PinPoint {
        let node = nodeArray[markIndex]
        return pinPointArray[node.index]
    }
    
    
    func path() -> PinPath {
        let node = nodeArray[markIndex]
        return pinPathArray[node.index]
    }
}
