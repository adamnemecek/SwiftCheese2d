//
//  PinPath.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct PinPathVertex {
    let pt: Point
    let ms: Int
    let ed: Int
    let sl: Int
}

struct PinPath {
    
    let v0: PinPathVertex
    let v1: PinPathVertex

    let isZeroCorner: Int
    let length: Int
    let offsetFactor: Int64
    
    var isZeroLength: Bool {
        return v0.pt == v1.pt
    }
    
    
    init(v0: PinPathVertex, v1: PinPathVertex, mpOffset: Int64, isZeroCorner: Int, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.isZeroCorner = isZeroCorner
        self.length = length
        self.offsetFactor = mpOffset
    }
    
    
    private init(v0: PinPathVertex, v1: PinPathVertex, mp0: Point, isZeroCorner: Int, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.isZeroCorner = isZeroCorner
        self.length = length
        let dx = mp0.x - v0.pt.x
        let dy = mp0.y - v0.pt.y
        self.offsetFactor = dx * dx + dy * dy
    }

    
    static func buildPinPath(ms0Pt: IndexPoint, ms1Pt: IndexPoint, sl0Pt: IndexPoint, sl1Pt: IndexPoint, msCount: Int, slCount: Int) -> PinPath {
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
                    sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                } else {
                    ms0Point = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = maxSlPt.index
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
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
                    sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
            }
        } else {
            // right-top point ms = 1
            if ms1Pt.point != maxSlPt.point {
                if ms1Pt.isBigger(a: maxSlPt) {
                    ms1Point = maxSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                } else {
                    ms1Point = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = maxSlPt.index
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
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
                    sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
            }
        }
        
        let edIx = ms0Pt.index
        
        let v0 = PinPathVertex(pt: ms0Point, ms: ms0Ix, ed: edIx, sl: sl0Ix)
        let v1 = PinPathVertex(pt: ms1Point, ms: ms1Ix, ed: edIx, sl: sl1Ix)
        
        return PinPath(v0: v0, v1: v1, mp0: ms0Pt.point, isZeroCorner: 0, length: 1)
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
    
    
    func extract(points: [Point]) -> [CGPoint] {
        let n = points.count
        var path = [CGPoint]()
        
        guard length > 1 else {
            return [DataNormalizer.convert(point: v0.pt), DataNormalizer.convert(point: v1.pt)]
        }
        
        path.reserveCapacity(length + 1)
        path.append(DataNormalizer.convert(point: v0.pt))
        
        let a = (v0.ms + 1) % n
        let b = (v1.ms - 1 + n) % n

        if isZeroCorner == 1 && a != 0 {
            let lastIndex = n - 1
            if a <= lastIndex {
                if a != lastIndex {
                    let firstPart = Array(points[a...lastIndex])
                    path.append(contentsOf: DataNormalizer.convert(iPoints: firstPart))
                } else {
                    path.append(DataNormalizer.convert(point: points[lastIndex]))
                }
            }
            
            if b >= 0 {
                if b != 0 {
                    let secondPart = Array(points[0...b])
                    path.append(contentsOf: DataNormalizer.convert(iPoints: secondPart))
                } else {
                    path.append(DataNormalizer.convert(point: points[0]))
                }
            }
        } else if a != v1.ms {
            if a < b {
                let part = Array(points[a...b])
                path.append(contentsOf: DataNormalizer.convert(iPoints: part))
            } else if a == b {
                path.append(DataNormalizer.convert(point: points[a]))
            }
        }
        
        path.append(DataNormalizer.convert(point: v1.pt))
        
        return path
    }
}


