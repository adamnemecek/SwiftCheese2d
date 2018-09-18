//
//  ShapeVector.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa

class ShapeVector: CALayer {

    init(start: CGPoint, end: CGPoint, tip: CGFloat, lineWidth: CGFloat, strokeColor: CGColor) {
        super.init()
        
        self.addSublayer(ShapeLine(start: start, end: end, lineWidth: lineWidth, strokeColor: strokeColor))
        
        let angle = atan2(end.y - start.y, end.x - start.x)
        let angleLeft = angle + CGFloat.pi * 5 / 6
        let angleRight = angle - CGFloat.pi * 5 / 6
        
        let leftPoint = end + CGPoint(radius: tip, angle: angleLeft)
        let rightPoint = end + CGPoint(radius: tip, angle: angleRight)
        
        self.addSublayer(ShapeLine(start: leftPoint, end: end, lineWidth: lineWidth, strokeColor: strokeColor))
        self.addSublayer(ShapeLine(start: rightPoint, end: end, lineWidth: lineWidth, strokeColor: strokeColor))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
