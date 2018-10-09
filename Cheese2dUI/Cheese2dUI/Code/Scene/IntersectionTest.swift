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
        
        self.addSublayer(ShapePolygon(points: masterPolygon, tip: 1.0, lineWidth: 0.2, color: Colors.darkGreen, showIndeces: true, scaleIndeces: 1, dash: nil))
        
        var slavePolygon = [CGPoint]()

        slavePolygon.append(CGPoint(x: 10, y: 10))
        slavePolygon.append(CGPoint(x: 0, y: 10))
        slavePolygon.append(CGPoint(x: 10, y: -15))

        self.addSublayer(ShapePolygon(points: slavePolygon, tip: 1.0, lineWidth: 0.2, color: Colors.orange, showIndeces: true, scaleIndeces: 1, dash: nil))
        
        
        let result = Intersector.findPinPath(master: masterPolygon, slave: slavePolygon)
        let points = result.points
        
        for pin in points {
            self.addSublayer(ShapeDot(position: pin.point, radius: 0.75, color: Colors.red))
        }
        
        let paths = result.path
        for path in paths {
            let shape = ShapePath(points: path, tip: 0.7, lineWidth: 0.3, color: Colors.darkBlue, showIndeces: false, showLast: false, scaleIndeces: 1, dash: nil)
            self.addSublayer(shape)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
