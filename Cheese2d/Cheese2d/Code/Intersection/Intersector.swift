//
//  Intersector.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

public class Intersector {
 

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
    
    
    
    static func findPinPath(iMaster: [Point], iSlave: [Point]) -> (points: [CGPoint], path: [Border]) {
        
        let posMatrix = self.buildPossibilityMatrix(master: iMaster, slave: iSlave)

        let masterIndices = posMatrix.masterIndices.numbers
        let slaveIndices = posMatrix.adjacencies
        
        var crossMap = AdjacencyMap<Point>()
        var extremes = AdjacencyMap<Int>()
        var borders = [Border]()
        
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
                        crossMap.addMate(master: msIx0, slave: slIx0, value: point)
                    } else {
                        var extremeMsIx = -1
                        var extremeSlIx = -1
                        if ms0 == point {
                            extremeMsIx = msIx0
                        } else if ms1 == point {
                            extremeMsIx = msIx1
                        }
                        
                        if sl0 == point {
                            extremeSlIx = slIx0
                        } else if sl1 == point {
                            extremeSlIx = slIx1
                        }

                        if extremeMsIx >= 0 && extremeSlIx >= 0 {
                            extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 0)
                        } else if extremeMsIx >= 0 {
                            extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 1)
                        } else if extremeSlIx >= 0 {
                        //    extremes.addMate(master: extremeMsIx, slave: extremeSlIx, value: 2)
                        }
                    }
                } else {
                    let ms0Pt = BPoint(index: msIx0, point: ms0)
                    let ms1Pt = BPoint(index: msIx1, point: ms1)
                    let sl0Pt = BPoint(index: slIx0, point: sl0)
                    let sl1Pt = BPoint(index: slIx1, point: sl1)
                    
                    let border = Intersector.buildBorder(ms0Pt: ms0Pt, ms1Pt: ms1Pt, sl0Pt: sl0Pt, sl1Pt: sl1Pt, msCount: iMaster.count, slCount: iSlave.count)
                    borders.append(border)
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i = j
        }

        borders = Intersector.merge(borders: borders, masterCount: iMaster.count)
        
        let result = (points: DataNormalizer.convert(iPoints: crossMap.values), path: borders)

        return result
    }
    
    
    
    private static func merge(borders: [Border], masterCount: Int) -> [Border] {
        let n = borders.count
        guard n > 0 else {
            return []
        }
        
        var paths = [Border]()
        paths.reserveCapacity(n)

        var i = 0
        while i < n {
            let border = borders[i]
            
            var v1 = border.v1

            var length = 1
            
            var j = i + 1

            while j < n {
                let next = borders[j]
                
                let nextEdge = (v1.ed + 1) % masterCount
                
                // must be same or next edge
                if (v1.ed == next.v0.ed || nextEdge == next.v0.ed) && v1.pt == next.v0.pt {
                    j += 1
                    v1 = next.v1
                    length += 1
                } else {
                    break
                }
            }
            
            var isZeroCorner = 0
            if border.v0.ms + length > masterCount {
                isZeroCorner = 1
            }
        
            let path = Border(v0: border.v0, v1: v1, isZeroCorner: isZeroCorner, length: length)
            
            paths.append(path)
        
            i = j
        }
        
        if paths.count > 1 {
            let first = paths[0]
            let last = paths[paths.count - 1]
            
            if first.v0.ms == masterCount - 1 && last.v1.ms == 1 {
                paths[0] = Border(v0: last.v0, v1: first.v1, isZeroCorner: 1, length: first.length + last.length)
                paths.remove(at: paths.count - 1)
            }
        }

        return paths
    }
    
    
    private static func buildBorder(ms0Pt: BPoint, ms1Pt: BPoint, sl0Pt: BPoint, sl1Pt: BPoint, msCount: Int, slCount: Int) -> Border {
        let minSlPt: BPoint
        let maxSlPt: BPoint

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
        
        return Border(v0: v0, v1: v1, isZeroCorner: 0, length: 1)
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
