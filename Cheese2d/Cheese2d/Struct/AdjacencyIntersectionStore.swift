//
//  AdjacencyIntersectionStore.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 19/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct Adjacency: Equatable {
    
    fileprivate let master: Int
    fileprivate let slave: Int
    
    static func == (lhs: Adjacency, rhs: Adjacency) -> Bool {
        return lhs.master == rhs.master && lhs.slave == rhs.slave
    }
}


struct AdjacencyIntersectionStore {

    private var data = [Adjacency]()
    
    func isContains(master: Int, slave: Int) -> Bool {
        return data.contains(Adjacency(master: master, slave: slave))
    }
    
    mutating func add(master: Int, slave: Int) {
        data.append(Adjacency(master: master, slave: slave))
    }
    
}
