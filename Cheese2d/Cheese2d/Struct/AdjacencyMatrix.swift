//
//  AdjacencyMatrix.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 19/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct AdjacencyMatrix {

    private struct Adjacency: CustomDebugStringConvertible {
        
        let master: Int
        
        let slave: Int
        
        public var debugDescription: String {
            return "(\(master), \(slave))"
        }
    }

    public init() {

    }
    
    private var data = [Adjacency]()

    public func isMate(master: Int, slave: Int) -> Bool {

        return false
    }
    
    
    public func getRange(master: Int) -> (start: Int, end: Int)? {
        let start = getRangeBeginning(master: master)
        
        guard start >= 0 else {
            return nil
        }
        
        let n = data.count
        var end = start + 1
        
        while end < n && data[end].master == master {
            end += 1
        }
        
        return (start: start, end: end - 1)
    }

    
    public mutating func addMate(master: Int, slave: Int) {
        data.append(Adjacency(master: master, slave: slave))
    }
    

    private func getRangeBeginning(master: Int) -> Int {
        var n = data.count

        guard n > 0 else {
            return -1
        }
        
        var startIndex = 0
        var endIndex = n - 1
        var index: Int = -1
        while n >= 0 {
            let i = startIndex + n / 2
            let value = data[i].master
            if value > master {
                endIndex = i - 1
            } else if value < master {
                startIndex = i + 1
            } else {
                index = i
                break
            }
            n = endIndex - startIndex
        }

        guard index > 0 else {
            return index
        }

        while index >= 0 && data[index].master == master {
            index -= 1
        }

        return index + 1
    }
    
    
}


extension AdjacencyMatrix {

    public func printSelf() {
        var i = 0
        for d in data {
            let s = "\(i) : [\(d.master), \(d.slave)] "
            print(s)
            i += 1
        }
    }
}
