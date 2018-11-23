//
//  ShapePinDot.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 09/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa
@testable import Cheese2d

class ShapePinDot: CAShapeLayer {
    
    init(pin: Pin, radius: CGFloat) {
        super.init()
        
        let colors = pin.colors

        let topArc = self.buildArc(point: pin.point, radius: radius, color: colors[0], clockwise: false)
        let bottomArc = self.buildArc(point: pin.point, radius: radius, color: colors[1], clockwise: true)
        
        self.addSublayer(topArc)
        self.addSublayer(bottomArc)
    }
    
    
    private func buildArc(point: CGPoint, radius: CGFloat, color: CGColor, clockwise: Bool) -> CAShapeLayer {
        let arc = CAShapeLayer()
        
        let linePath = CGMutablePath()
        
        linePath.addArc(center: point, radius: radius, startAngle: 0, endAngle: CGFloat.pi, clockwise: clockwise)
        
        arc.path = linePath
        arc.fillColor = color
        arc.opacity = 1.0
        
        return arc
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
