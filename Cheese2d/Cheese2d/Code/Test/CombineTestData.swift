//
//  CombineTestData.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 29/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

class CombineTestData {
    
    struct Result {
        let master: [CGPoint]
        let slave: [CGPoint]
    }
    
    static let count = 2
    static let active = 1
    
    static func data(index: Int) -> Result {
        
        let master: [CGPoint]
        let slave: [CGPoint]
        
        switch index {
        case 1:
            master = CombineTestData.master_square()
            slave = CombineTestData.slave_1()
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
    
}
