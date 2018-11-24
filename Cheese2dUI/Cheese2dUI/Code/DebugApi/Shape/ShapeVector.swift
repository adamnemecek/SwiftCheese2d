//
//  ShapeVector.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa

class ShapeVector: CALayer {

    init(start: CGPoint, end: CGPoint, tip: CGFloat, lineWidth: CGFloat, strokeColor: CGColor, arrowColor: CGColor, dash: [NSNumber]?) {
        super.init()
        
        let line = ShapeLine(start: start, end: end, lineWidth: lineWidth, strokeColor: strokeColor, dash: dash)
        line.lineCap = .round
        self.addSublayer(line)
        
        let angle = atan2(end.y - start.y, end.x - start.x)
        let angleLeft = angle + CGFloat.pi * 9 / 10
        let angleRight = angle - CGFloat.pi * 9 / 10
        
        let leftPoint = end + CGPoint(radius: tip, angle: angleLeft)
        let rightPoint = end + CGPoint(radius: tip, angle: angleRight)
        
        let leftLine = ShapeLine(start: leftPoint, end: end, lineWidth: lineWidth, strokeColor: arrowColor, dash: nil)
        leftLine.lineCap = .round
        self.addSublayer(leftLine)
        
        let rightLine = ShapeLine(start: rightPoint, end: end, lineWidth: lineWidth, strokeColor: arrowColor, dash: nil)
        rightLine.lineCap = .round
        self.addSublayer(rightLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
