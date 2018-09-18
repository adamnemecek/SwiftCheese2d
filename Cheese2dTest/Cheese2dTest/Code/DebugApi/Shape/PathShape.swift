//
//  PathShape.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa


class PathShape: CALayer {
    
    init(points: [CGPoint], tip: CGFloat, lineWidth: CGFloat, strokeColor: CGColor) {
        super.init()
        let lastIndex = points.count - 1
        guard lastIndex > 0 else {
            return
        }
        var start = points[0]
        for i in 1...lastIndex {
            let end = points[i]
            self.addSublayer(ShapeVector(start: start, end: end, tip: tip, lineWidth: lineWidth, strokeColor: strokeColor))
            start = end
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
}
