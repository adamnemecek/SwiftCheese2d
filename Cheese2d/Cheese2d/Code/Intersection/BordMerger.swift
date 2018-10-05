//
//  BordMerger.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 05/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct BordMerger {
    
    private let borders: [Border]
    private let numbers: SortedNumbers
    private let masterCount: Int
    
    init(borders: [Border], masterCount: Int) {
        self.borders = borders
        self.masterCount = masterCount
        var numbers = SortedNumbers(size: borders.count)
        for border in borders {
            numbers.add(number: border.v0.ed)
        }
        self.numbers = numbers
    }
    
    
    func merge() -> [Border] {
        let n = borders.count
        guard n > 0 else {
            return []
        }
        
        var paths = [Border]()
        paths.reserveCapacity(n)
        
        var connected = Array<Int>(repeating: 0, count: n)
        
        let lastMasterIndex = masterCount - 1

        
        var i = 0
        while i < n {
            if connected[i] == 1 {
                i += 1
                continue
            }
            
            let border = borders[i]
            var v1 = border.v1
            var length = 1
            
            var hasConnection = false
            
            repeat {
                let conIx = self.findConnection(v1: v1)
                if conIx >= 0 {
                    let next = borders[conIx]
                    connected[conIx] = 1
                    hasConnection = true
                    length += 1
                    v1 = next.v1
                }
            } while hasConnection
            
            i += 1
        }
        
        // find borders with v1.ed == lastMasterIndex and v1.masterIndex == 1 and v0.ed == 0 and v0.masterIndex == lastMasterIndex
        
        i = 0
        var endBorderIndex: Int = -1
        var startBorderIndex: Int = -1
        let m = paths.count
        while i < m {
            let border = paths[i]
            if endBorderIndex == -1 && border.v1.ed == lastMasterIndex && border.v1.ms == 1 {
                endBorderIndex = i
            }
            if startBorderIndex == -1 && border.v0.ed == 0 && border.v0.ms == lastMasterIndex {
                startBorderIndex = i
            }
        }

        if endBorderIndex != -1 && startBorderIndex != -1 {
            let endBorder = borders[endBorderIndex]
            let startBorder = borders[startBorderIndex]
            
            paths[startBorderIndex] = Border(v0: endBorder.v0, v1: startBorder.v1, mpOffset: startBorder.mpOffset, isZeroCorner: 1, length: startBorder.length + endBorder.length)
        }
        
        
        return paths
    }
    
    private func findConnection(v1: BorderVertex) -> Int {
        
        let range = numbers.getRange(number: v1.ed)
        
        if !range.isEmpty {
            for j in range.begin...range.end {
                let next = borders[j]
                let v0 = next.v0
                if v1.pt == v0.pt {
                    return j
                }
            }
        } else {
            let nextRange = numbers.getRange(number: v1.ed + 1)
            if !nextRange.isEmpty {
                for j in nextRange.begin...nextRange.end {
                    let next = borders[j]
                    let v0 = next.v0
                    if v1.pt == v0.pt {
                        return j
                    }
                }
            }
        }
        
        return -1
    }

}
