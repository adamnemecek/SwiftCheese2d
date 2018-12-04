//
//  CombineTestData.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 29/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

final class CombineTestData {
    
    struct Result {
        let master: [CGPoint]
        let slave: [CGPoint]
    }
    
    static let count = 41
    static let active = 40
    
    static func data(index: Int) -> Result {
        
        let master: [CGPoint]
        let slave: [CGPoint]
        
        switch index {
        case 1:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_1()
        case 2:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_2()
        case 3:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_3()
        case 4:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_4()
        case 5:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_5()
        case 6:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_6()
        case 7:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_7()
        case 8:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_8()
        case 9:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_9()
        case 10:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_10()
        case 11:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_11()
        case 12:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_12()
        case 13:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_13()
        case 14:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_14()
        case 15:
            master = CombineTestData.master_15()
            slave = CombineTestData.slave_15()
        case 16:
            master = CombineTestData.master_16()
            slave = CombineTestData.slave_16()
        case 17:
            master = CombineTestData.master_17()
            slave = CombineTestData.slave_spiral()
        case 18:
            master = CombineTestData.master_18()
            slave = CombineTestData.slave_spiral()
        case 19:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_19()
        case 20:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_20()
        case 21:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_21()
        case 22:
            master = CombineTestData.master_22()
            slave = CombineTestData.slave_22()
        case 23:
            master = CombineTestData.master_23()
            slave = CombineTestData.slave_23()
        case 24:
            master = CombineTestData.master_24()
            slave = CombineTestData.slave_24()
        case 25:
            master = CombineTestData.master_25()
            slave = CombineTestData.slave_25()
        case 26:
            master = CombineTestData.master_26()
            slave = CombineTestData.slave_26()
        case 27:
            master = CombineTestData.master_27()
            slave = CombineTestData.slave_27()
        case 28:
            master = CombineTestData.master_28()
            slave = CombineTestData.slave_28()
        case 29:
            master = CombineTestData.master_29()
            slave = CombineTestData.slave_29()
        case 30:
            master = CombineTestData.master_30()
            slave = CombineTestData.slave_30()
        case 31:
            master = CombineTestData.master_31()
            slave = CombineTestData.slave_spiral()
        case 32:
            master = CombineTestData.master_32()
            slave = CombineTestData.slave_spiral()
        case 33:
            master = CombineTestData.master_33()
            slave = CombineTestData.slave_spiral()
        case 34:
            master = CombineTestData.master_34()
            slave = CombineTestData.slave_spiral()
        case 35:
            master = CombineTestData.master_35()
            slave = CombineTestData.slave_spiral_modified_0()
        case 36:
            master = CombineTestData.master_36()
            slave = CombineTestData.slave_36()
        case 37:
            master = CombineTestData.master_37()
            slave = CombineTestData.slave_37()
        case 38:
            master = CombineTestData.master_38()
            slave = CombineTestData.slave_spiral()
        case 39:
            master = CombineTestData.master_39()
            slave = CombineTestData.slave_39()
        case 40:
            master = CombineTestData.master_40()
            slave = CombineTestData.slave_40()
        default:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_0()
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
            CGPoint(x: -5, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 5, y: -15),
            CGPoint(x: -5, y: -15)
        ]
    }
    
    
    private static func slave_1() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -5, y: -15)
        ]
    }
    
    
    private static func slave_2() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 10),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -5, y: -15)
        ]
    }
    
    
    private static func slave_3() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 10),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -5, y: -10)
        ]
    }
    
    
    private static func slave_4() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -5, y: -10)
        ]
    }
    
    
    private static func slave_5() -> [CGPoint] {
        return [
            CGPoint(x: -20, y: 10),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 0, y: -10)
        ]
    }
    
    
    private static func slave_6() -> [CGPoint] {
        return [
            CGPoint(x: -15, y: 0),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -15)
        ]
    }
    
    
    private static func slave_7() -> [CGPoint] {
        return [
            CGPoint(x: -15, y: 0),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: -15)
        ]
    }
    
    
    private static func slave_8() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 10),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 0)
        ]
    }
    
    
    private static func slave_9() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: -5, y: -10)
        ]
    }
    
    
    private static func slave_10() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 10),
            CGPoint(x: 0, y: -10),
            CGPoint(x: -5, y: 5)
        ]
    }
    
    
    private static func slave_11() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 10),
            CGPoint(x: 0, y: -10),
            CGPoint(x: -30, y: -10)
        ]
    }
    
    
    private static func slave_12() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 5),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 0, y: 0)
        ]
    }
    
    
    private static func slave_13() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: -15),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10)
        ]
    }
    
    
    private static func slave_14() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 10),
            CGPoint(x: 10, y: 5),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 5, y: -10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_15() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 0, y: -5),
            CGPoint(x: 0, y: 10)
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
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: 5),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -5, y: -5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: 10)
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
            CGPoint(x: -5, y: 0),
            CGPoint(x: -5, y: 15),
            CGPoint(x: -10, y: 15),
            CGPoint(x: -10, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: 25),
            CGPoint(x: -20, y: 25),
            CGPoint(x: -20, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 20),
            CGPoint(x: 20, y: 20),
            CGPoint(x: 20, y: -20),
            CGPoint(x: -25, y: -20),
            CGPoint(x: -25, y: 30),
            CGPoint(x: 10, y: 30),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -15, y: -10),
            CGPoint(x: -15, y: 20),
            CGPoint(x: 0, y: 20),
            CGPoint(x: 0, y: 0)
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
            CGPoint(x: 0, y: -5),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 10, y: 0)
        ]
    }
    
    private static func slave_20() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 0),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_21() -> [CGPoint] {
        return [
            CGPoint(x: 15, y: 5),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 5)
        ]
    }
    
    private static func slave_22() -> [CGPoint] {
        return [
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 5),
            CGPoint(x: 0, y: 5),
            CGPoint(x: 0, y: -10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 10)
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
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 5),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -10, y: 10)
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
            CGPoint(x: 15, y: 5),
            CGPoint(x: 15, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -5, y: 5)
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
            CGPoint(x: 15, y: 5),
            CGPoint(x: 25, y: 0),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -5, y: 5)
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
            CGPoint(x: 15, y: 5),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 15)
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
            CGPoint(x: 10, y: 0),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -10, y: -10),
            CGPoint(x: -10, y: 0)
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
            CGPoint(x: 0, y: 0),
            CGPoint(x: -15, y: 0),
            CGPoint(x: -15, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 10),
            CGPoint(x: -20, y: 10),
            CGPoint(x: -20, y: 20),
            CGPoint(x: 10, y: 20),
            CGPoint(x: 10, y: -15),
            CGPoint(x: -20, y: -15),
            CGPoint(x: -20, y: 5),
            CGPoint(x: 0, y: 5)
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
            CGPoint(x: 0, y: 0),
            CGPoint(x: -15, y: 0),
            CGPoint(x: -15, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 10),
            CGPoint(x: -20, y: 10),
            CGPoint(x: -20, y: 20),
            CGPoint(x: 10, y: 20),
            CGPoint(x: 10, y: -15),
            CGPoint(x: -20, y: -15),
            CGPoint(x: -20, y: 5),
            CGPoint(x: 0, y: 5)
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
            CGPoint(x: 5, y: 0),
            CGPoint(x: -10, y: 0),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: -15, y: 10),
            CGPoint(x: -15, y: 20),
            CGPoint(x: 15, y: 20),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: 5),
            CGPoint(x: 5, y: 5)
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
    
    private static func slave_spiral_modified_0() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 0),
            CGPoint(x: -5, y: 15),
            CGPoint(x: -10, y: 15),
            CGPoint(x: -10, y: -5),
            CGPoint(x: 5, y: -5),
            CGPoint(x: 5, y: 25),
            CGPoint(x: -20, y: 25),
            CGPoint(x: -20, y: -14),
            CGPoint(x: 15, y: -14),
            CGPoint(x: 15, y: 20),
            CGPoint(x: 20, y: 20),
            CGPoint(x: 20, y: -20),
            CGPoint(x: -25, y: -20),
            CGPoint(x: -25, y: 30),
            CGPoint(x: 10, y: 30),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -15, y: -10),
            CGPoint(x: -15, y: 20),
            CGPoint(x: 0, y: 20),
            CGPoint(x: 0, y: 0)
        ]
    }
    
    private static func master_35() -> [CGPoint] {
        return [
            CGPoint(x: -20, y: -15),
            CGPoint(x: 12, y: -5),
            CGPoint(x: 15, y: -9),
            CGPoint(x: -15, y: -15)
        ]
    }
    
    private static func slave_36() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -5, y: 15),
            CGPoint(x: 0, y: 15)
        ]
    }
    
    private static func master_36() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -10, y: 10)
        ]
    }
    
    private static func slave_37() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -5, y: 15),
            CGPoint(x: 0, y: 15)
        ]
    }
    
    private static func master_37() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: 10),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -2, y: 2),
            CGPoint(x:  2, y: 6),
            CGPoint(x:  -2, y: 10)
        ]
    }
    
    
    private static func master_38() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: 10),
            CGPoint(x: -10, y: 10),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -15, y: -15),
            CGPoint(x: -15, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 15, y: -5),
            CGPoint(x: -5, y: -5)
        ]
    }
    
    
    private static func slave_39() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: -10, y: -5)
        ]
    }
    
    private static func master_39() -> [CGPoint] {
        return [
            CGPoint(x: -15, y: 10),
            CGPoint(x: 15, y: 10),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 5),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -15, y: -10)
        ]
    }
    
    
    private static func slave_40() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 5),
            CGPoint(x: 10, y: 5),
            CGPoint(x: 10, y: -5),
            CGPoint(x: -10, y: -5)
        ]
    }
    
    private static func master_40() -> [CGPoint] {
        return [
            CGPoint(x: -15, y: 10),
            CGPoint(x: 15, y: 10),
            CGPoint(x: 15, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 5, y: 5),
            CGPoint(x: -5, y: 5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: -15, y: -10)
        ]
    }
    
}
