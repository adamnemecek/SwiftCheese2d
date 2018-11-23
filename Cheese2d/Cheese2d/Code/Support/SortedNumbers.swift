//
//  SortedNumbers.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 20/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct SortedNumbers {
    
    private(set) var numbers: [Int]
    
    init(size: Int = 0) {
        self.numbers = [Int]()
        if size > 0 {
            self.numbers.reserveCapacity(size)
        }
    }
    
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    mutating func add(number: Int) {
        if numbers.first ?? Int.min > number {
            assertionFailure("the list must be ordered")
        }
        numbers.append(number)
    }
    
    
    func getRange(number: Int) -> Range {
        var n = numbers.count
        
        guard n > 0 else {
            return Range(begin: -1, end: -1)
        }
        
        var start = 0
        var end = n - 1
        var beginIndex: Int = -1
        while n >= 0 {
            let i = start + n / 2
            let value = numbers[i]
            if value > number {
                end = i - 1
            } else if value < number {
                start = i + 1
            } else {
                beginIndex = i
                break
            }
            n = end - start
        }
        
        guard beginIndex >= 0 else {
            return Range(begin: -1, end: -1)
        }

        var endIndex = beginIndex
        
        while beginIndex >= 0 && numbers[beginIndex] == number {
            beginIndex -= 1
        }
        
        beginIndex += 1
        
        n = numbers.count
        
        while endIndex < n && numbers[endIndex] == number {
            endIndex += 1
        }
        endIndex -= 1
        
        return Range(begin: beginIndex, end: endIndex)
    }
    
}


extension SortedNumbers: CustomStringConvertible {
    
    public var description: String {
        return "\(numbers)"
    }
    
}
