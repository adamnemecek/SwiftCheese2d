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
    
    
    
    func test_0() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: -10, y: -10))
        
        let iMaster = PointConverter.defaultConverter.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: 0, y: 5))
        slave.append(CGPoint(x: 5, y: 5))
        let iSlave = PointConverter.defaultConverter.convert(points: slave)
        
        let navigator = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, converter: PointConverter.defaultConverter)

        XCTAssertEqual(navigator.pinPointArray.count, 1)
    }
    
}
