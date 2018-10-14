//
//  PinPathTest.swift
//  Tests
//
//  Created by Nail Sharipov on 02/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import XCTest
@testable import Cheese2d


class PinPathTest: XCTestCase {
    
    
    func testSingle_0_0() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)

        let pt0 = CGPoint(x: 5, y: 10)
        let pt1 = CGPoint(x: -5, y: 10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.sortFactor.index, 2)
        XCTAssertEqual(border.v1.sortFactor.index, 2)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    

    func testSingle_0_1() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        
        let pt0 = CGPoint(x: -10, y: 5)
        let pt1 = CGPoint(x: -10, y: -5)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.sortFactor.index, 3)
        XCTAssertEqual(border.v1.sortFactor.index, 3)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_0_2() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -5, y: -10)
        let pt1 = CGPoint(x: 5, y: -10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.sortFactor.index, 0)
        XCTAssertEqual(border.v1.sortFactor.index, 0)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_0_3() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: -5)
        let pt1 = CGPoint(x: 10, y: 5)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.sortFactor.index, 1)
        XCTAssertEqual(border.v1.sortFactor.index, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_1_0() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: 10)
        let pt1 = CGPoint(x: -10, y: 10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.sortFactor.index, 2)
        XCTAssertEqual(border.v1.sortFactor.index, 3)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_1_1() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        
        let pt0 = CGPoint(x: -10, y: 10)
        let pt1 = CGPoint(x: -10, y: -10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.sortFactor.index, 3)
        XCTAssertEqual(border.v1.sortFactor.index, 0)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_1_2() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -10, y: -10)
        let pt1 = CGPoint(x: 10, y: -10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.sortFactor.index, 0)
        XCTAssertEqual(border.v1.sortFactor.index, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func testSingle_1_3() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: -10)
        let pt1 = CGPoint(x: 10, y: 10)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.sortFactor.index, 1)
        XCTAssertEqual(border.v1.sortFactor.index, 2)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 0)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 1)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points.count, 2)
    }
    
    func testSingle_2_0() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: 5)
        let pt1 = CGPoint(x: -10, y: 5)

        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.sortFactor.index, 1)
        XCTAssertEqual(border.v1.sortFactor.index, 3)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 3)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 3)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: 10, y: 10), CGPoint(x: -10, y: 10), pt1])
    }
    

    func testSingle_2_1() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -5, y: 10)
        let pt1 = CGPoint(x: -5, y: -10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.sortFactor.index, 2)
        XCTAssertEqual(border.v1.sortFactor.index, 0)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 3)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 3)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: -10, y: 10), CGPoint(x: -10, y: -10), pt1])
    }
    
    
    func testSingle_2_2() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -10, y: -5)
        let pt1 = CGPoint(x: 10, y: -5)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.sortFactor.index, 3)
        XCTAssertEqual(border.v1.sortFactor.index, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 3)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 3)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: -10, y: -10), CGPoint(x: 10, y: -10), pt1])
    }
    
    
    func testSingle_2_3() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 5, y: -10)
        let pt1 = CGPoint(x: 5, y: 10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.sortFactor.index, 0)
        XCTAssertEqual(border.v1.sortFactor.index, 2)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 3)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 3)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: 10, y: -10), CGPoint(x: 10, y: 10), pt1])
    }
    
    
    func testSingle_3_0() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: 0)
        let pt1 = CGPoint(x: 0, y: 10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.sortFactor.index, 1)
        XCTAssertEqual(border.v1.sortFactor.index, 2)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 2)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 2)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: 10, y: 10), pt1])
    }
    
    
    func testSingle_3_1() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 0, y: 10)
        let pt1 = CGPoint(x: -10, y: 0)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.sortFactor.index, 2)
        XCTAssertEqual(border.v1.sortFactor.index, 3)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 2)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 2)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: -10, y: 10), pt1])
    }
    
    
    func testSingle_3_2() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -10, y: 0)
        let pt1 = CGPoint(x: 0, y: -10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.sortFactor.index, 3)
        XCTAssertEqual(border.v1.sortFactor.index, 0)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 2)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 2)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: -10, y: -10), pt1])
    }
    
    
    func testSingle_3_3() {
        
        var master = [CGPoint]()
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 0, y: -10)
        let pt1 = CGPoint(x: 10, y: 0)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.sortFactor.index, 0)
        XCTAssertEqual(border.v1.sortFactor.index, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 2)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 2)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: 10, y: -10), pt1])
    }
    
    
    func testSingle_4_0() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 0, y: 10)
        let pt1 = CGPoint(x: 10, y: 0)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.sortFactor.index, 2)
        XCTAssertEqual(border.v1.sortFactor.index, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 4)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 4)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, slave)
    }
    
    
    func testSingle_4_1() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: -10, y: 0)
        let pt1 = CGPoint(x: 0, y: 10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.sortFactor.index, 3)
        XCTAssertEqual(border.v1.sortFactor.index, 2)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 4)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 4)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, slave)
    }
    
    
    func testSingle_4_2() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 0, y: -10)
        let pt1 = CGPoint(x: -10, y: 0)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.sortFactor.index, 0)
        XCTAssertEqual(border.v1.sortFactor.index, 3)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 4)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 4)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, slave)
    }
    
    
    func testSingle_4_3() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        let pt0 = CGPoint(x: 10, y: 0)
        let pt1 = CGPoint(x: 0, y: -10)
        
        var slave = [CGPoint]()
        slave.append(pt0)
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.sortFactor.index, 1)
        XCTAssertEqual(border.v1.sortFactor.index, 0)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 4)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 1)
        XCTAssertEqual(border.length, 4)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, slave)
    }
    
    
    func testOctagon() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 10, y: 5))
        slave.append(CGPoint(x: 5, y: 10))
        slave.append(CGPoint(x: -5, y: 10))
        slave.append(CGPoint(x: -10, y: 5))
        slave.append(CGPoint(x: -10, y: -5))
        slave.append(CGPoint(x: -5, y: -10))
        slave.append(CGPoint(x: 5, y: -10))
        slave.append(CGPoint(x: 10, y: -5))
        
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        
        let points_0 = path[0].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_0, [CGPoint(x: -5, y: -10), CGPoint(x: 5, y: -10)])
        
        let points_1 = path[1].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_1, [CGPoint(x: 10, y: -5), CGPoint(x: 10, y: 5)])
        
        let points_2 = path[2].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_2, [CGPoint(x: 5, y: 10), CGPoint(x: -5, y: 10)])
        
        let points_3 = path[3].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_3, [CGPoint(x: -10, y: 5), CGPoint(x: -10, y: -5)])
    }
    
    
    func testX() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 10, y: 5))
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(CGPoint(x: 5, y: 10))
        slave.append(CGPoint(x: 0, y: 5))
        slave.append(CGPoint(x: -5, y: 10))
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: -10, y: 5))
        slave.append(CGPoint(x: -5, y: 0))
        slave.append(CGPoint(x: -10, y: -5))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: -5, y: -10))
        slave.append(CGPoint(x: 0, y: -5))
        slave.append(CGPoint(x: 5, y: -10))
        slave.append(CGPoint(x: 10, y: -10))
        slave.append(CGPoint(x: 10, y: -5))
        slave.append(CGPoint(x: 5, y: 0))
        
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        
        let points_0 = path[0].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_0, [CGPoint(x: -10, y: -5), CGPoint(x: -10, y: -10), CGPoint(x: -5, y: -10)])
        
        let points_1 = path[1].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_1, [CGPoint(x: 5, y: -10), CGPoint(x: 10, y: -10), CGPoint(x: 10, y: -5)])
        
        let points_2 = path[2].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_2, [CGPoint(x: 10, y: 5), CGPoint(x: 10, y: 10), CGPoint(x: 5, y: 10)])
        
        let points_3 = path[3].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_3, [CGPoint(x: -5, y: 10), CGPoint(x: -10, y: 10), CGPoint(x: -10, y: 5)])
    }
    
    
    
    func testStick() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: -10, y: 10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: -10, y: 5))
        slave.append(CGPoint(x: -10, y: 0))
        slave.append(CGPoint(x: -15, y: 0))
        slave.append(CGPoint(x: -10, y: -5))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: -5, y: -10))
        slave.append(CGPoint(x: 0, y: -5))
        slave.append(CGPoint(x: 0, y: -10))
        slave.append(CGPoint(x: 5, y: -10))
        slave.append(CGPoint(x: 5, y: -5))
        slave.append(CGPoint(x: 0, y: 0))
        slave.append(CGPoint(x: -5, y: 0))

        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        
        let points_0 = path[0].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_0, [CGPoint(x: -10, y: -5), CGPoint(x: -10, y: -10), CGPoint(x: -5, y: -10)])
        
        let points_1 = path[1].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_1, [CGPoint(x: 0, y: -10), CGPoint(x: 5, y: -10)])
        
        let points_2 = path[2].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_2, [CGPoint(x: 5, y: -5), CGPoint(x: 0, y: 0)])
        
        let points_3 = path[3].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_3, [CGPoint(x: -10, y: 5), CGPoint(x: -10, y: 0)])
    }
    
    
    func testOneMore() {
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: -10, y: -10))
        
        let iMaster = DataNormalizer.convert(points: master)
        
        var slave = [CGPoint]()
        slave.append(CGPoint(x: 10, y: 0))
        slave.append(CGPoint(x: 0, y: -10))
        slave.append(CGPoint(x: -10, y: -10))
        slave.append(CGPoint(x: -10, y: 10))
        
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        
        let points_0 = path[0].extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points_0, [CGPoint(x: 0, y: -10), CGPoint(x: -10, y: -10), CGPoint(x: -10, y: 10)])
    }
    

}
