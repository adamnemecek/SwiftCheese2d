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
        
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: -10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: -10, y: 10))
        
        var slave = [CGPoint]()
        
        slave.append(CGPoint(x: 10, y: 5))
        slave.append(CGPoint(x: 10, y: 10))
        slave.append(CGPoint(x: -10, y: 10))
        slave.append(CGPoint(x: -10, y: 5))
        
        
        let result = Intersector.findPinPath(master: master, slave: slave)
        let points = result.points
        
        for point in points {
            self.addSublayer(ShapeDot(position: point, radius: 0.75, color: Colors.red))
        }
        
        let paths = result.path
        for path in paths {
            let shape = ShapePath(points: path, tip: 1.5, lineWidth: 0.3, color: Colors.border, showIndeces: false, showLast: false, scaleIndeces: 1, dash: nil)
            self.addSublayer(shape)
        }
        
        self.addSublayer(ShapePolygon(points: master, tip: 1.0, lineWidth: 0.2, color: Colors.slave, showIndeces: true, scaleIndeces: 4, dash: nil))
        self.addSublayer(ShapePolygon(points: slave, tip: 1.0, lineWidth: 0.3, color: Colors.master, showIndeces: true, scaleIndeces: -2.5, dash: [2,3]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
