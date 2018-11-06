//
//  Solver.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 06/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Solver {
    
    private let master: [Point]
    private let slave: [Point]
    private let converter: PointConverter
    
    
    public init(master: [CGPoint], slave: [CGPoint], precision: CGFloat = 0.0001) {
        let converter = PointConverter(precision: precision)
        self.master = converter.convert(points: master)
        self.slave = converter.convert(points: slave)
        self.converter = converter
    }
    
    
    public init(master: [Point], slave: [Point], precision: CGFloat = 0.0001) {
        self.master = master
        self.slave = slave
        self.converter = PointConverter(precision: precision)
    }
    
    
    public func substract() -> [Point] {
        let navigator = Intersector.findPins(iMaster: master, iSlave: slave)
        
        return []
    }
    
}
