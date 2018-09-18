//
//  ShapeCoordinatSystem.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa

class ShapeCoordinatSystem: CALayer {
    
    init(position: CGPoint, length: CGFloat, tip: CGFloat, lineWidth: CGFloat, strokeColor: CGColor) {
        super.init()
        
        let vecOx = ShapeVector(start: position, end: position + CGPoint(radius: length, angle: 0), tip: tip, lineWidth: lineWidth, strokeColor: strokeColor)
        let vecOy = ShapeVector(start: position, end: position + CGPoint(radius: length, angle: 0.5 * CGFloat.pi), tip: tip, lineWidth: lineWidth, strokeColor: strokeColor)
        
        self.addSublayer(vecOx)
        self.addSublayer(vecOy)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
