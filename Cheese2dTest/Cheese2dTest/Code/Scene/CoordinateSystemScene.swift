//
//  CoordinateSystemScene.swift
//  Cheese2dTest
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d

class CoordinateSystemScene: CALayer {
    
    override init() {
        super.init()

        self.addSublayer(CoordinatSystemShape(position: .zero, length: 100.0, lineWidth: 0.5, strokeColor: Colors.darkGray))
        
        print(Vector2(x: 0, y: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
