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

    override func viewDidLoad() {
        super.viewDidLoad()

        DebugFile.run()
        
        canvasView.add(shape: IntersectionTest())
    }

}

