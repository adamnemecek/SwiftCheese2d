//
//  OrdedNumbers.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 20/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct OrdedNumbers {
    
    public struct Range {
        let begin: Int
        let end: Int
    }
    
    private var data: [Int]

    private var prevNumber = Int.min
    
    public init(size: Int) {
        data = [] // for swift pre size is useless
    }
    
    public mutating func add(number: Int) {
        if prevNumber > number {
            assertionFailure("the list must be ordered")
        }
        data.append(number)
    }
    
    
    public func getRange(number: Int) -> Range {
        var n = data.count
        
        guard n > 0 else {
            return Range(begin: -1, end: -1)
        }
        
        var start = 0
        var end = n - 1
        var beginIndex: Int = -1
        while n >= 0 {
            let i = start + n / 2
            let value = data[i]
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
        
        while beginIndex >= 0 && data[beginIndex] == number {
            beginIndex -= 1
        }
        
        beginIndex += 1
        
        if endIndex < n - 1 {
            while endIndex < n && data[endIndex] == number {
                endIndex += 1
            }
        }
        
        return Range(begin: beginIndex, end: endIndex)
    }
    
    
}
