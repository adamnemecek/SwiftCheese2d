//
//  PinPoint.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 07/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct PinPoint {
    
    let point: CGPoint
    let type: Int           // 1 - in, -1 - out, 2 in-out, -2 out-in
    
    
    static func buildSimple(pt: Point, ms: Point, sl: Point) -> PinPoint {
        let isCCW = self.isCCW(a: ms, b: pt, c: sl)
        let type: Int = isCCW ? -1 : 1
        
        let point = DataNormalizer.convert(point: pt)

        return PinPoint(point: point, type: type)
    }
    
    
    private static func isCCW(a: Point, b: Point, c: Point) -> Bool {
        let m0 = Int64(c.y - a.y) * Int64(b.x - a.x)
        let m1 = Int64(b.y - a.y) * Int64(c.x - a.x)
        
        return m0 < m1
    }
    
}
