//
//  PinPoint.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 07/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinPointDef {
    let pt: Point
    let ms0: IndexPoint
    let ms1: IndexPoint
    let sl0: IndexPoint
    let sl1: IndexPoint
    let masterMileStone: PathMileStone
    let slaveMileStone: PathMileStone
}


public struct PinPoint {

    let point: Point
    let type: Int            // 1 - in, -1 - out, 2 in-out, -2 out-in
    let masterMileStone: PathMileStone
    let slaveMileStone: PathMileStone


    static func buildSimple(def: PinPointDef) -> PinPoint {
        let isCCW = self.isCCW(a: def.ms1.point, b: def.pt, c: def.sl1.point)
        let type: Int = isCCW ? -1 : 1
        
        return PinPoint(point: def.pt, type: type,
                        masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }

    
    static func buildOnMaster(def: PinPointDef) -> PinPoint {
        let isCCW0 = self.isCCW(a: def.pt, b: def.ms1.point, c: def.sl0.point)
        let isCCW1 = self.isCCW(a: def.pt, b: def.ms1.point, c: def.sl1.point)
        
        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2
        } else {
            type = isCCW0 ? -1 : 1
        }

        return PinPoint(point: def.pt, type: type,
                        masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }
    
    
    static func buildOnSlave(def: PinPointDef) -> PinPoint {
        let isCCW0 = self.isCCW(a: def.pt, b: def.ms0.point, c: def.sl1.point)
        let isCCW1 = self.isCCW(a: def.pt, b: def.ms1.point, c: def.sl1.point)
        
        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2
        } else {
            type = isCCW0 ? -1 : 1
        }

        return PinPoint(point: def.pt, type: type,
                        masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }
    
    
    static func buildOnCross(def: PinPointDef) -> PinPoint {
        let corner = Corner(o: def.pt, a: def.ms0.point, b: def.ms1.point)
        
        let isSl0 = corner.isBetween(p: def.sl0.point)
        let isSl1 = corner.isBetween(p: def.sl1.point)

        let type: Int
        if isSl0 && isSl1 {
            type = -2
        } else if !isSl0 && !isSl1 {
            type = 2
        } else {
            type = isSl0 ? 1 : -1
        }

        return PinPoint(point: def.pt, type: type,
                        masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }
    
    
    private static func isCCW(a: Point, b: Point, c: Point) -> Bool {
        let m0 = Int64(c.y - a.y) * Int64(b.x - a.x)
        let m1 = Int64(b.y - a.y) * Int64(c.x - a.x)
        
        return m0 < m1
    }
    
}
