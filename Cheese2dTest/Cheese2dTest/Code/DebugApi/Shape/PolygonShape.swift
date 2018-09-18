//
//  PolygonShape.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa


class PolygonShape: PathShape {

    override init(points: [CGPoint], tip: CGFloat, lineWidth: CGFloat, strokeColor: CGColor) {
        super.init(points: points + [points[0]], tip: tip, lineWidth: lineWidth, strokeColor: strokeColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }

}
