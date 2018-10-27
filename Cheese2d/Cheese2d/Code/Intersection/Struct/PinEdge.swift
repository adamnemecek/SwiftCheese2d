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
    
    var isZeroLength: Bool {
        return v0.point == v1.point
    }
    
    init(msPt0: IndexPoint, msPt1: IndexPoint, slPt0: IndexPoint, slPt1: IndexPoint, msCount: Int, slCount: Int) {
        
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
                } else {
                    pnt1 = crossPoint
                    masterMileStone1 = msStone
                }
                
                
                if isDirectSlave {
                    slaveMileStone0 = minSlPt.scrDistance(stone: crossPoint)
                } else {
                    slaveMileStone1 = maxSlPt.scrDistance(stone: crossPoint)
                }
                
            } else {
                
                let crossPoint = minSlPt.point
                
                if isDirectMaster {
                    pnt0 = crossPoint
                    masterMileStone0 = minMsPt.scrDistance(stone: crossPoint)
                } else {
                    pnt1 = crossPoint
                    masterMileStone1 = maxMsPt.scrDistance(stone: crossPoint)
                }
                
                
                let slStone = PathMileStone(index: minSlPt.index, offset: 0)
                
                if isDirectSlave {
                    slaveMileStone0 = slStone
                } else {
                    slaveMileStone1 = slStone
                }
            }
        } else {
            
            if isDirectMaster {
                pnt0 = minMsPt.point
                masterMileStone0 = PathMileStone(index: minMsPt.index, offset: 0)
            } else {
                pnt1 = minSlPt.point
                masterMileStone1 = PathMileStone(index: minMsPt.index, offset: 0)
            }
            
            
            if isDirectSlave {
                slaveMileStone0 = PathMileStone(index: minSlPt.index, offset: 0)
            } else {
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
                } else {
                    pnt0 = crossPoint
                    masterMileStone0 = msStone
                }
                
                if isDirectSlave {
                    slaveMileStone1 = minSlPt.scrDistance(stone: crossPoint)
                } else {
                    slaveMileStone0 = maxSlPt.scrDistance(stone: crossPoint)
                }
                
            } else {
                
                let crossPoint = maxSlPt.point
                
                if isDirectMaster {
                    pnt1 = crossPoint
                    masterMileStone1 = minMsPt.scrDistance(stone: crossPoint)
                } else {
                    pnt0 = crossPoint
                    masterMileStone0 = maxMsPt.scrDistance(stone: crossPoint)
                }
                
                
                let slStone = PathMileStone(index: maxSlPt.index, offset: 0)
                
                if isDirectSlave {
                    slaveMileStone1 = slStone
                } else {
                    slaveMileStone0 = slStone
                }
            }
        } else {
            
            if isDirectMaster {
                pnt1 = maxMsPt.point
                masterMileStone1 = PathMileStone(index: maxMsPt.index, offset: 0)
            } else {
                pnt0 = maxMsPt.point
                masterMileStone0 = PathMileStone(index: maxMsPt.index, offset: 0)
            }
            
            
            if isDirectSlave {
                slaveMileStone1 = PathMileStone(index: maxSlPt.index, offset: 0)
            } else {
                slaveMileStone0 = PathMileStone(index: maxSlPt.index, offset: 0)
            }
            
        }
        
        self.v0 = PinPoint(point: pnt0, type: 0, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        self.v1 = PinPoint(point: pnt1, type: 0, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)
    }
}

