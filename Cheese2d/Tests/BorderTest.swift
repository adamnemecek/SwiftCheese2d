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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.ed, 2)
        XCTAssertEqual(border.v1.ed, 2)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.ed, 3)
        XCTAssertEqual(border.v1.ed, 3)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.ed, 0)
        XCTAssertEqual(border.v1.ed, 0)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.ed, 1)
        XCTAssertEqual(border.v1.ed, 1)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.ed, 2)
        XCTAssertEqual(border.v1.ed, 2)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.ed, 3)
        XCTAssertEqual(border.v1.ed, 3)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.ed, 0)
        XCTAssertEqual(border.v1.ed, 0)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.ed, 1)
        XCTAssertEqual(border.v1.ed, 1)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.ed, 1)
        XCTAssertEqual(border.v1.ed, 3)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.ed, 2)
        XCTAssertEqual(border.v1.ed, 0)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.ed, 3)
        XCTAssertEqual(border.v1.ed, 1)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.ed, 0)
        XCTAssertEqual(border.v1.ed, 2)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 1)
        XCTAssertEqual(border.v1.ms, 3)
        XCTAssertEqual(border.v0.ed, 1)
        XCTAssertEqual(border.v1.ed, 2)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 2)
        XCTAssertEqual(border.v1.ms, 0)
        XCTAssertEqual(border.v0.ed, 2)
        XCTAssertEqual(border.v1.ed, 3)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 3)
        XCTAssertEqual(border.v1.ms, 1)
        XCTAssertEqual(border.v0.ed, 3)
        XCTAssertEqual(border.v1.ed, 0)
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
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
        let path = result.path
        
        XCTAssertEqual(path.count, 1)
        
        let border = path[0]
        
        XCTAssertEqual(border.v0.ms, 0)
        XCTAssertEqual(border.v1.ms, 2)
        XCTAssertEqual(border.v0.ed, 0)
        XCTAssertEqual(border.v1.ed, 1)
        XCTAssertEqual(border.v0.pt, DataNormalizer.convert(point: pt0))
        XCTAssertEqual(border.v1.pt, DataNormalizer.convert(point: pt1))
        XCTAssertEqual(border.v0.sl, 2)
        XCTAssertEqual(border.v1.sl, 0)
        XCTAssertEqual(border.isZeroCorner, 0)
        XCTAssertEqual(border.length, 2)
        
        let points = border.extract(points: DataNormalizer.convert(points: master))
        XCTAssertEqual(points, [pt0, CGPoint(x: 10, y: -10), pt1])
    }
    
}
