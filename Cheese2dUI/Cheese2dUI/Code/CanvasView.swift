//
//  CanvasView.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa

class CanvasView: NSView {
    
    private var transform: CATransform3D
    
    override init(frame frameRect: NSRect) {
        transform = CanvasView.calculateCurrentTransform(rect: frameRect)
        super.init(frame: frameRect)
        wantsLayer = true
        self.layer?.backgroundColor = Colors.white
    }
    
    required init?(coder decoder: NSCoder) {
        transform = CATransform3DIdentity
        super.init(coder: decoder)
        wantsLayer = true
        self.layer?.backgroundColor = Colors.white
    }
    
    override func layout() {
        super.layout()
        
        self.transform = CanvasView.calculateCurrentTransform(rect: self.bounds)

        guard let layers = self.layer?.sublayers else {
            return
        }
        
        for layer in layers {
            layer.transform = self.transform
        }
    }
    
    private static func calculateCurrentTransform(rect: CGRect) -> CATransform3D {
        return CATransform3DScale(CATransform3DMakeTranslation(0.5 * rect.width, 0.5 * rect.height, 0), 10.0, 10.0, 1.0)
    }
    
    func add(shape: CALayer) {
        shape.transform = transform
        self.layer?.addSublayer(shape)
    }
    
}
