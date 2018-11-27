//
//  SubtractTestData.swift
//  Tests
//
//  Created by Nail Sharipov on 20/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

class SubtractTestData {
    
    struct Result {
        let master: [CGPoint]
        let slave: [CGPoint]
    }
    
    static let count = 35
    static let active = 34
    
    static func data(index: Int) -> Result {
        
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
            master = SubtractTestData.master_15()
            slave = SubtractTestData.slave_15()
        case 16:
            master = SubtractTestData.master_16()
            slave = SubtractTestData.slave_16()
        case 17:
            master = SubtractTestData.master_17()
            slave = SubtractTestData.slave_spiral()
        case 18:
            master = SubtractTestData.master_18()
            slave = SubtractTestData.slave_spiral()
        case 19:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_19()
        case 20:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_20()
        case 21:
            master = SubtractTestData.master_square()
            slave = SubtractTestData.slave_21()
        case 22:
            master = SubtractTestData.master_22()
            slave = SubtractTestData.slave_22()
        case 23:
            master = SubtractTestData.master_23()
            slave = SubtractTestData.slave_23()
        case 24:
            master = SubtractTestData.master_24()
            slave = SubtractTestData.slave_24()
        case 25:
            master = SubtractTestData.master_25()
            slave = SubtractTestData.slave_25()
        case 26:
            master = SubtractTestData.master_26()
            slave = SubtractTestData.slave_26()
        case 27:
            master = SubtractTestData.master_27()
            slave = SubtractTestData.slave_27()
        case 28:
            master = SubtractTestData.master_28()
            slave = SubtractTestData.slave_28()
        case 29:
            master = SubtractTestData.master_29()
            slave = SubtractTestData.slave_29()
        case 30:
            master = SubtractTestData.master_30()
            slave = SubtractTestData.slave_30()
        case 31:
            master = SubtractTestData.master_31()
            slave = SubtractTestData.slave_spiral()
        case 32:
            master = SubtractTestData.master_32()
            slave = SubtractTestData.slave_spiral()
        case 33:
            master = SubtractTestData.master_33()
            slave = SubtractTestData.slave_spiral()
        case 34:
            master = SubtractTestData.master_34()
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
            CGPoint(x: 0, y: 10),
            CGPoint(x: 0, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: 10)
        ]
    }
    
    
    private static func master_15() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 0, y: 10),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
    }
    
    private static func slave_16() -> [CGPoint] {
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
    
    
    private static func master_16() -> [CGPoint] {
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
    
    private static func master_17() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 10),
            CGPoint(x: 12.5, y: 10),
            CGPoint(x: 12.5, y: 5),
            CGPoint(x: -7.5, y: 5)
        ]
    }
    
    
    private static func master_18() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 2.5),
            CGPoint(x: 12.5, y: 2.5),
            CGPoint(x: 12.5, y: -2.5),
            CGPoint(x: -7.5, y: -2.5)
        ]
    }
    
    private static func slave_19() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 0, y: -5)
        ]
    }
    
    private static func slave_20() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 10),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 5, y: 0)
        ]
    }
    
    
    private static func slave_21() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 5),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 15, y: 5)
        ]
    }
    
    private static func slave_22() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 0, y: -10),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    private static func master_22() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -5, y: -5)
        ]
    }
    
    private static func slave_23() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: -10, y: 5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    private static func master_23() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5),
            CGPoint(x: 5, y: -5)
        ]
    }
    
    
    private static func slave_24() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 15, y: -5),
            CGPoint(x: 15, y: 5)
        ]
    }
    
    private static func master_24() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5),
            CGPoint(x: 5, y: -5)
        ]
    }
    
    private static func slave_25() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 25, y: 0),
            CGPoint(x: 15, y: 5)
        ]
    }
    
    private static func master_25() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5),
            CGPoint(x: 5, y: -5)
        ]
    }

    private static func slave_26() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 15, y: 5)
        ]
    }
    
    private static func master_26() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5),
            CGPoint(x: 5, y: -5)
        ]
    }
    
    private static func slave_27() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 0),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 10, y: 0)
        ]
    }
    
    private static func master_27() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: -5),
            CGPoint(x: 5, y: -5)
        ]
    }
    
    
    private static func slave_28() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 5),
            CGPoint(x: -20, y: 5),
            CGPoint(x: -20, y: -15),
            CGPoint(x: 10, y: -15),
            CGPoint(x: 10, y: 20),
            CGPoint(x: -20, y: 20),
            CGPoint(x: -20, y: 10),
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: -15, y: -10),
            CGPoint(x: -15, y: 0),
            CGPoint(x: 0, y: 0)
        ]
    }
    
    private static func master_28() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: 15),
            CGPoint(x: -5, y: 15),
            CGPoint(x: -5, y: -5)
        ]
    }
    
    private static func slave_29() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 5),
            CGPoint(x: -20, y: 5),
            CGPoint(x: -20, y: -15),
            CGPoint(x: 10, y: -15),
            CGPoint(x: 10, y: 20),
            CGPoint(x: -20, y: 20),
            CGPoint(x: -20, y: 10),
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: -15, y: -10),
            CGPoint(x: -15, y: 0),
            CGPoint(x: 0, y: 0)
        ]
    }
    
    private static func master_29() -> [CGPoint] {
        return [
            CGPoint(x: -18.5, y: -3.5),
            CGPoint(x: -15, y: 10),
            CGPoint(x: -5, y: 15),
            CGPoint(x: -10, y: 7)
        ]
    }
    
    private static func slave_30() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 5),
            CGPoint(x: -15, y: 5),
            CGPoint(x: -15, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 20),
            CGPoint(x: -15, y: 20),
            CGPoint(x: -15, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 0),
            CGPoint(x: 5, y: 0)
        ]
    }
    
    private static func master_30() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 15),
            CGPoint(x: -0, y: 15),
            CGPoint(x: -0, y: 3),
            CGPoint(x: -5, y: 3)
        ]
    }
    
    private static func master_31() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 15),
            CGPoint(x: 10, y: 15),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -11, y: -5)
        ]
    }
    
    private static func master_32() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 15),
            CGPoint(x: 10, y: 15),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -14, y: -4)
        ]
    }
    
    private static func master_33() -> [CGPoint] {
        return [
            CGPoint(x: -23, y: 20),
            CGPoint(x: 7, y: 20),
            CGPoint(x: 7, y: -16),
            CGPoint(x: -20, y: -15)
        ]
    }
    
    private static func master_34() -> [CGPoint] {
        return [
            CGPoint(x: -23, y: 20),
            CGPoint(x: 7, y: 20),
            CGPoint(x: 4, y: -16),
            CGPoint(x: -20, y: -15)
        ]
    }

}
