//
//  ShapeDot.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class ShapeDot: CAShapeLayer {
    
    init(position: CGPoint, radius: CGFloat, color: CGColor) {
        super.init()

        let linePath = CGMutablePath()
        linePath.addEllipse(in: CGRect(x: position.x - 0.5 * radius, y: position.y - 0.5 * radius, width: radius, height: radius))
        
        self.path = linePath
        self.fillColor = color
        self.opacity = 1.0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
