//
//  BorderTest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 02/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


import Cocoa
import Cheese2d

class BorderTest: CoordinateSystemScene {
    
    override init() {
        super.init()
        
        var masterPolygon = [CGPoint]()
        
        masterPolygon.append(CGPoint(x: -10, y: -10))
        masterPolygon.append(CGPoint(x: 10, y: -10))
        masterPolygon.append(CGPoint(x: 10, y: 10))
        masterPolygon.append(CGPoint(x: -10, y: 10))
        
        self.addSublayer(ShapePolygon(points: masterPolygon, tip: 1.0, lineWidth: 0.2, color: Colors.darkGreen, showIndeces: true, scaleIndeces: 2))
        
        var slavePolygon = [CGPoint]()
        
        
        
        slavePolygon.append(CGPoint(x: 10, y: 10))
        slavePolygon.append(CGPoint(x: -10, y: 10))
        slavePolygon.append(CGPoint(x: -10, y: -10))
        slavePolygon.append(CGPoint(x: 0, y: -10))
        slavePolygon.append(CGPoint(x: 4, y: -5))
        slavePolygon.append(CGPoint(x: 10, y: -10))

        /*
         slavePolygon.append(CGPoint(x: 7, y: -10))
         slavePolygon.append(CGPoint(x: -7, y: -10))
         slavePolygon.append(CGPoint(x: -10, y: -7))
         slavePolygon.append(CGPoint(x: -10, y: 7))
         slavePolygon.append(CGPoint(x: -7, y: 10))
         slavePolygon.append(CGPoint(x: 7, y: 10))
         */
        /*
         slavePolygon.append(CGPoint(x: 0, y: 10))
         slavePolygon.append(CGPoint(x: 12, y: 10))
         slavePolygon.append(CGPoint(x: 12, y: -7))
         */
        
        self.addSublayer(ShapePolygon(points: slavePolygon, tip: 1.0, lineWidth: 0.2, color: Colors.orange, showIndeces: true, scaleIndeces: -2.5))
        
        
        let result = Intersector.findPinPath(master: masterPolygon, slave: slavePolygon)
        let points = result.points
        
        for point in points {
            self.addSublayer(ShapeDot(position: point, radius: 0.75, color: Colors.red))
        }
        
        let paths = result.path
        for path in paths {
            let shape = ShapePath(points: path, tip: 0.7, lineWidth: 0.3, color: Colors.darkBlue, showIndeces: false, showLast: false, scaleIndeces: 1)
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
