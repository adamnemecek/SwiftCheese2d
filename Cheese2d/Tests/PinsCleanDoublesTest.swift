//
//  PinsCleanDoublesTest.swift
//  Tests
//
//  Created by Nail Sharipov on 12/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation



import XCTest
@testable import Cheese2d


class PinsCleanDoublesTest: XCTestCase {
    
    
    private func sequenceToBundle(sequence: PinSequence, iMaster: [Point]) -> IntersectorResult {
        var borders = [[CGPoint]]()
        var points = [PinPoint]()
        
        for pinHandler in sequence.pinHandlerArray {
            if pinHandler.marker == 0 {
                let index = pinHandler.index
                if pinHandler.isPinPath == 1 {
                    let path = sequence.pinPathArray[index]
                    borders.append(path.extract(points: iMaster))
                } else {
                    let pin = sequence.pinPointArray[index]
                    points.append(pin)
                }
            }
            
        }
        
        return IntersectorResult(points: points, path: borders)
    }
    
    
    func test_0() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: -10, y: -10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: 0, y: 5))
        slave.append(CGPoint(x: 5, y: 5))
        let iSlave = DataNormalizer.convert(points: slave)
        
        let sequence = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        
        let result = self.sequenceToBundle(sequence: sequence, iMaster: iMaster)
   
        XCTAssertEqual(result.points.count, 1)
    }
    
}
