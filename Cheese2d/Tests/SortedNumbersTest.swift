//
//  SortedNumbersTest.swift
//  Tests
//
//  Created by Nail Sharipov on 21/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import XCTest
@testable import Cheese2d

class SortedNumbersTest: XCTestCase {
    
    func testEmpty() {
        let numbers = SortedNumbers()

        let range = numbers.getRange(number: 0)

        XCTAssert(range.isEmpty)
    }
    
    func testSingle() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssert(range1.isEmpty)
        
        let range2 = numbers.getRange(number: -1)
        
        XCTAssert(range2.isEmpty)
    }
    
    
    func testComplexA() {
        var numbers = SortedNumbers()
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
    
    func testComplexB() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 1)
        numbers.add(number: 1)
        numbers.add(number: 2)
        numbers.add(number: 2)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 1)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssertEqual(range1.begin, 2)
        XCTAssertEqual(range1.end, 3)
        
        let range2 = numbers.getRange(number: 2)
        
        XCTAssertEqual(range2.begin, 4)
        XCTAssertEqual(range2.end, 5)
    }
    
    func testComplexC() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 1)
        numbers.add(number: 1)
        numbers.add(number: 2)
        numbers.add(number: 2)
        numbers.add(number: 2)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssertEqual(range1.begin, 1)
        XCTAssertEqual(range1.end, 2)
        
        let range2 = numbers.getRange(number: 2)
        
        XCTAssertEqual(range2.begin, 3)
        XCTAssertEqual(range2.end, 5)
    }
    
    
    func testComplexD() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 1)
        numbers.add(number: 1)
        numbers.add(number: 2)
        
        let range0 = numbers.getRange(number: 0)
        
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 2)
        
        let range1 = numbers.getRange(number: 1)
        
        XCTAssertEqual(range1.begin, 3)
        XCTAssertEqual(range1.end, 4)
        
        let range2 = numbers.getRange(number: 2)
        
        XCTAssertEqual(range2.begin, 5)
        XCTAssertEqual(range2.end, 5)
    }
    
    
    func testComplexE() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 6)
        numbers.add(number: 7)
        numbers.add(number: 7)
        
        let range0 = numbers.getRange(number: 1)
        XCTAssert(range0.isEmpty)
        
        let range1 = numbers.getRange(number: 1)
        XCTAssert(range1.isEmpty)

        let range3 = numbers.getRange(number: 5)
        XCTAssert(range3.isEmpty)
        
        let range4 = numbers.getRange(number: 6)
        XCTAssertEqual(range4.begin, 3)
        XCTAssertEqual(range4.end, 3)
    }
    
    
    func testComplexF() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 6)
        numbers.add(number: 7)
        
        let range0 = numbers.getRange(number: 0)
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        XCTAssert(range1.isEmpty)
        
        let range2 = numbers.getRange(number: 3)
        XCTAssertEqual(range2.begin, 1)
        XCTAssertEqual(range2.end, 2)
        
        let range4 = numbers.getRange(number: 6)
        XCTAssertEqual(range4.begin, 3)
        XCTAssertEqual(range4.end, 3)
        
        let range5 = numbers.getRange(number: 7)
        XCTAssertEqual(range5.begin, 4)
        XCTAssertEqual(range5.end, 4)
    }
    
    
    func testComplexG() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 7)
        
        let range0 = numbers.getRange(number: 0)
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 0)
        
        let range1 = numbers.getRange(number: 1)
        XCTAssert(range1.isEmpty)
        
        let range2 = numbers.getRange(number: 3)
        XCTAssertEqual(range2.begin, 1)
        XCTAssertEqual(range2.end, 3)
        
        let range4 = numbers.getRange(number: 6)
        XCTAssert(range4.isEmpty)
        
        let range5 = numbers.getRange(number: 7)
        XCTAssertEqual(range5.begin, 4)
        XCTAssertEqual(range5.end, 4)
    }
    
    
    func testComplexK() {
        var numbers = SortedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 3)
        numbers.add(number: 7)
        
        let range0 = numbers.getRange(number: 0)
        XCTAssertEqual(range0.begin, 0)
        XCTAssertEqual(range0.end, 6)
        
        let range1 = numbers.getRange(number: 1)
        XCTAssert(range1.isEmpty)
        
        let range2 = numbers.getRange(number: 3)
        XCTAssertEqual(range2.begin, 7)
        XCTAssertEqual(range2.end, 9)
        
        let range4 = numbers.getRange(number: 6)
        XCTAssert(range4.isEmpty)
        
        let range5 = numbers.getRange(number: 7)
        XCTAssertEqual(range5.begin, 10)
        XCTAssertEqual(range5.end, 10)
    }
    
    
    func testRandom() {
        for _ in 0...1000 {
            let count = Int(arc4random_uniform(10))
            
            var map = [Int: Cheese2d.Range]()
            
            var numbers = SortedNumbers()
            var number = 0
            for _ in 0...count {
                let shouldAdd = arc4random_uniform(100) % 2 == 0
                let step = Int(arc4random_uniform(3)) + 1
                number += Int(arc4random_uniform(3)) + 1
                if shouldAdd {
                    let begin = numbers.numbers.count
                    map[number] = Cheese2d.Range(begin: begin, end: begin + step)
                    for _ in 0...step {
                        numbers.add(number: number)
                    }
                }
            }
            
            for key in map.keys {
                let range = numbers.getRange(number: key)
                let standard = map[key]!
                XCTAssertEqual(range.begin, standard.begin)
                XCTAssertEqual(range.end, standard.end)
            }
        }
    }
}
