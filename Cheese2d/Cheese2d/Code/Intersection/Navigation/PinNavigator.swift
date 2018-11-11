//
//  PinNavigator.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 17/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinNavigator {
    
    struct Cursor: Equatable {
        
        static let empty = Cursor(type: 0, index: -1)
        
        let type: Int
        fileprivate let index: Int
        var isNotEmpty: Bool {
            return index >= 0
        }
        
        public static func == (lhs: Cursor, rhs: Cursor) -> Bool {
            return lhs.index == rhs.index
        }
    }
    
    // TODO optimise, we could remove masterPath
    
    let masterPath: [Int]
    let slavePath: [Int]
    let pinPathArray: [PinPath]
    let pinPointArray: [PinPoint]
    var nodeArray: [PinNode]
    
    init(masterPath: [Int], slavePath: [Int], pinPathArray: [PinPath], pinPointArray: [PinPoint], nodeArray: [PinNode]) {
        self.masterPath = masterPath
        self.slavePath = slavePath
        self.pinPathArray = pinPathArray
        self.pinPointArray = pinPointArray
        self.nodeArray = nodeArray
    }
    

    mutating func hasNext(cursor: Cursor) -> Cursor {
        return hasNext(index: cursor.index)
    }
    
    mutating func hasNext() -> Cursor {
        return hasNext(index: 0)
    }
    
    
    mutating private func hasNext(index: Int) -> Cursor {
        var i = index
        let n = nodeArray.count
        repeat {
            let node = nodeArray[i]
            if node.marker == 0 {
                if node.isPinPath == 0 {
                    let pin = pinPointArray[node.index]
                    return Cursor(type: pin.type, index: i)
                } else {
                    let path = pinPathArray[node.index]
                    return Cursor(type: path.v0.type, index: i)
                }
            }
            i = (i + 1) % n
        } while i != index
        
        return Cursor.empty
    }
    
    
    mutating func mark(cursor: Cursor) {
        var node = nodeArray[cursor.index]
        node.marker = 1
        nodeArray[cursor.index] = node
    }
    
    
    mutating func nextSlave(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]
        
        let n = slavePath.count
        let nextSlaveIndex = (node.slaveIndex + 1) % n
        let index = slavePath[nextSlaveIndex]
        let nextNode = nodeArray[index]
        
        if nextNode.isPinPath == 0 {
            let pin = pinPointArray[nextNode.index]
            return Cursor(type: pin.type, index: index)
        } else {
            let path = pinPathArray[nextNode.index]
            return Cursor(type: path.v0.type, index: index)
        }
    }

    
    mutating func nextMaster(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]
        
        let n = masterPath.count
        let nextMasterIndex = (node.masterIndex + 1) % n
        let index = masterPath[nextMasterIndex]
        let nextNode = nodeArray[index]
        
        if nextNode.isPinPath == 0 {
            let pin = pinPointArray[nextNode.index]
            return Cursor(type: pin.type, index: index)
        } else {
            let path = pinPathArray[nextNode.index]
            return Cursor(type: path.v0.type, index: index)
        }
    }
    
    
    func pin(cursor: Cursor) -> PinPoint {
        let node = nodeArray[cursor.index]
        return pinPointArray[node.index]
    }
    
    
    func path(cursor: Cursor) -> PinPath {
        let node = nodeArray[cursor.index]
        return pinPathArray[node.index]
    }
    
    
    func masterStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        } else {
            let path = pinPathArray[node.index]
            return path.v0.masterMileStone
        }
    }
    
    
    func masterEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        } else {
            let path = pinPathArray[node.index]
            return path.v1.masterMileStone
        }
    }
    
    
    func slaveStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        } else {
            let path = pinPathArray[node.index]
            return path.v0.slaveMileStone
        }
    }
    
    
    func slaveStartPoint(cursor: Cursor) -> Point {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        } else {
            let path = pinPathArray[node.index]
            return path.v0.point
        }
    }
    
    
    func slaveEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        } else {
            let path = pinPathArray[node.index]
            return path.v1.slaveMileStone
        }
    }
    
    
    func slaveEndPoint(cursor: Cursor) -> Point {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        } else {
            let path = pinPathArray[node.index]
            return path.v1.point
        }
    }
    
    
}
