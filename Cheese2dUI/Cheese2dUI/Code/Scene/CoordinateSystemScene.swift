//
//  CoordinateSystemScene.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d

class CoordinateSystemScene: CALayer {
    
    override init() {
        super.init()

        self.addSublayer(ShapeCoordinatSystem(position: .zero, length: 5.0, tip: 1.0, lineWidth: 0.05, strokeColor: Colors.darkGray))

        let a: CGFloat = 100
        for i in -100...100 {
            let c = CGFloat(i)
            let color: CGColor
            if i % 10 == 0 {
                color = Colors.darkBlue
            } else if i % 5 == 0 {
                color = Colors.lightBlue
            } else {
                color = Colors.veryLightBlue
            }
            self.addSublayer(ShapeLine(start: CGPoint(x: -a, y: c), end: CGPoint(x: a, y: c), lineWidth: 0.025, strokeColor: color))
            self.addSublayer(ShapeLine(start: CGPoint(x: c, y: -a), end: CGPoint(x: c, y: a), lineWidth: 0.025, strokeColor: color))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
