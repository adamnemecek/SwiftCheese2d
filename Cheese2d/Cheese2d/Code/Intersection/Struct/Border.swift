//
//  Border.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct BorderVertex {
    let pt: Point
    let ms: Int
    let ed: Int
    let sl: Int
}

struct Border {
    
    let v0: BorderVertex
    let v1: BorderVertex

    let isZeroCorner: Int
    let length: Int
    let mpOffset: Int
    
    init(v0: BorderVertex, v1: BorderVertex, mp0: Point, isZeroCorner: Int, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.isZeroCorner = isZeroCorner
        self.length = length
        let dx = mp0.x - v0.pt.x
        let dy = mp0.y - v0.pt.y
        self.mpOffset = dx * dx + dy * dy
    }
    
    
    init(v0: BorderVertex, v1: BorderVertex, mpOffset: Int, isZeroCorner: Int, length: Int) {
        self.v0 = v0
        self.v1 = v1
        self.isZeroCorner = isZeroCorner
        self.length = length
        self.mpOffset = mpOffset
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
    
    
    private static func compare(v0: BorderVertex, v1: BorderVertex, masterCount: Int) -> Bool {
        if v0.ed != v1.ed {
            return v0.ed > v1.ed
        } else {
            let ms0: Int
            if v0.ed == 0 {
                ms0 = (v0.ms + 1) % masterCount
            } else if v0.ed == masterCount - 1  {
                ms0 = (v0.ms - 1 + masterCount) % masterCount
            } else {
                ms0 = v0.ms
            }
            
            let ms1: Int
            if v1.ed == 0 {
                ms1 = (v1.ms + 1) % masterCount
            } else if v1.ed == masterCount - 1  {
                ms1 = (v1.ms - 1 + masterCount) % masterCount
            } else {
                ms1 = v1.ms
            }

            return ms0 > ms1
        }
    }
    
    
    static func sort(borders: inout [Border], masterCount: Int) {
        // this array is already sorted by edge index
        
        let n = borders.count
        
        var isNotSorted: Bool
        
        var m = n
        
        repeat {
            isNotSorted = false
            var a = borders[0]
            var i = 1
            while i < m {
                let b = borders[i]
                if Border.compare(v0: a.v0, v1: b.v0, masterCount: masterCount) {
                    borders[i - 1] = b
                    isNotSorted = true
                } else {
                    borders[i - 1] = a
                    a = b
                }
                i += 1
            }
            m -= 1
            borders[m] = a
        } while isNotSorted
    }
    
    
    static func getEdgeSortedNumbers(borders: [Border]) -> SortedNumbers {
        var numbers = SortedNumbers(size: borders.count)
        for border in borders {
            numbers.add(number: border.v0.ed)
        }
        
        return numbers
    }
    
    
    
    static func merge(borders: [Border], masterCount: Int) -> [Border] {
        let n = borders.count
        guard n > 0 else {
            return []
        }
        
        var paths = [Border]()
        paths.reserveCapacity(n)
        
        let numbers = Border.getEdgeSortedNumbers(borders: borders)
        
        var connected = Array<Int>(repeating: 0, count: n)
        
        var i = 0
        while i < n {
            if connected[i] == 1 {
                i += 1
                continue
            }
            
            let border = borders[i]
            var v1 = border.v1
            var length = 1
            
            let range = numbers.getRange(number: v1.ed)
            
            if !range.isEmpty {
                for j in range.begin...range.end {
                    let next = borders[j]
                    let v0 = next.v0
                    if v1.pt == v0.pt {
                        connected[j] = 1
                        v1 = next.v1
                        length += 1
                    }
                }
            }
            
            
            i += 1
        }
        
        return paths
    }
    
}


