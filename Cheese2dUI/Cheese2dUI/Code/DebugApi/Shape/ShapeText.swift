//
//  ShapeText.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class ShapeText: CALayer {
    
    init(text: String, font: NSFont, position: CGPoint, pin: CGPoint, lineWidth: CGFloat, color: CGColor, strokeColor: CGColor) {
        super.init()
        
        let a = font.pointSize
        let rect = CGRect(x: position.x - 0.5 * a, y: position.y - 0.5 * a, width: a, height: a)

        let textLayer = CATextLayer()
        textLayer.font = font
        textLayer.fontSize = a
        textLayer.foregroundColor = color
        textLayer.string = text
        textLayer.frame = rect
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.transform = CATransform3DMakeScale(0.05, 0.05, 1.0)
        
        self.addSublayer(ShapeLine(start: position, end: pin, lineWidth: lineWidth, strokeColor: strokeColor, dash: nil))
        self.addSublayer(ShapeDot(position: position, radius: 0.035 * a, color: Colors.white))
        self.addSublayer(textLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
