//
//  VectorCornerTest.swift
//  Tests
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import XCTest
@testable import Cheese2d


class VectorCornerTest: XCTestCase {
    
    
    func test_0() {
        
        let corner = VectorCorner(o: CGPoint(x: 0, y: 0), a: CGPoint(x: 0, y: 10), b: CGPoint(x: 10, y: 0))
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: -5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: -5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: -5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 0)), true)
    }
    
    
    func test_1() {
        let corner = VectorCorner(o: CGPoint(x: 0, y: 0), a: CGPoint(x: -10, y: 0), b: CGPoint(x: 10, y: 0))
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 5)), false)
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: -5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: -5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: -5)), true)
    }
    
    
    func test_2() {
        let corner = VectorCorner(o: CGPoint(x: 0, y: 0), a: CGPoint(x: -10, y: -10), b: CGPoint(x: 10, y: -10))
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 10, y: 0)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -10, y: 0)), false)

        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: -10)), true)
    }
    
    
    func test_3() {
        let corner = VectorCorner(o: CGPoint(x: 0, y: 0), a: CGPoint(x: -10, y: 0), b: CGPoint(x: 0, y: -10))
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: -5)), true)
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: -5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 0)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 0, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 5)), false)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: -5, y: 0)), false)

    }
    

    func test_4() {
        
        let corner = VectorCorner(o: CGPoint(x: 10, y: 10), a: CGPoint(x: 10, y: 20), b: CGPoint(x: 20, y: 10))
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 15, y: 15)), false)
        
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 15, y: 5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 10, y: 5)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 15)), true)
        XCTAssertEqual(corner.isBetween(p: CGPoint(x: 5, y: 10)), true)
    }
}
