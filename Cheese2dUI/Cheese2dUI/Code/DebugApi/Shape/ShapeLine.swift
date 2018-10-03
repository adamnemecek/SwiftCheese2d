//
//  ShapeLine.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class ShapeLine: CAShapeLayer {
    
    init(start: CGPoint, end: CGPoint, lineWidth: CGFloat, strokeColor: CGColor, dash: [NSNumber]?) {
        super.init()
        
        let linePath = CGMutablePath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        
        self.path = linePath
        self.fillColor = nil
        self.opacity = 1.0
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.lineDashPattern = dash
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
