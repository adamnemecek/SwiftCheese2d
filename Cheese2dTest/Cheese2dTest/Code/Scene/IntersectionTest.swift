//
//  IntersectionTest.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d

class IntersectionTest: CoordinateSystemScene {
    
    override init() {
        super.init()

        var masterPolygon = [CGPoint]()
        
        masterPolygon.append(CGPoint(x: -10, y: -10))
        masterPolygon.append(CGPoint(x: 10, y: -10))
        masterPolygon.append(CGPoint(x: 10, y: 10))
        masterPolygon.append(CGPoint(x: -10, y: 10))
        
        self.addSublayer(ShapePolygon(points: masterPolygon, tip: 1.0, lineWidth: 0.2, color: Colors.darkGreen, showIndeces: true))
        
        var slavePolygon = [CGPoint]()
        
        slavePolygon.append(CGPoint(x: 0, y: 19.95))
        slavePolygon.append(CGPoint(x: 15, y: 19.95))
        slavePolygon.append(CGPoint(x: 15, y: 4.95))
        
        self.addSublayer(ShapePolygon(points: slavePolygon, tip: 1.0, lineWidth: 0.2, color: Colors.orange, showIndeces: true))
        
        let points = Intersector.findPinPath(master: masterPolygon.toVectors(), slave: slavePolygon.toVectors()).toPoints()

        for point in points {
            self.addSublayer(ShapeDot(position: point, radius: 0.75, color: Colors.red))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
