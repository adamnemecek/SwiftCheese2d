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
    private static let canvasSize: CGFloat = 10
    private (set) var testName: NSTextField = {
        let textField = NSTextField()
        textField.isEditable = false
        textField.stringValue = "none"
        textField.alignment = .center
        textField.isBordered = false
        return textField
    }()
    
    private (set) var help: NSTextField = {
        let textField = NSTextField()
        textField.isEditable = false
        textField.stringValue = "use left/right keys to select test"
        textField.alignment = .center
        textField.isBordered = false
        return textField
    }()
    
    override init(frame frameRect: NSRect) {
        transform = CanvasView.calculateCurrentTransform(rect: frameRect)
        super.init(frame: frameRect)
        wantsLayer = true
        self.layer?.backgroundColor = Colors.white
        self.addSubview(testName)
        self.addSubview(help)
    }
    
    required init?(coder decoder: NSCoder) {
        transform = CATransform3DIdentity
        super.init(coder: decoder)
        wantsLayer = true
        self.layer?.backgroundColor = Colors.white
        self.addSubview(testName)
        self.addSubview(help)
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
        
        let size = self.frame.size
        let width1: CGFloat = 100
        let width2: CGFloat = 100
        let height: CGFloat = 20
        self.testName.frame = CGRect(x: 0.5 * (size.width - width1), y: size.height - height, width: width1, height: height)
        self.help.frame = CGRect(x: 0.5 * (size.width - width2), y: size.height - 10 * height, width: width2, height: height)
    }
    
    private static func calculateCurrentTransform(rect: CGRect) -> CATransform3D {
        return CATransform3DScale(CATransform3DMakeTranslation(0.5 * rect.width, 0.5 * rect.height, 0), canvasSize, canvasSize, 1.0)
    }
    
    
    func convert(point: NSPoint) -> CGPoint {
        let point = self.convert(point, to: nil)
        let rect = self.frame
        let x = (point.x / rect.width - 0.5) * rect.width * CanvasView.canvasSize * 0.01
        let y = (point.y / rect.height - 0.5) * rect.height * CanvasView.canvasSize * 0.01
        
        return CGPoint(x: x, y: y)
    }
    
    func add(shape: CALayer) {
        shape.transform = transform
        self.layer?.addSublayer(shape)
    }

    override var acceptsFirstResponder: Bool {
        return true
    }

}
