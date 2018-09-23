//
//  AdjacencyMap.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 22/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct AdjacencyMap<T> {
    
    private var adjacencyMatrix = AdjacencyMatrix()
    private var values = [T]()
    
    func get(master: Int, slave: Int) -> T {
        let index = adjacencyMatrix.getIndex(master: master, slave: slave)
        if index < 0 {
            fatalError("value is not present")
        }
        
        return values[index]
    }
    
    
    mutating func addMate(master: Int, slave: Int, value: T) {
        adjacencyMatrix.addMate(master: master, slave: slave)
        values.append(value)
    }
    
}
