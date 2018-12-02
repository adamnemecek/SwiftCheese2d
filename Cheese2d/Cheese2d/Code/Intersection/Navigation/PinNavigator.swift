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

    
    private let slavePath: [Int]                // for s in slavePath { nodeArray[s] }  iterate all pins in counter clockwise order by slave path
    let pinPathArray: [PinPath]                 // pinPathArray[nodeArray[i].index] return PinPath for this pin
    let pinPointArray: [PinPoint]               // supply array for nodeArray[i].index return PinPoint for this pin
    private (set)var nodeArray: [PinNode]       // keep info about each pin node, also for n in nodeArray iterate all pins in clockwise order by master path
    
    init(slavePath: [Int], pinPathArray: [PinPath], pinPointArray: [PinPoint], nodeArray: [PinNode]) {
        self.slavePath = slavePath
        self.pinPathArray = pinPathArray
        self.pinPointArray = pinPointArray
        self.nodeArray = nodeArray
    }

    
    func next(cursor: Cursor) -> Cursor {
        return next(index: cursor.index)
    }
    
    func next() -> Cursor {
        if self.nodeArray.count != 0 {
            return next(index: 0)
        } else {
            return Cursor.empty
        }
    }
    
    
    private func next(index: Int) -> Cursor {
        var i = index
        let n = nodeArray.count
        repeat {
            let node = nodeArray[i]
            if node.marker == 0 {
                let type: Int
                if node.isPinPath == 0 {
                    let pin = pinPointArray[node.index]
                    type = pin.type
                } else {
                    let path = pinPathArray[node.index]
                    type = path.v0.type
                }

                return Cursor(type: type, index: i)
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
    
    
    func nextSlave(cursor: Cursor) -> Cursor {
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

    
    func nextMaster(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]
        
        let n = nodeArray.count
        let nextMasterIndex = (node.masterIndex + 1) % n
        let index = nextMasterIndex
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
    
    func masterStartPoint(cursor: Cursor) -> Point {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        } else {
            let path = pinPathArray[node.index]
            return path.v0.point
        }
    }
    
    
    func masterEndPoint(cursor: Cursor) -> Point {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        } else {
            let path = pinPathArray[node.index]
            return path.v1.point
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
