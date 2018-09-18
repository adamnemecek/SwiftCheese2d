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
        
        points.append(CGPoint(x: 50, y: 50))
        points.append(CGPoint(x: 100, y: 50))
        points.append(CGPoint(x: 100, y: 100))
        points.append(CGPoint(x: 50, y: 100))
        
        self.addSublayer(PolygonShape(points: points, tip: 10.0, lineWidth: 1, strokeColor: Colors.red))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
