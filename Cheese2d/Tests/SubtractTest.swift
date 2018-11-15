//
//  SubtractTest.swift
//  Tests
//
//  Created by Nail Sharipov on 15/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


import XCTest
@testable import Cheese2d


class SubtractTest: XCTestCase {
    
    
    func test_0() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 5, y: -15),
            CGPoint(x: 5, y: 0),
            CGPoint(x: -5, y: 0)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 0),
            CGPoint(x: -5, y: 0),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10)
        ]

        XCTAssertEqual(path, sample)
    }
    
    
    func test_1() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 15)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_2() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_3() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_4() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -10, y: 10)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_5() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -20, y: 10)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -10, y: 0),
            CGPoint(x: 0, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }

    
    func test_6() {
        let master = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let slave = [
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -15, y: 0)
        ]
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 5, y: 10),
            CGPoint(x: -10, y: 2.5),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: -10, y: -2.5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
}
