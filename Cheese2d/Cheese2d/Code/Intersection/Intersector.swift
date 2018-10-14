//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Foundation


public struct Intersector {

    public static func findPins(master: [CGPoint], slave: [CGPoint]) -> IntersectorResult {
        let iMaster = DataNormalizer.convert(points: master)
        let iSlave = DataNormalizer.convert(points: slave)
        
        let sequence = Intersector.findPins(iMaster: iMaster, iSlave: iSlave)
    
        var borders = [[CGPoint]]()
        var points = [PinPoint]()

        for pinHandler in sequence.pinHandlerArray {
            if pinHandler.marker == 0 {
                let index = pinHandler.index
                if pinHandler.isPinPath == 1 {
                    let path = sequence.pinPathArray[index]
                    borders.append(path.extract(points: iMaster))
                } else {
                    let pin = sequence.pinPointArray[index]
                    points.append(pin)
                }
            }
            
        }
        
        return IntersectorResult(points: points, path: borders)
    }
    
    
    static func findPins(iMaster: [Point], iSlave: [Point]) -> PinSequence {
        
        let posMatrix = self.buildPossibilityMatrix(master: iMaster, slave: iSlave)

        let masterIndices = posMatrix.masterIndices.numbers
        let slaveIndices = posMatrix.adjacencies

        var pinPoints = [PinPoint]()
        var pinPaths = [PinPath]()
        
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
                        
                        let pinPointDef = PinPointDef(
                            pt: point,
                            ms0: IndexPoint(index: msIx0, point: ms0),
                            ms1: IndexPoint(index: msIx1, point: ms1),
                            sl0: IndexPoint(index: slIx0, point: sl0),
                            sl1: IndexPoint(index: slIx1, point: sl1),
                            sortFactor: PathMileStone(index: msIx0, offset: ms0.sqrDistance(point: point)))
                        
                        let pinPoint = PinPoint.buildSimple(def: pinPointDef)
                        pinPoints.append(pinPoint)
                    } else {
                        print("PinPoint")
                        let isMsEnd = ms0 == point || ms1 == point
                        let isSlEnd = sl0 == point || sl1 == point
                        
                        var prevMs = msIx0
                        var nextMs = msIx1
                        
                        var prevSl = slIx0
                        var nextSl = slIx1
                        
                        var edge = msIx0
                        var offsetFactor: Int64 = 0

                        if isMsEnd {
                            if ms0 == point {
                                print("case A")
                                prevMs = (msIx0 - 1 + masterCount) % masterCount
                            } else {
                                print("case B")
                                nextMs = (msIx1 + 1) % masterCount
                                edge = msIx1
                            }
                        }
                        
                        if isSlEnd {
                            if sl0 == point {
                                print("case C")
                                prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                            } else {
                                nextSl = (slIx1 + 1) % slaveCount
                            }
                            
                            if !isMsEnd {
                                print("case D")
                                offsetFactor = ms0.sqrDistance(point: point)
                            }
                        }

                        let pinPointDef = PinPointDef(
                            pt: point,
                            ms0: IndexPoint(index: prevMs, point: iMaster[prevMs]),
                            ms1: IndexPoint(index: nextMs, point: iMaster[nextMs]),
                            sl0: IndexPoint(index: prevSl, point: iSlave[prevSl]),
                            sl1: IndexPoint(index: nextSl, point: iSlave[nextSl]),
                            sortFactor: PathMileStone(index: edge, offset: offsetFactor))
                        
                        if isMsEnd && isSlEnd {
                            // pin point is on the cross
                            let pinPoint = PinPoint.buildOnCross(def: pinPointDef)
                            pinPoints.append(pinPoint)
                            print("onCommon")
                        } else if isMsEnd {
                            // pin point is on slave
                            let pinPoint = PinPoint.buildOnSlave(def: pinPointDef)
                            pinPoints.append(pinPoint)
                            print("onSlave")
                        } else if isSlEnd {
                            // pin point is on master
                            let pinPoint = PinPoint.buildOnMaster(def: pinPointDef)
                            pinPoints.append(pinPoint)
                            print("OnMaster")
                        }
                    }
                } else {
                    let ms0Pt = IndexPoint(index: msIx0, point: ms0)
                    let ms1Pt = IndexPoint(index: msIx1, point: ms1)
                    let sl0Pt = IndexPoint(index: slIx0, point: sl0)
                    let sl1Pt = IndexPoint(index: slIx1, point: sl1)
                    
                    let pinPath = PinPath.buildPinPath(ms0Pt: ms0Pt, ms1Pt: ms1Pt, sl0Pt: sl0Pt, sl1Pt: sl1Pt, msCount: masterCount, slCount: slaveCount)
                    if !pinPath.isZeroLength {
                        pinPaths.append(pinPath)
                    }
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i = j
        }
        
        var merger = PinPathAggregator(array: pinPaths, masterCount: iMaster.count)

        pinPaths = merger.merge()
        
        var sequence = PinSequence(pinPointArray: pinPoints, pinPathArray: pinPaths, masterCount: iMaster.count)
        
        //print(sequence.pinPointArray)
        
        sequence.prepareData()

        return sequence
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
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
    
        if m0 < m1 {
            return -1
        } else if m0 > m1 {
            return 1
        } else {
            return 0
        }
    }
    
    
    private static func cross(a0: Point, a1: Point, b0: Point, b1: Point) -> Point {
        let dxA = a0.x - a1.x
        let dyB = b0.y - b1.y
        let dyA = a0.y - a1.y
        let dxB = b0.x - b1.x

        let divider = dxA * dyB - dyA * dxB
    
        assert(divider != 0)
        
        let xyA = CGFloat(a0.x * a1.y - a0.y * a1.x)
        let xyB = CGFloat(b0.x * b1.y - b0.y * b1.x)
        
        let invert_divider: CGFloat = 1.0 / CGFloat(divider)
        
        let x = xyA * CGFloat(b0.x - b1.x) - CGFloat(a0.x - a1.x) * xyB
        let y = xyA * CGFloat(b0.y - b1.y) - CGFloat(a0.y - a1.y) * xyB
        
        return Point(x: Int64(x * invert_divider), y: Int64(y * invert_divider))
    }
    
}
