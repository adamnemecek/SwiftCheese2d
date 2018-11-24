//
//  PinEdge.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 27/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PinEdge {

    let v0: PinPoint
    let v1: PinPoint
    let interposition: Int  // if slave and master same direction 1, other -1
    
    var isZeroLength: Bool {
        return v0.point == v1.point
    }
    
    init(v0: PinPoint, v1: PinPoint, interposition: Int) {
        self.v0 = v0
        self.v1 = v1
        self.interposition = interposition
    }
    
    /*
    init(msPt0: IndexPoint, msPt1: IndexPoint, slPt0: IndexPoint, slPt1: IndexPoint) {
        
        let minMsPt: IndexPoint
        let maxMsPt: IndexPoint
        
        let isDirectMaster = msPt0 < msPt1
        
        if isDirectMaster {
            minMsPt = msPt0
            maxMsPt = msPt1
        } else {
            minMsPt = msPt1
            maxMsPt = msPt0
        }
        
        let minSlPt: IndexPoint
        let maxSlPt: IndexPoint
        
        let isDirectSlave = slPt0 < slPt1
        
        if isDirectSlave {
            minSlPt = slPt0
            maxSlPt = slPt1
        } else {
            minSlPt = slPt1
            maxSlPt = slPt0
        }
        
        var pnt0: Point = .zero
        var pnt1: Point = .zero
        
        var masterMileStone0: PathMileStone = .zero
        var masterMileStone1: PathMileStone = .zero
        var slaveMileStone0: PathMileStone = .zero
        var slaveMileStone1: PathMileStone = .zero
        
        
        if minMsPt.point != minSlPt.point {
            
            if minMsPt > minSlPt {
                
                let crossPoint = minMsPt.point
                
                let msStone = PathMileStone(index: minMsPt.index, offset: 0)
                
                if isDirectMaster {
                    pnt0 = crossPoint
                    masterMileStone0 = msStone
                    if isDirectSlave {
                        slaveMileStone0 = minSlPt.scrDistance(stone: crossPoint)
                    } else {
                        slaveMileStone0 = maxSlPt.scrDistance(stone: crossPoint)
                    }
                } else {
                    pnt1 = crossPoint
                    masterMileStone1 = msStone
                }
            } else {
                
                let crossPoint = minSlPt.point
                let slStone = PathMileStone(index: minSlPt.index, offset: 0)
                
                if isDirectMaster {
                    pnt0 = crossPoint
                    masterMileStone0 = minMsPt.scrDistance(stone: crossPoint)
                    slaveMileStone0 = slStone
                } else {
                    pnt1 = crossPoint
                    masterMileStone1 = maxMsPt.scrDistance(stone: crossPoint)
                    slaveMileStone1 = slStone
                }
            }
        } else {
            
            if isDirectMaster {
                pnt0 = minMsPt.point
                masterMileStone0 = PathMileStone(index: minMsPt.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: 0)
            } else {
                pnt1 = minSlPt.point
                masterMileStone1 = PathMileStone(index: minMsPt.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: minSlPt.index, offset: 0)
            }
        }
        
        
        if maxMsPt.point != maxSlPt.point {
            
            if maxMsPt < maxSlPt {
                
                let crossPoint = maxMsPt.point
                
                let msStone = PathMileStone(index: maxMsPt.index, offset: 0)
                
                if isDirectMaster {
                    pnt1 = crossPoint
                    masterMileStone1 = msStone
                    slaveMileStone1 = minSlPt.scrDistance(stone: crossPoint)
                } else {
                    pnt0 = crossPoint
                    masterMileStone0 = msStone
                    slaveMileStone0 = maxSlPt.scrDistance(stone: crossPoint)
                }
                
            } else {
                
                let crossPoint = maxSlPt.point
                let slStone = PathMileStone(index: maxSlPt.index, offset: 0)
                
                if isDirectMaster {
                    pnt1 = crossPoint
                    masterMileStone1 = minMsPt.scrDistance(stone: crossPoint)
                    slaveMileStone1 = slStone
                } else {
                    pnt0 = crossPoint
                    masterMileStone0 = maxMsPt.scrDistance(stone: crossPoint)
                    slaveMileStone0 = slStone
                }
            }
        } else {
            
            if isDirectMaster {
                pnt1 = maxMsPt.point
                masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: 0)
                slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: 0)
            } else {
                pnt0 = maxMsPt.point
                masterMileStone0 = PathMileStone(index: maxMsPt.index, offset: 0)
                slaveMileStone0 = PathMileStone(index: maxSlPt.index, offset: 0)
            }
        }
        
        self.v0 = PinPoint(point: pnt0, type: 0, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        self.v1 = PinPoint(point: pnt1, type: 0, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)
        self.interposition = isDirectMaster == isDirectSlave ? 1 : -1
    }
    */
    
    init(msPt0: IndexPoint, msPt1: IndexPoint, slPt0: IndexPoint, slPt1: IndexPoint) {
        let minMsPt: IndexPoint
        let maxMsPt: IndexPoint
        
        let isDirectMaster = msPt0 < msPt1
        
        if isDirectMaster {
            minMsPt = msPt0
            maxMsPt = msPt1
        } else {
            minMsPt = msPt1
            maxMsPt = msPt0
        }
        
        let minSlPt: IndexPoint
        let maxSlPt: IndexPoint
        
        let isDirectSlave = slPt0 < slPt1
        
        if isDirectSlave {
            minSlPt = slPt0
            maxSlPt = slPt1
        } else {
            minSlPt = slPt1
            maxSlPt = slPt0
        }
        
        // left end, case 1, 2
        
        let minMsStone: PathMileStone
        let minSlStone: PathMileStone
        let minCross: Point
        
        if minMsPt < minSlPt { // a < b
            minCross = minSlPt.point
            minMsStone = msPt0.scrDistance(stone: minCross)
            minSlStone = PathMileStone(index: minSlPt.index)
        } else if minMsPt != minSlPt { // a > b
            minCross = minMsPt.point
            minMsStone = PathMileStone(index: minMsPt.index)
            minSlStone = slPt0.scrDistance(stone: minCross)
        } else { // a == b
            minCross = minMsPt.point
            minMsStone = PathMileStone(index: minMsPt.index)
            minSlStone = PathMileStone(index: minSlPt.index)
        }
        
        
        // right end, case 1, 2
        
        let maxMsStone: PathMileStone
        let maxSlStone: PathMileStone
        let maxCross: Point
        
        if maxMsPt < maxSlPt { // a < b
            maxCross = maxMsPt.point
            maxMsStone = PathMileStone(index: maxMsPt.index)
            maxSlStone = slPt0.scrDistance(stone: maxCross)
        } else if maxMsPt != maxSlPt { // a > b
            maxCross = maxSlPt.point
            maxMsStone = msPt0.scrDistance(stone: maxCross)
            maxSlStone = PathMileStone(index: maxSlPt.index)
        } else { // a == b
            maxCross = maxMsPt.point
            maxMsStone = PathMileStone(index: maxMsPt.index)
            maxSlStone = PathMileStone(index: maxSlPt.index)
        }
        
        
        let pnt0: Point
        let pnt1: Point
        
        let masterMileStone0: PathMileStone
        let masterMileStone1: PathMileStone
        
        let slaveMileStone0: PathMileStone
        let slaveMileStone1: PathMileStone
        
        if isDirectMaster {
            pnt0 = minCross
            masterMileStone0 = minMsStone
            slaveMileStone0 = minSlStone
            
            pnt1 = maxCross
            masterMileStone1 = maxMsStone
            slaveMileStone1 = maxSlStone
        } else {
            pnt0 = maxCross
            masterMileStone0 = maxMsStone
            slaveMileStone0 = maxSlStone
            
            pnt1 = minCross
            masterMileStone1 = minMsStone
            slaveMileStone1 = minSlStone
        }
        
        self.v0 = PinPoint(point: pnt0, type: 0, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        self.v1 = PinPoint(point: pnt1, type: 0, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)
        self.interposition = isDirectMaster == isDirectSlave ? 1 : -1
    }
}

