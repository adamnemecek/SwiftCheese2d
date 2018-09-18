//
//  PathShape.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d


class PathShape: CALayer {
    
    init(points: [CGPoint], tip: CGFloat, lineWidth: CGFloat, color: CGColor, showIndeces: Bool, showLast: Bool) {
        super.init()
        var lastIndex = points.count - 1
        guard lastIndex > 0 else {
            return
        }
        var start = points[0]
        for i in 1...lastIndex {
            let end = points[i]
            self.addSublayer(ShapeVector(start: start, end: end, tip: tip, lineWidth: lineWidth, strokeColor: color))
            start = end
        }
        
        if showIndeces {
            let font = NSFont.systemFont(ofSize: 15)
            if !showLast {
                lastIndex -= 1
            }
            
            let r: CGFloat = 1
            
            for i in 0...lastIndex {
                let a = points[i == 0 ? lastIndex : i - 1]
                let b = points[i]
                let c = points[i == lastIndex ? 0 : i + 1]
                
                let m =  (a + b + c) / 3
                let dir = Vector2(point: b - m).normalize
                let p = b + CGPoint(vector: r * dir)
                
                let shapeText = ShapeText(text: String(i), font: font, position: p, pin: b, lineWidth: 0.1, color: Colors.darkGray, strokeColor: Colors.lightGray)
                
                self.addSublayer(shapeText)
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
}
