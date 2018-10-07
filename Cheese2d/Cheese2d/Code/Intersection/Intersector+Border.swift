//
//  Intersector+Border.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 07/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


extension Intersector {
    
    static func buildBorder(ms0Pt: IndexPoint, ms1Pt: IndexPoint, sl0Pt: IndexPoint, sl1Pt: IndexPoint, msCount: Int, slCount: Int) -> Border {
        let minSlPt: IndexPoint
        let maxSlPt: IndexPoint
        
        if sl0Pt.isBigger(a: sl1Pt) {
            minSlPt = sl1Pt
            maxSlPt = sl0Pt
        } else {
            minSlPt = sl0Pt
            maxSlPt = sl1Pt
        }
        
        
        let ms0Point: Point
        let ms1Point: Point
        let ms0Ix: Int
        let ms1Ix: Int
        let sl0Ix: Int
        let sl1Ix: Int
        
        if ms0Pt.isBigger(a: ms1Pt) {
            // right-top point ms = 0
            if ms0Pt.point != maxSlPt.point {
                if ms0Pt.isBigger(a: maxSlPt) {
                    ms0Point = maxSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = Intersector.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                } else {
                    ms0Point = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = maxSlPt.index
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = Intersector.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
            }
            
            // left-bottom point ms = 1
            if ms1Pt.point != minSlPt.point {
                if ms1Pt.isBigger(a: minSlPt) {
                    ms1Point = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = minSlPt.index
                } else {
                    ms1Point = minSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = Intersector.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = Intersector.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
            }
        } else {
            // right-top point ms = 1
            if ms1Pt.point != maxSlPt.point {
                if ms1Pt.isBigger(a: maxSlPt) {
                    ms1Point = maxSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = Intersector.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                } else {
                    ms1Point = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = maxSlPt.index
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = Intersector.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
            }
            
            // left-bottom point ms = 0
            if ms0Pt.point != minSlPt.point {
                if ms0Pt.isBigger(a: minSlPt) {
                    ms0Point = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = minSlPt.index
                } else {
                    ms0Point = minSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = Intersector.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = Intersector.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
            }
        }
        
        let edIx = ms0Pt.index
        
        let v0 = BorderVertex(pt: ms0Point, ms: ms0Ix, ed: edIx, sl: sl0Ix)
        let v1 = BorderVertex(pt: ms1Point, ms: ms1Ix, ed: edIx, sl: sl1Ix)
        
        return Border(v0: v0, v1: v1, mp0: ms0Pt.point, isZeroCorner: 0, length: 1)
    }
    
    
    private static func nextSlave(sl0: Int, sl1: Int, slCount: Int) -> Int {
        if sl0 > sl1 {
            let i = sl0 + 1
            return i != slCount ? i : 0
        } else {
            let i = sl0 - 1
            return i >= 0 ? i : slCount - 1
        }
    }
    
}
