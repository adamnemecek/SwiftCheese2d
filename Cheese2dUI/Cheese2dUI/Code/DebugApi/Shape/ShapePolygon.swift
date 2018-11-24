//
//  ShapePolygon.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa


class ShapePolygon: ShapePath {

    init(points: [CGPoint], tip: CGFloat, lineWidth: CGFloat, color strokeColor: CGColor, showIndeces: Bool, scaleIndeces: CGFloat, dash: [NSNumber]?) {
        super.init(points: points + [points[0]], tip: tip, lineWidth: lineWidth, color: strokeColor, showIndeces: showIndeces, showLast: false, scaleIndeces: scaleIndeces, dash: dash, arrowColor: strokeColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }

}
