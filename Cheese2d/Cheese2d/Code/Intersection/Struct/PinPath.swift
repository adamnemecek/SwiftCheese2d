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
    
    
    static func buildPinPath(msPt0: IndexPoint, msPt1: IndexPoint, slPt0: IndexPoint, slPt1: IndexPoint, msCount: Int, slCount: Int) -> PinPath {
       
        let minMsPt: IndexPoint
        let maxMsPt: IndexPoint
        
        let isMsRightDirectional = msPt0 > msPt1
        
        if isMsRightDirectional {
            minMsPt = msPt1
            maxMsPt = msPt0
        } else {
            minMsPt = msPt0
            maxMsPt = msPt1
        }


        let minSlPt: IndexPoint
        let maxSlPt: IndexPoint

        let isSlRightDirectional = slPt0 > slPt1

        if isSlRightDirectional {
            minSlPt = slPt1
            maxSlPt = slPt0
        } else {
            minSlPt = slPt0
            maxSlPt = slPt1
        }

        let pnt0: Point
        let pnt1: Point
        let adjMsIx0: Int
        let adjMsIx1: Int
        let adjSlIx0: Int
        let adjSlIx1: Int
        
        let masterMileStone0: PathMileStone
        let masterMileStone1: PathMileStone
        let slaveMileStone0: PathMileStone
        let slaveMileStone1: PathMileStone


        if minMsPt.point != minSlPt.point {
            
            if minMsPt > minSlPt {
                
                if isMsRightDirectional {
                    pnt0 = minMsPt.point
                    adjMsIx0 = (minMsPt.index + msCount - 1) % msCount
                    masterMileStone0 = PathMileStone(index: minMsPt.index, offset: 0)
                    
                    adjSlIx0 = minSlPt.index
                } else {
                    pnt1 = minMsPt.point
                    adjMsIx1 = (minMsPt.index + 1) % msCount
                    adjSlIx1 = minSlPt.index
                    masterMileStone1 = PathMileStone(index: minMsPt.index, offset: 0)
                }

                if isSlRightDirectional {
                    slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: minSlPt.point.sqrDistance(point: minMsPt.point))
                } else {
                    slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: maxSlPt.point.sqrDistance(point: minMsPt.point))
                }

            } else {
                
                if isMsRightDirectional {
                    pnt0 = minSlPt.point
                    adjMsIx1 = minMsPt.index
                    masterMileStone0 = PathMileStone(index: minMsPt.index, offset: minMsPt.point.sqrDistance(point: minSlPt.point))
                } else {
                    pnt1 = minSlPt.point
                    adjMsIx0 = minMsPt.index
                    masterMileStone1 = PathMileStone(index: minMsPt.index, offset: minMsPt.point.sqrDistance(point: minSlPt.point))
                }
                
                if isSlRightDirectional {
                    adjSlIx0 = (minSlPt.index + slCount - 1) % slCount
                    slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: 0)
                } else {
                    adjSlIx1 = (minSlPt.index + 1) % slCount
                    slaveMileStone1 = PathMileStone(index: minSlPt.index, offset: 0)
                }
                
            }
        } else {
            
            if isMsRightDirectional {
                pnt0 = minMsPt.point
                adjMsIx1 = (minMsPt.index + msCount - 1) % msCount
                masterMileStone0 = PathMileStone(index: minMsPt.index, offset: 0)
            } else {
                pnt1 = minSlPt.point
                adjMsIx0 = (minMsPt.index + 1) % msCount
                masterMileStone1 = PathMileStone(index: minMsPt.index, offset: 0)
            }
            
            
            if isSlRightDirectional {
                adjSlIx0 = (minSlPt.index + slCount - 1) % slCount
                slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: 0)
            } else {
                adjSlIx1 = (minSlPt.index + 1) % slCount
                slaveMileStone1 = PathMileStone(index: minSlPt.index, offset: 0)
            }
            
        }
        
        // left-bottom point ms = 1
        if maxMsPt.point != maxSlPt.point {
            
            if maxMsPt > maxSlPt {

                if isMsRightDirectional {
                    pnt1 = maxSlPt.point
                    adjMsIx0 = maxMsPt.index
                    masterMileStone0 = PathMileStone(index: minMsPt.index, offset: minMsPt.point.sqrDistance(point: maxSlPt.point))
                } else {
                    pnt0 = minSlPt.point
                    adjMsIx0 = minMsPt.index
                    masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: maxMsPt.point.sqrDistance(point: minSlPt.point))
                }
                
                if isSlRightDirectional {
                    adjSlIx0 = (minSlPt.index + slCount - 1) % slCount
                    slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: 0)
                } else {
                    adjSlIx1 = (minSlPt.index + 1) % slCount
                    slaveMileStone1 = PathMileStone(index: minSlPt.index, offset: 0)
                }
                
                
                pnt1 = maxMsPt.point
                adjMsIx0 = (maxMsPt.index + aMsIxInc) % msCount
                adjSlIx1 = maxSlPt.index
                masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: maxSlPt.point.sqrDistance(point: pnt1))
            } else {
                pnt1 = maxSlPt.point
                adjMsIx0 = maxMsPt.index
                adjSlIx1 = (maxSlPt.index + aSlIxInc) % slCount
                masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: maxMsPt.point.sqrDistance(point: pnt1))
                slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: 0)
            }
        } else {
            pnt1 = maxMsPt.point
            adjMsIx0 = (maxMsPt.index + aMsIxInc) % msCount
            adjSlIx1 = (maxSlPt.index + aSlIxInc) % slCount
            masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: 0)
            slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: 0)
        }
        
        
        
        /*
        if msPt0 > msPt1 {
            // right-top point ms = 0
            if msPt0.point != aSlPt1.point {
                if msPt0 > aSlPt1 {
                    pnt0 = aSlPt1.point
                    msIx0 = msPt0.index
                    slIx0 = PinPath.nextSlave(sl0: aSlPt1.index, sl1: aSlPt0.index, slCount: slCount)
                    masterMileStone0 = PathMileStone(index: msPt0.index, offset: msPt0.point.sqrDistance(point: pnt0))
                    slaveMileStone0 = PathMileStone(index: slPt0.index, offset: 0)
                } else {
                    pnt0 = msPt0.point
                    msIx0 = msPt0.index != 0 ? msPt0.index - 1 : msCount - 1
                    slIx0 = aSlPt1.index
                    masterMileStone0 = PathMileStone(index: msPt0.index, offset: 0)
                    slaveMileStone0 = PathMileStone(index: slPt0.index, offset: slPt0.point.sqrDistance(point: pnt0))
                }
            } else {
                pnt0 = msPt0.point
                msIx0 = msPt0.index != 0 ? msPt0.index - 1 : msCount - 1
                slIx0 = PinPath.nextSlave(sl0: aSlPt1.index, sl1: aSlPt0.index, slCount: slCount)
                masterMileStone0 = PathMileStone(index: msPt0.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: slPt0.index, offset: 0)
            }
            
            // left-bottom point ms = 1
            if msPt1.point != aSlPt0.point {
                if msPt1 > aSlPt0 {
                    pnt1 = msPt1.point
                    msIx1 = msPt1.index + 1 < msCount ? msPt1.index + 1 : 0
                    slIx1 = aSlPt0.index
                    masterMileStone1 = PathMileStone(index: msPt1.index, offset: 0)
                    slaveMileStone1 = PathMileStone(index: slPt0.index, offset: slPt0.point.sqrDistance(point: pnt1))
                } else {
                    pnt1 = aSlPt0.point
                    msIx1 = msPt1.index
                    slIx1 = PinPath.nextSlave(sl0: aSlPt0.index, sl1: aSlPt1.index, slCount: slCount)
                    masterMileStone1 = PathMileStone(index: msPt0.index, offset: msPt0.point.sqrDistance(point: pnt1))
                    slaveMileStone1 = PathMileStone(index: slPt1.index, offset: 0)
                }
            } else {
                pnt1 = msPt1.point
                msIx1 = msPt1.index + 1 < msCount ? msPt1.index + 1 : 0
                slIx1 = PinPath.nextSlave(sl0: aSlPt0.index, sl1: aSlPt1.index, slCount: slCount)
                masterMileStone1 = PathMileStone(index: msPt1.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: slPt1.index, offset: 0)
            }
        } else {
            // right-top point ms = 1
            if msPt1.point != aSlPt1.point {
                if msPt1 > aSlPt1 {
                    pnt1 = aSlPt1.point
                    msIx1 = msPt1.index
                    slIx1 = (aSlPt1.index - 1 + slCount) % slCount
                    masterMileStone1 = PathMileStone(index: msPt0.index, offset: msPt0.point.sqrDistance(point: pnt1))
                    slaveMileStone1 = PathMileStone(index: aSlPt1.index, offset: 0)
                } else {
                    pnt1 = msPt1.point
                    msIx1 = msPt1.index + 1 < msCount ? msPt1.index + 1 : 0
                    slIx1 = aSlPt1.index
                    masterMileStone1 = PathMileStone(index: msPt1.index, offset: 0)
                    slaveMileStone1 = PathMileStone(index: slPt0.index, offset: slPt0.point.sqrDistance(point: pnt1))
                }
            } else {
                pnt1 = msPt1.point
                msIx1 = msPt1.index + 1 < msCount ? msPt1.index + 1 : 0
                slIx1 = PinPath.nextSlave(sl0: aSlPt1.index, sl1: aSlPt0.index, slCount: slCount)
                masterMileStone1 = PathMileStone(index: msPt1.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: slPt1.index, offset: 0)
            }
            
            // left-bottom point ms = 0
            if msPt0.point != aSlPt0.point {
                if msPt0 > aSlPt0 {
                    pnt0 = msPt0.point
                    msIx0 = msPt0.index != 0 ? msPt0.index - 1 : msCount - 1
                    slIx0 = aSlPt0.index
                    masterMileStone0 = PathMileStone(index: msPt0.index, offset: 0)
                    slaveMileStone0 = PathMileStone(index: slPt0.index, offset: slPt0.point.sqrDistance(point: pnt0))
                } else {
                    pnt0 = aSlPt0.point
                    msIx0 = msPt0.index
                    slIx0 = (aSlPt0.index + 1) % slCount //PinPath.nextSlave(sl0: minSlPt.index, sl1: maxSlPt.index, slCount: slCount)
                    masterMileStone0 = PathMileStone(index: msPt0.index, offset: msPt0.point.sqrDistance(point: pnt0))
                    slaveMileStone0 = PathMileStone(index: slPt0.index, offset: 0)
                }
            } else {
                pnt0 = msPt0.point
                msIx0 = msPt0.index != 0 ? msPt0.index - 1 : msCount - 1
                slIx0 = PinPath.nextSlave(sl0: aSlPt0.index, sl1: aSlPt1.index, slCount: slCount)
                masterMileStone0 = PathMileStone(index: msPt0.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: slPt0.index, offset: 0)
            }
        }
        */
        let v0 = PinPathVertex(pt: pnt0, ms: adjMsIx1, sl: adjSlIx0, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        let v1 = PinPathVertex(pt: pnt1, ms: adjMsIx0, sl: adjSlIx1, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)

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


