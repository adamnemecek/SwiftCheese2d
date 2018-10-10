//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public struct Intersector {
 

    public static func findPinPath(master: [CGPoint], slave: [CGPoint]) -> IntersectorResult {
        let iMaster = DataNormalizer.convert(points: master)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let result = Intersector.findPinPath(iMaster: iMaster, iSlave: iSlave)
    
        var borders = [[CGPoint]]()
        let n = result.path.count
        borders.reserveCapacity(n)
        
        for path in result.path {
            borders.append(path.extract(points: iMaster))
        }
        
        return IntersectorResult(points: result.points, path: borders)
    }
    
    
    static func findPinPath(iMaster: [Point], iSlave: [Point]) -> (points: [PinPoint], path: [Border]) {
        
        let posMatrix = self.buildPossibilityMatrix(master: iMaster, slave: iSlave)

        let masterIndices = posMatrix.masterIndices.numbers
        let slaveIndices = posMatrix.adjacencies

        var extremes = AdjacencyMap<Int>()
        var pinPoints = [PinPoint]()
        var borders = [Border]()
        
        let masterCount = iMaster.count
        let slaveCount = iSlave.count
        
        let n = masterIndices.count
        var i = 0
        let msLastIx = iMaster.count - 1
        let slLastIx = iSlave.count - 1
        
        while i < n {
            let msIx0 = masterIndices[i]
            let msIx1 = msIx0 < msLastIx ? msIx0 + 1 : 0
            
            let ms0 = iMaster[msIx0]
            let ms1 = iMaster[msIx1]
            
            var j = i
            
            repeat {
                
                let slIx0 = slaveIndices[j]
                let slIx1 = slIx0 < slLastIx ? slIx0 + 1 : 0
                
                let sl0 = iSlave[slIx0]
                let sl1 = iSlave[slIx1]
                
                let intersectionTest = Intersector.disposition(a0: ms0, a1: ms1, b0: sl0, b1: sl1)
                
                j += 1
                if intersectionTest == -1 {
                    continue
                } else if intersectionTest > 0 {
                    let point = Intersector.cross(a0: ms0, a1: ms1, b0: sl0, b1: sl1)
                    if intersectionTest == 1 {
                        //crossMap.addMate(master: msIx0, slave: slIx0, value: point)
                        let pinPoint = PinPoint.buildSimple(pt: point, ms: ms1, sl: sl1)
                        pinPoints.append(pinPoint)
                    } else {
                        print("PinPoint")
                        let isMsEnd = ms0 == point || ms1 == point
                        let isSlEnd = sl0 == point || sl1 == point
                        
                        var prevMs = msIx0
                        var nextMs = msIx1
                        
                        var prevSl = slIx0
                        var nextSl = slIx1
                        
                        if isMsEnd {
                            if ms0 == point {
                                prevMs = (msIx0 - 1 + masterCount) % masterCount
                            } else {
                                nextMs = (msIx1 + 1) % masterCount
                            }
                        }
                        
                        if isSlEnd {
                            if sl0 == point {
                                prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                            } else {
                                nextSl = (slIx1 + 1) % slaveCount
                            }
                        }
                        
                        if isMsEnd && isSlEnd {
                            // pin point is on the vertex
                            let pinPoint = PinPoint.buildOnCross(pt: point, ms0: iMaster[prevMs], ms1: iMaster[nextMs], sl0: iSlave[prevSl], sl1: iSlave[nextSl])
                            pinPoints.append(pinPoint)
                            print("onCommon")
                        } else if isMsEnd {
                            // pin point is on slave
                            let pinPoint = PinPoint.buildOnSlave(pt: point, ms0: iMaster[prevMs], ms1: iMaster[nextMs], sl: iSlave[nextSl])
                            pinPoints.append(pinPoint)
                            print("onSlave")
                        } else if isSlEnd {
                            // pin point is on master
                            let pinPoint = PinPoint.buildOnMaster(pt: point, ms: iMaster[nextMs], sl0: iSlave[prevSl], sl1: iSlave[nextSl])
                            pinPoints.append(pinPoint)
                            print("OnMaster")
                        }
                    }
                } else {
                    let ms0Pt = IndexPoint(index: msIx0, point: ms0)
                    let ms1Pt = IndexPoint(index: msIx1, point: ms1)
                    let sl0Pt = IndexPoint(index: slIx0, point: sl0)
                    let sl1Pt = IndexPoint(index: slIx1, point: sl1)
                    
                    let border = Intersector.buildBorder(ms0Pt: ms0Pt, ms1Pt: ms1Pt, sl0Pt: sl0Pt, sl1Pt: sl1Pt, msCount: masterCount, slCount: slaveCount)
                    borders.append(border)
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i = j
        }
        
        var merger = BordMerger(borders: borders, masterCount: iMaster.count)

        borders = merger.merge()
        
        let result = (points: pinPoints, path: borders)

        return result
    }

    
    private static func buildPossibilityMatrix(master: [Point], slave: [Point]) -> AdjacencyMatrix {

        var slaveBoxArea = BoxArea.empty

        var slaveSegmentsBoxArea: [BoxArea] = []
        
        let lastSlaveIndex = slave.count - 1
        
        for i in 0...lastSlaveIndex {
            let a = slave[i]
            let b = slave[i != lastSlaveIndex ? i + 1 : 0]
            
            slaveBoxArea.assimilate(p: a)
            slaveSegmentsBoxArea.append(BoxArea(a: a, b: b))
        }
        
        var posMatrix = AdjacencyMatrix(size: 0)

        let lastMasterIndex = master.count - 1
        
        for i in 0...lastMasterIndex {
            let master_0 = master[i]
            let master_1 = master[i != lastMasterIndex ? i + 1 : 0]
            
            let isIntersectionImpossible = slaveBoxArea.isNotIntersecting(a: master_0, b: master_1)
            
            if isIntersectionImpossible {
                continue
            }
            
            let segmentBoxArea = BoxArea(a: master_0, b: master_1)
        
            
            for j in 0...lastSlaveIndex {
                let isIntersectionPossible = slaveSegmentsBoxArea[j].isInterscting(box: segmentBoxArea)
                
                if isIntersectionPossible {
                    posMatrix.addMate(master: i, slave: j)
                }
            }
        }
        
        return posMatrix
    }

    
    // -1 not intersecting, 0 same line, 1 - intersecting, 2 - possible end
    private static func disposition(a0: Point, a1: Point, b0: Point, b1: Point) -> Int {
        let d0 = Intersector.isCCW(a: a0, b: b0, c: b1)
        let d1 = Intersector.isCCW(a: a1, b: b0, c: b1)
        let d2 = Intersector.isCCW(a: a0, b: a1, c: b0)
        let d3 = Intersector.isCCW(a: a0, b: a1, c: b1)
    
        if d0 != 0 || d1 != 0 || d2 != 0 || d3 != 0 {
            let t0 = d0 < 0
            let t1 = d1 < 0
            let t2 = d2 < 0
            let t3 = d3 < 0
            
            if (t0 != t1) && (t2 != t3) {
                if d0 != 0 && d1 != 0 && d2 != 0 && d3 != 0 {
                    return 1
                } else {
                    return 2
                }
                
            } else {
                return -1
            }
        } else {
            return 0
        }
    }
    
    
    private static func isCCW(a: Point, b: Point, c: Point) -> Int {
        let m0 = Int64(c.y - a.y) * Int64(b.x - a.x)
        let m1 = Int64(b.y - a.y) * Int64(c.x - a.x)
    
        if m0 < m1 {
            return -1
        } else if m0 > m1 {
            return 1
        } else {
            return 0
        }
    }
    
    
    private static func cross(a0: Point, a1: Point, b0: Point, b1: Point) -> Point {
        let dxA = Int64(a0.x - a1.x)
        let dyB = Int64(b0.y - b1.y)
        let dyA = Int64(a0.y - a1.y)
        let dxB = Int64(b0.x - b1.x)

        let divider = dxA * dyB - dyA * dxB
    
        assert(divider != 0)
        
        let xyA = CGFloat(a0.x * a1.y - a0.y * a1.x)
        let xyB = CGFloat(b0.x * b1.y - b0.y * b1.x)
        
        let  invert_divider: CGFloat = 1.0 / CGFloat(divider)
        
        let x = xyA * CGFloat(b0.x - b1.x) - CGFloat(a0.x - a1.x) * xyB
        let y = xyA * CGFloat(b0.y - b1.y) - CGFloat(a0.y - a1.y) * xyB
        
        return Point(x: Int(x * invert_divider), y: Int(y * invert_divider))
    }
    
}
