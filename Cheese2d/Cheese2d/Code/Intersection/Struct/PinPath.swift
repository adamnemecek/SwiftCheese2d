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
    let masterMileStone: PathMileStone
    let slaveMileStone: PathMileStone
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
        
        
        let pnt0: Point
        let pnt1: Point
        let ms0Ix: Int
        let ms1Ix: Int
        let sl0Ix: Int
        let sl1Ix: Int
        
        let masterMileStone0: PathMileStone
        let masterMileStone1: PathMileStone
        let slaveMileStone0: PathMileStone
        let slaveMileStone1: PathMileStone

        if ms0Pt > ms1Pt {
            // right-top point ms = 0
            if ms0Pt.point != maxSlPt.point {
                if ms0Pt > maxSlPt {
                    pnt0 = maxSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                    masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: pnt0))
                    slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: 0)
                } else {
                    pnt0 = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = maxSlPt.index
                    masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: 0)
                    slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: sl0Pt.point.sqrDistance(point: pnt0))
                }
            } else {
                pnt0 = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: 0)
            }
            
            // left-bottom point ms = 1
            if ms1Pt.point != minSlPt.point {
                if ms1Pt > minSlPt {
                    pnt1 = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = minSlPt.index
                    masterMileStone1 = PathMileStone(index: ms1Pt.index, offset: 0)
                    slaveMileStone1 = PathMileStone(index: sl0Pt.index, offset: sl0Pt.point.sqrDistance(point: pnt1))
                } else {
                    pnt1 = minSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                    masterMileStone1 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: pnt1))
                    slaveMileStone1 = PathMileStone(index: sl1Pt.index, offset: 0)
                }
            } else {
                pnt1 = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                masterMileStone1 = PathMileStone(index: ms1Pt.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: sl1Pt.index, offset: 0)
            }
        } else {
            // right-top point ms = 1
            if ms1Pt.point != maxSlPt.point {
                if ms1Pt > maxSlPt {
                    pnt1 = maxSlPt.point
                    ms1Ix = ms1Pt.index
                    sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                    masterMileStone1 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: pnt1))
                    slaveMileStone1 = PathMileStone(index: sl1Pt.index, offset: 0)
                } else {
                    pnt1 = ms1Pt.point
                    ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                    sl1Ix = maxSlPt.index
                    masterMileStone1 = PathMileStone(index: ms1Pt.index, offset: 0)
                    slaveMileStone1 = PathMileStone(index: sl0Pt.index, offset: sl0Pt.point.sqrDistance(point: pnt1))
                }
            } else {
                pnt1 = ms1Pt.point
                ms1Ix = ms1Pt.index + 1 < msCount ? ms1Pt.index + 1 : 0
                sl1Ix = PinPath.nextSlave(sl0: maxSlPt.index, sl1: minSlPt.index, slCount: slCount)
                masterMileStone1 = PathMileStone(index: ms1Pt.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: sl1Pt.index, offset: 0)
            }
            
            // left-bottom point ms = 0
            if ms0Pt.point != minSlPt.point {
                if ms0Pt > minSlPt {
                    pnt0 = ms0Pt.point
                    ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                    sl0Ix = minSlPt.index
                    masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: 0)
                    slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: sl0Pt.point.sqrDistance(point: pnt0))
                } else {
                    pnt0 = minSlPt.point
                    ms0Ix = ms0Pt.index
                    sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                    masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: ms0Pt.point.sqrDistance(point: pnt0))
                    slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: 0)
                }
            } else {
                pnt0 = ms0Pt.point
                ms0Ix = ms0Pt.index != 0 ? ms0Pt.index - 1 : msCount - 1
                sl0Ix = PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                masterMileStone0 = PathMileStone(index: ms0Pt.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: sl0Pt.index, offset: 0)
            }
        }
        
        let v0 = PinPathVertex(pt: pnt0, ms: ms0Ix, sl: sl0Ix, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        let v1 = PinPathVertex(pt: pnt1, ms: ms1Ix, sl: sl1Ix, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)

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
            let middle = DataNormalizer.convert(point: points[(v0.masterMileStone.index + 1 ) % n])
            return [DataNormalizer.convert(point: v0.pt), middle, DataNormalizer.convert(point: v1.pt)]
        }
        
        path.reserveCapacity(length + 1)
        path.append(DataNormalizer.convert(point: v0.pt))

        var a = (v0.masterMileStone.index + 1) % n
        let b = (v1.masterMileStone.index - 1 + n) % n

        path.append(DataNormalizer.convert(point: points[a % n]))
        
        while a <= b {
            a += 1
            let index = a % n
            path.append(DataNormalizer.convert(point: points[index]))
        }
        
        path.append(DataNormalizer.convert(point: v1.pt))
 
        return path
    }
    
    
    func extract(index: Int, pathCount: Int) -> [PinHandler] {
        let n = pathCount
        var handlers = [PinHandler]()
        
        let firstHandler = PinHandler(sortFactor: v0.masterMileStone, index: index, isPinPath: 1, marker: 0)
        let lastHandler = PinHandler(sortFactor: v1.masterMileStone, index: index, isPinPath: 1, marker: 1)
        
        guard length > 1 else {
            return [firstHandler, lastHandler]
        }
        
        guard length != 2 else {
            let middleIndex = (v0.masterMileStone.index + 1) % n
            let middleSortFactor = PathMileStone(index: middleIndex, offset: 0)
            let middle = PinHandler(sortFactor: middleSortFactor, index: index, isPinPath: 1, marker: 1)
            return [firstHandler, middle, lastHandler]
        }
        
        handlers.reserveCapacity(length + 1)
        handlers.append(firstHandler)
        
        var a = (v0.masterMileStone.index + 1) % n
        let b = (v1.masterMileStone.index - 1 + n) % n
        
        handlers.append(PinHandler(sortFactor: PathMileStone(index: a % n, offset: 0), index: index, isPinPath: 1, marker: 1))
        
        while a <= b {
            a += 1
            handlers.append(PinHandler(sortFactor: PathMileStone(index: a % n, offset: 0), index: index, isPinPath: 1, marker: 1))
        }
        
        handlers.append(lastHandler)
        
        return handlers
    }

    //PinHandler
}


