//
//  OrdedNumbersTest.swift
//  Tests
//
//  Created by Nail Sharipov on 21/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import XCTest
@testable import Cheese2d

class OrdedNumbersTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmpty() {
        let numbers = OrdedNumbers()

        let range = numbers.getRange(number: 0)

        XCTAssert(range.isEmpty)
    }
    
    func testSingle() {
        var numbers = OrdedNumbers()
        numbers.add(number: 0)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssert(range1.isEmpty)
        
        let range2 = numbers.getRange(number: -1)
        
        XCTAssert(range2.isEmpty)
    }
    
    
    func testMiddle() {
        var numbers = OrdedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 1)
        numbers.add(number: 2)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssertEqual(range1.begin, 1)
        XCTAssertEqual(range1.end, 1)
        
        let range2 = numbers.getRange(number: 2)
        
        XCTAssertEqual(range2.begin, 2)
        XCTAssertEqual(range2.end, 2)
    }
    
}
