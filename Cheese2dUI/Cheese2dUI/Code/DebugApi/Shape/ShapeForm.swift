//
//  ShapeForm.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 14/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class ShapeForm: CAShapeLayer {
    
    init(points: [CGPoint], color: CGColor) {
        super.init()
        let lastIndex = points.count - 1
        guard lastIndex > 0 else {
            return
        }
        
        let linePath = CGMutablePath()
        linePath.move(to: points[0])
        for i in 1...lastIndex {
            linePath.addLine(to: points[i])
        }
        linePath.addLine(to: points[0])
        
        self.path = linePath
        self.fillColor = color
        self.opacity = 1.0
        self.strokeColor = nil
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
}
