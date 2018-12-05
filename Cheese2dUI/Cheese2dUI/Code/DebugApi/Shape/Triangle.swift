//
//  Triangle.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 05/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa



class Triangle: CAShapeLayer {
    
    init(points: [CGPoint], lineWidth: CGFloat, color: CGColor, number: Int, font: NSFont) {
        super.init()
        let lastIndex = points.count - 1
        guard lastIndex > 0 else {
            return
        }
        
        let linePath = CGMutablePath()
        linePath.move(to: points[0])
        var middle = points[0]
        for i in 1...lastIndex {
            let p = points[i]
            linePath.addLine(to: p)
            middle.x += p.x
            middle.y += p.y
        }
        middle.x = middle.x / CGFloat(lastIndex + 1)
        middle.y = middle.y / CGFloat(lastIndex + 1)
        
        linePath.addLine(to: points[0])
        
        self.path = linePath
        self.fillColor = nil
        self.lineWidth = lineWidth
        self.opacity = 1.0
        self.strokeColor = color
        
        
        let a = font.pointSize
        let rect = CGRect(x: middle.x - 0.5 * a, y: middle.y - 0.5 * a, width: a, height: a)
        
        let textLayer = CATextLayer()
        textLayer.font = font
        textLayer.fontSize = a
        textLayer.foregroundColor = color
        textLayer.string = String(number)
        textLayer.frame = rect
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.transform = CATransform3DMakeScale(0.05, 0.05, 1.0)

        self.addSublayer(textLayer)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
}
