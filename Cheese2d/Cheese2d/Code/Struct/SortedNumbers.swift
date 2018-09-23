//
//  SortedNumbers.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 20/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct SortedNumbers {
    
    public struct Range {
        let begin: Int
        let end: Int
        var isEmpty: Bool {
            return begin == -1
        }
    }
    
    private(set) var numbers: [Int]

    private(set) var count: Int
    
    
    init(size: Int = 0) {
        self.numbers = Array<Int>.init(repeating: 0, count: size)
        self.count = 0
    }
    
    
    init(numbers: [Int]) {
        self.numbers = numbers
        self.count = numbers.count
    }
    
    mutating func add(number: Int) {
        if count > 0 && numbers[count - 1] > number {
            assertionFailure("the list must be ordered")
        }
        if count < numbers.count {
            numbers[count] = number
        } else {
            numbers.append(number)
        }
        
        count += 1
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
