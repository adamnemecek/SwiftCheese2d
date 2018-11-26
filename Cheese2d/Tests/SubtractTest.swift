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


public class SubtractTest: XCTestCase {
    
    
    func test_0() {
        let data = SubtractTestData.data(index: 0)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 1)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 2)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 3)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 4)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 5)
        let master = data.master
        let slave = data.slave
        
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
        let data = SubtractTestData.data(index: 6)
        let master = data.master
        let slave = data.slave
        
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
    
    
    func test_7() {
        let data = SubtractTestData.data(index: 7)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 0, y: 0),
            CGPoint(x: -10, y: 0),
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_8() {
        let data = SubtractTestData.data(index: 8)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 0, y: 10),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 10),
            CGPoint(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    
    func test_9() {
        let data = SubtractTestData.data(index: 9)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 0, y: 10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 5, y: -10),
            CGPoint(x: 0, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_10() {
        let data = SubtractTestData.data(index: 10)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 10, y: 10),
            CGPoint(x: -5, y: 5),
            CGPoint(x: 0, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_11() {
        let data = SubtractTestData.data(index: 11)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 10, y: 10),
            CGPoint(x: -10, y: 0),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_12() {
        let data = SubtractTestData.data(index: 12)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 10, y: 5),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_13() {
        let data = SubtractTestData.data(index: 13)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .noIntersections)
        XCTAssertEqual(solution.pathCollection.count, 0)
    }
    
    
    func test_14() {
        let data = SubtractTestData.data(index: 14)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 4)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 10, y: 5),
            CGPoint(x: 5, y: 10),
            CGPoint(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = solution.pathCollection[2]
        let sample2 = [
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path2, sample2)

        let path3 = solution.pathCollection[3]
        let sample3 = [
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path3, sample3)
    }
    
    // spiral
    func test_17() {
        let data = SubtractTestData.data(index: 17)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 3)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -7.5, y: 5),
            CGPoint(x: -7.5, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = solution.pathCollection[2]
        let sample2 = [
            CGPoint(x: 10, y: 5),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 12.5, y: 10),
            CGPoint(x: 12.5, y: 5),
        ]
        
        XCTAssertEqual(path2, sample2)
    }
    
    
    func test_18() {
        let data = SubtractTestData.data(index: 18)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: -5, y: 2.5),
            CGPoint(x: -5, y: 0),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 2.5),
            CGPoint(x: 5, y: 2.5),
            CGPoint(x: 5, y: -2.5),
            CGPoint(x: -7.5, y: -2.5),
            CGPoint(x: -7.5, y: 2.5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 10, y: -2.5),
            CGPoint(x: 10, y: 2.5),
            CGPoint(x: 12.5, y: 2.5),
            CGPoint(x: 12.5, y: -2.5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_19() {
        let data = SubtractTestData.data(index: 19)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 0, y: -5),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_20() {
        let data = SubtractTestData.data(index: 20)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 10, y: 10),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_21() {
        let data = SubtractTestData.data(index: 21)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 10, y: 5),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_22() {
        let data = SubtractTestData.data(index: 22)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 0, y: -5),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 5, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_23() {
        let data = SubtractTestData.data(index: 23)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_24() {
        let data = SubtractTestData.data(index: 24)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 15, y: 5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 5, y: -5),
            CGPoint(x: 15, y: -5),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_25() {
        let data = SubtractTestData.data(index: 25)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 15, y: 5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 5, y: -5),
            CGPoint(x: 15, y: -2.5),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_26() {
        let data = SubtractTestData.data(index: 26)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: 15, y: 5),
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_27() {
        let data = SubtractTestData.data(index: 27)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_28() {
        let data = SubtractTestData.data(index: 28)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 2)
        
        let path0 = solution.pathCollection[0]
        let sample0 = [
            CGPoint(x: -10, y: 0),
            CGPoint(x: -5, y: 0),
            CGPoint(x: -5, y: -5),
            CGPoint(x: -10, y: -5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = solution.pathCollection[1]
        let sample1 = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: -5, y: 10),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -10, y: 5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_29() {
        let data = SubtractTestData.data(index: 29)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        
        XCTAssertEqual(path.count, 5)
    }
    
    
    func test_30() {
        let data = SubtractTestData.data(index: 30)
        let master = data.master
        let slave = data.slave
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.pathCollection.count, 1)
        
        let path = solution.pathCollection[0]
        let sample = [
            CGPoint(x: 0, y: 5),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -5, y: 10),
            CGPoint(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
}
