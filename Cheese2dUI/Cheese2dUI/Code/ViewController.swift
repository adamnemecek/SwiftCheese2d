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
    
    private let scene = BorderTest()

    override func viewDidLoad() {
        super.viewDidLoad()

        canvasView.add(shape: scene)
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
    
}

