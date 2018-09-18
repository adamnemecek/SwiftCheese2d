//
//  IntersectionTest.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class IntersectionTest: CoordinateSystemScene {
    
    override init() {
        super.init()

        var points = [CGPoint]()
        
        points.append(CGPoint(x: 5, y: 5))
        points.append(CGPoint(x: 10, y: 5))
        points.append(CGPoint(x: 10, y: 10))
        points.append(CGPoint(x: 5, y: 10))
        
        self.addSublayer(PolygonShape(points: points, tip: 1.0, lineWidth: 0.1, strokeColor: Colors.red))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
