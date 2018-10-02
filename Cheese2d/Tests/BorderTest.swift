//
//  BorderTest.swift
//  Tests
//
//  Created by Nail Sharipov on 02/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import XCTest
@testable import Cheese2d


class BorderTest: XCTestCase {
    
    
    func testSingle0() {

        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(CGPoint(x: 5, y: 10))
        slave.append(CGPoint(x: -5, y: 10))
        let iSlave = DataNormalizer.convert(points: slave)

        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.ms0, 2)
        XCTAssertEqual(border.ms1, 3)
        XCTAssertEqual(border.pt0 , DataNormalizer.convert(point: CGPoint(x: 5, y: 10)))
        XCTAssertEqual(border.pt1 , DataNormalizer.convert(point: CGPoint(x: -5, y: 10)))
        XCTAssertEqual(border.sl0, 0)
        XCTAssertEqual(border.sl1, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
    }
    
    
    func testSingle1() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: 10, y: -10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(CGPoint(x: 5, y: 10))
        slave.append(CGPoint(x: -5, y: 10))
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.ms0, 1)
        XCTAssertEqual(border.ms1, 2)
        XCTAssertEqual(border.pt0 , DataNormalizer.convert(point: CGPoint(x: -5, y: 10)))
        XCTAssertEqual(border.pt1 , DataNormalizer.convert(point: CGPoint(x: 5, y: 10)))
        XCTAssertEqual(border.sl0, 0)
        XCTAssertEqual(border.sl1, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
    }
    
    
    
    func testSingle2() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(CGPoint(x: 10, y: 5))
        slave.append(CGPoint(x: 10, y: -5))
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.ms0, 3)
        XCTAssertEqual(border.ms1, 0)
        XCTAssertEqual(border.pt0 , DataNormalizer.convert(point: CGPoint(x: 10, y: 5)))
        XCTAssertEqual(border.pt1 , DataNormalizer.convert(point: CGPoint(x: 10, y: -5)))
        XCTAssertEqual(border.sl0, 0)
        XCTAssertEqual(border.sl1, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
    }
    
}
