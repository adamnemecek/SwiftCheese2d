//
//  PinPoint.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 07/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct PinPoint {
    
    public let point: CGPoint
    public let type: Int            // 1 - in, -1 - out, 2 in-out, -2 out-in
    let offsetFactor: Int64
    let edge: Int                   // master edge index
    
    let slavePrev: Int
    let slaveNext: Int
    let masterPrev: Int
    let masterNext: Int

    static func buildSimple(pt: Point, ms0: IndexPoint, ms1: IndexPoint, sl0: IndexPoint, sl1: IndexPoint, edge: IndexPoint) -> PinPoint {
        let isCCW = self.isCCW(a: ms1.point, b: pt, c: sl1.point)
        let type: Int = isCCW ? -1 : 1
        
        let point = DataNormalizer.convert(point: pt)
        
        let dx = edge.point.x - pt.x
        let dy = edge.point.y - pt.y
        let offsetFactor = dx * dx + dy * dy
        
        return PinPoint(point: point, type: type, offsetFactor: offsetFactor, edge: edge.index,
                        slavePrev: sl0.index, slaveNext: sl1.index, masterPrev: ms0.index, masterNext: ms1.index)
    }

    
    static func buildOnMaster(pt: Point, ms0: IndexPoint, ms1: IndexPoint, sl0: IndexPoint, sl1: IndexPoint, edge: IndexPoint) -> PinPoint {
        let isCCW0 = self.isCCW(a: pt, b: ms1.point, c: sl0.point)
        let isCCW1 = self.isCCW(a: pt, b: ms1.point, c: sl1.point)
        
        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2
        } else {
            type = isCCW0 ? -1 : 1
        }

        let point = DataNormalizer.convert(point: pt)
        
        let dx = edge.point.x - pt.x
        let dy = ms0.point.y - pt.y
        let offsetFactor = dx * dx + dy * dy
        
        return PinPoint(point: point, type: type, offsetFactor: offsetFactor, edge: edge.index,
                        slavePrev: sl0.index, slaveNext: sl1.index, masterPrev: ms0.index, masterNext: ms1.index)
    }
    
    
    static func buildOnSlave(pt: Point, ms0: IndexPoint, ms1: IndexPoint, sl0: IndexPoint, sl1: IndexPoint, edge: IndexPoint) -> PinPoint {
        let isCCW0 = self.isCCW(a: pt, b: ms0.point, c: sl1.point)
        let isCCW1 = self.isCCW(a: pt, b: ms1.point, c: sl1.point)
        
        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2
        } else {
            type = isCCW0 ? -1 : 1
        }
        
        let point = DataNormalizer.convert(point: pt)

        return PinPoint(point: point, type: type, offsetFactor: 0, edge: edge.index,
                        slavePrev: sl0.index, slaveNext: sl1.index, masterPrev: ms0.index, masterNext: ms1.index)
    }
    
    
    static func buildOnCross(pt: Point, ms0: IndexPoint, ms1: IndexPoint, sl0: IndexPoint, sl1: IndexPoint, edge: IndexPoint) -> PinPoint {
        let corner = Corner(o: pt, a: ms0.point, b: ms1.point)
        
        let isSl0 = corner.isBetween(p: sl0.point)
        let isSl1 = corner.isBetween(p: sl1.point)

        let type: Int
        if isSl0 && isSl1 {
            type = -2
        } else if !isSl0 && !isSl1 {
            type = 2
        } else {
            type = isSl0 ? 1 : -1
        }
        
        let point = DataNormalizer.convert(point: pt)
        
        return PinPoint(point: point, type: type, offsetFactor: 0, edge: edge.index,
                        slavePrev: sl0.index, slaveNext: sl1.index, masterPrev: ms0.index, masterNext: ms1.index)
    }
    
    
    private static func isCCW(a: Point, b: Point, c: Point) -> Bool {
        let m0 = Int64(c.y - a.y) * Int64(b.x - a.x)
        let m1 = Int64(b.y - a.y) * Int64(c.x - a.x)
        
        return m0 < m1
    }
    
}
