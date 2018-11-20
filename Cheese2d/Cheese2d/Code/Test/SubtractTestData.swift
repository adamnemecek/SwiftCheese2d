//
//  SubtractTestData.swift
//  Tests
//
//  Created by Nail Sharipov on 20/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public class SubtractTestData {
    
    public struct Result {
        public let master: [CGPoint]
        public let slave: [CGPoint]
    }
    
    public static let count = 20
    
    public static func data(index: Int) -> Result {
        
        let master: [CGPoint]
        let slave: [CGPoint]
        
        switch index {
        case 1:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_1()
        case 2:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_2()
        case 3:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_3()
        case 4:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_4()
        case 5:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_5()
        case 6:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_6()
        case 7:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_7()
        case 8:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_8()
        case 9:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_9()
        case 10:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_10()
        case 11:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_11()
        case 12:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_12()
        case 13:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_13()
        case 14:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_14()
        case 15:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_15()
        case 16:
            master = SubtractTestData.slave_16()
            slave = SubtractTestData.master_16()
        case 17:
            master = SubtractTestData.slave_17()
            slave = SubtractTestData.master_17()
        case 18:
            master = SubtractTestData.master_18()
            slave = SubtractTestData.slave_spiral()
        case 19:
            master = SubtractTestData.master_19()
            slave = SubtractTestData.slave_spiral()
        default:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_0()
        }
    
        return Result(master: master, slave: slave)
    }
    
    private static func master_square() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
    }
    
    
    private static func slave_0() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 5, y: -15),
            CGPoint(x: 5, y: 0),
            CGPoint(x: -5, y: 0)
        ]
    }
    
    
    private static func slave_1() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 15)
        ]
    }
    
    
    private static func slave_2() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_3() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_4() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -10, y: 10)
        ]
    }
    
    
    private static func slave_5() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -20, y: 10)
        ]
    }
    
    
    private static func slave_6() -> [CGPoint] {
        return [
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_7() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: -15),
            CGPoint(x: 0, y: 0),
            CGPoint(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_8() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_9() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_10() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 5),
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_11() -> [CGPoint] {
        return [
            CGPoint(x: -30, y: -10),
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_12() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 5)
        ]
    }
    
    
    private static func slave_13() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: -10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 0, y: -15)
        ]
    }
    
    
    private static func slave_14() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 5),
            CGPoint(x: 5, y: 10)
        ]
    }
    
    
    private static func slave_15() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 5),
            CGPoint(x: 5, y: 10)
        ]
    }
    
    
    private static func slave_16() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 10),
            CGPoint(x: 0, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: 10)
        ]
    }
    
    
    private static func master_16() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 0, y: 10),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
    }
    
    private static func slave_17() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -5),
            CGPoint(x: -5, y: 5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func master_17() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 0, y: -5),
            CGPoint(x: -5, y: -5)
        ]
    }
    
    
    private static func slave_spiral() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 20),
            CGPoint(x: -15, y: 20),
            CGPoint(x: -15, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 30),
            CGPoint(x: -25, y: 30),
            CGPoint(x: -25, y: -20),
            CGPoint(x: 20, y: -20),
            CGPoint(x: 20, y: 20),
            CGPoint(x: 15, y: 20),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -20, y: -15),
            CGPoint(x: -20, y: 25),
            CGPoint(x: 5, y: 25),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: 15),
            CGPoint(x: -5, y: 15),
            CGPoint(x: -5, y: 0)
            
        ]
    }
    
    private static func master_18() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 10),
            CGPoint(x: 12.5, y: 10),
            CGPoint(x: 12.5, y: 5),
            CGPoint(x: -7.5, y: 5)
        ]
    }
    
    
    private static func master_19() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 2.5),
            CGPoint(x: 12.5, y: 2.5),
            CGPoint(x: 12.5, y: -2.5),
            CGPoint(x: -7.5, y: -2.5)
        ]
    }

}