//
//  ViewController.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d

class ViewController: NSViewController {

    private var canvasView: CanvasView {
        get {
            return self.view as! CanvasView
        }
    }
    
    private let scene = BreakTest()
    //private let scene = CombineTest()
    //private let scene = SubtractTest()
    //private let scene = AngleTest()

    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.add(shape: scene)
        self.canvasView.testName.stringValue = scene.getName()
    }

    override func mouseDown(with event: NSEvent) {
        let point = self.canvasView.convert(point: event.locationInWindow)
        self.scene.mouseDown(point: point)
    }
    
    
    override func mouseUp(with event: NSEvent) {
        let point = self.canvasView.convert(point: event.locationInWindow)
        self.scene.mouseUp(point: point)
    }
    
    override func mouseDragged(with event: NSEvent) {
        let point = self.canvasView.convert(point: event.locationInWindow)
        self.scene.mouseDragged(point: point)
    }
    
    override func keyDown(with theEvent: NSEvent) {
        if theEvent.keyCode == 124 || theEvent.keyCode == 49 || theEvent.keyCode == 36 {
            scene.next()
            self.canvasView.testName.stringValue = scene.getName()
        } else if theEvent.keyCode == 123 {
            scene.back()
            self.canvasView.testName.stringValue = scene.getName()
        }
    }
    
}

