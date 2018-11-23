//
//  AdjacencyMatrix.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 19/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct AdjacencyMatrix {

    private(set) var masterIndices: SortedNumbers
    private(set) var adjacencies: [Int]
    
    init(size: Int = 0) {
        self.masterIndices = SortedNumbers(size: size)
        self.adjacencies = [Int]()
        if size > 0 {
            self.adjacencies.reserveCapacity(size)
        }
    }
    
    
    init(masterIndices: SortedNumbers, adjacencies: [Int]) {
        self.masterIndices = masterIndices
        self.adjacencies = adjacencies
    }
    
    
    func isPresent(master: Int, slave: Int) -> Bool {
        let range = masterIndices.getRange(number: master)
        if range.isEmpty {
            return false
        }
        
        for i in range.begin...range.end {
            if adjacencies[i] == slave {
                return true
            }
        }

        return false
    }
    
    
    func getIndex(master: Int, slave: Int) -> Int {
        let range = masterIndices.getRange(number: master)
        if range.isEmpty {
            return -1
        }
        
        for i in range.begin...range.end {
            if adjacencies[i] == slave {
                return i
            }
        }
        
        return -1
    }
    
    
    func isPresent(master: Int, slaveA: Int, slaveB: Int) -> Bool {
        let range = masterIndices.getRange(number: master)
        if range.isEmpty {
            return false
        }
        
        var isA: Bool = false
        var isB: Bool = false
        
        for i in range.begin...range.end {
            if adjacencies[i] == slaveA {
                isA = true
                if isB {
                    return true
                }
            }
            if adjacencies[i] == slaveB {
                isB = true
                if isA {
                    return true
                }
            }
        }
        
        return false
    }
    
    
    mutating func addMate(master: Int, slave: Int) {
        adjacencies.append(slave)
        masterIndices.add(number: master)
    }
    
    
    func reverse() -> AdjacencyMatrix {
        let size = adjacencies.count
        
        guard size > 0 else {
            return AdjacencyMatrix(size: 0)
        }
        
        var maxSlaveIndex = 0
        for i in adjacencies {
            if maxSlaveIndex < i {
                maxSlaveIndex = i
            }
        }
        let slaveSize = maxSlaveIndex + 1
        
        var indexMap = Array<Int>(repeating: 0, count: slaveSize)
        for i in adjacencies {
            indexMap[i] += 1
        }
        let count = Array<Int>(indexMap)
        
        var indexOffset = Array<Int>(repeating: 0, count: slaveSize)
        var aggregateOffset = 0
        
        for i in 0...maxSlaveIndex {
            indexOffset[i] = aggregateOffset
            aggregateOffset += indexMap[i]
        }

        var xAdjacencies = Array<Int>(repeating: 0, count: size)
        var xNumbers = Array<Int>(repeating: 0, count: size)
        
        for i in 0...size - 1 {
            let masterIndex = masterIndices.numbers[i]
            let slaveIndex = adjacencies[i]
            let capacity = indexMap[slaveIndex]
            let offset = indexOffset[slaveIndex] + count[slaveIndex] - capacity
            indexMap[slaveIndex] = capacity - 1
            
            xNumbers[offset] = slaveIndex
            xAdjacencies[offset] = masterIndex
        }
        
        return AdjacencyMatrix(masterIndices: SortedNumbers(numbers: xNumbers), adjacencies: xAdjacencies)
    }
    
}
