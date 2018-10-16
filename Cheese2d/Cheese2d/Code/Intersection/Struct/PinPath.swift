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
    let sl: Int
    let sortFactor: PathMileStone
}

struct PinPath {
    
    let v0: PinPathVertex
    let v1: PinPathVertex

    let length: Int
    
    var isZeroLength: Bool {
        return v0.pt == v1.pt
    }
    
    
    init(v0: PinPathVertex, v1: PinPathVertex, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.length = length
    }
    
    
    static func buildPinPath(ms0Pt: IndexPoint, ms1Pt: IndexPoint, sl0Pt: IndexPoint, sl1Pt: IndexPoint, msCount: Int, slCount: Int) -> PinPath {
        let minSlPt: IndexPoint
        let maxSlPt: IndexPoint
        
        if sl0Pt > sl1Pt {
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
        
        let sortFactor0: PathMileStone
        let sortFactor1: PathMileStone

        if ms0Pt > ms1Pt {
            // right-top point ms = 0
            if ms0Pt.point != maxSlPt.point {
                if ms0Pt > maxSlPt {
                    ms0Point = maxSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                    sortFactor0 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: ms0Point))
                } else {
                    ms0Point = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = maxSlPt.index
                    sortFactor0 = PathMileStone(index: ms0Pt.index, offset: 0)
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                sortFactor0 = PathMileStone(index: ms0Pt.index, offset: 0)
            }
            
            // left-bottom point ms = 1
            if ms1Pt.point != minSlPt.point {
                if ms1Pt > minSlPt {
                    ms1Point = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = minSlPt.index
                    sortFactor1 = PathMileStone(index: ms1Pt.index, offset: 0)
                } else {
                    ms1Point = minSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                    sortFactor1 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: ms1Point))
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                sortFactor1 = PathMileStone(index: ms1Pt.index, offset: 0)
            }
        } else {
            // right-top point ms = 1
            if ms1Pt.point != maxSlPt.point {
                if ms1Pt > maxSlPt {
                    ms1Point = maxSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                    sortFactor1 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: ms1Point))
                } else {
                    ms1Point = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = maxSlPt.index
                    sortFactor1 = PathMileStone(index: ms1Pt.index, offset: 0)
                }
            } else {
                ms1Point = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                sortFactor1 = PathMileStone(index: ms1Pt.index, offset: 0)
            }
            
            // left-bottom point ms = 0
            if ms0Pt.point != minSlPt.point {
                if ms0Pt > minSlPt {
                    ms0Point = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = minSlPt.index
                    sortFactor0 = PathMileStone(index: ms0Pt.index, offset: 0)
                } else {
                    ms0Point = minSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                    sortFactor0 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: ms0Point))
                }
            } else {
                ms0Point = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                sortFactor0 = PathMileStone(index: ms0Pt.index, offset: 0)
            }
        }
        
        let v0 = PinPathVertex(pt: ms0Point, ms: ms0Ix, sl: sl0Ix, sortFactor: sortFactor0)
        let v1 = PinPathVertex(pt: ms1Point, ms: ms1Ix, sl: sl1Ix, sortFactor: sortFactor1)

        return PinPath(v0: v0, v1: v1, length: 1)
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
        
        guard length != 2 else {
            let middle = DataNormalizer.convert(point: points[(v0.sortFactor.index + 1 ) % n])
            return [DataNormalizer.convert(point: v0.pt), middle, DataNormalizer.convert(point: v1.pt)]
        }
        
        path.reserveCapacity(length + 1)
        path.append(DataNormalizer.convert(point: v0.pt))
        
        //var a = (v0.sortFactor.index + 1) % n
        //let b = (v1.sortFactor.index - 1 + n) % n
        
        var a = (v0.sortFactor.index + 1) % n
        let b = (v1.sortFactor.index - 1 + n) % n

        path.append(DataNormalizer.convert(point: points[a % n]))
        
        while a <= b {
            a += 1
            let index = a % n
            path.append(DataNormalizer.convert(point: points[index]))
        }
        
        /*
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
        */
        path.append(DataNormalizer.convert(point: v1.pt))
 
        return path
    }
}


