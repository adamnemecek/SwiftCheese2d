//
//  BordMerger.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 05/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct BordMerger {
    
    private var borders: [Border]
    private let masterCount: Int
    
    init(borders: [Border], masterCount: Int) {
        self.borders = borders
        self.masterCount = masterCount
    }
    
    
    mutating func merge() -> [Border] {
        let n = borders.count
        guard n > 0 else {
            return []
        }
        
        self.sort()
        
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
                
                // must be same or next edge
                if v1.pt == next.v0.pt {
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
            
            let path = Border(v0: border.v0, v1: v1, mpOffset: border.mpOffset, isZeroCorner: isZeroCorner, length: length)
            
            paths.append(path)
            
            i = j
        }
        
        if paths.count > 1 {
            let first = paths[0]
            let last = paths[paths.count - 1]
            
            if first.v0.ms == masterCount - 1 && last.v1.ms == 1 {
                paths[0] = Border(v0: last.v0, v1: first.v1, mpOffset: last.mpOffset, isZeroCorner: 1, length: first.length + last.length)
                paths.remove(at: paths.count - 1)
            }
        }

        return paths
    }
    
    
    private static func compare(b0: Border, b1: Border) -> Bool {
        if b0.v0.ed != b1.v1.ed {
            return b0.v0.ed > b1.v1.ed
        } else {
            return b0.mpOffset > b1.mpOffset
        }
    }
    
    
    mutating func sort() {
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
                if BordMerger.compare(b0: a, b1: b) {
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

}
