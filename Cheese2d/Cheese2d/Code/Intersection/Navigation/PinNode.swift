//
//  PinNode.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 17/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinNode {

    var isPinPath: Int              // 0 - false, 1 - true
    var masterIndex: Int            // index in master path array
    var slaveIndex: Int             // index in slave path array
    var marker: Int                 // 0 - present, 1 - removed
    var index: Int                  // index in supply array (PinPoints or PinPaths)
    
    init(isPinPath: Int) {
        self.isPinPath = isPinPath
        self.masterIndex = -1
        self.slaveIndex = -1
        self.marker = 0
        self.index = -1
    }
}
