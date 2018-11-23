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
    
    init(pin: PinPoint, radius: CGFloat) {
        super.init()
        
        let topColor: CGColor
        let bottomColor: CGColor
        
        switch pin.type {
        case -2:
            topColor = Colors.out
            bottomColor = Colors.into
        case -1:
            topColor = Colors.out
            bottomColor = Colors.out
        case 1:
            topColor = Colors.into
            bottomColor = Colors.into
        case 2:
            topColor = Colors.into
            bottomColor = Colors.out
        default:
            topColor = Colors.black
            bottomColor = Colors.black
        }
        
        let point = PointConverter.defaultConverter.convert(point: pin.point)
        
        let topArc = self.buildArc(point: point, radius: radius, color: topColor, clockwise: false)
        let bottomArc = self.buildArc(point: point, radius: radius, color: bottomColor, clockwise: true)
        
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
