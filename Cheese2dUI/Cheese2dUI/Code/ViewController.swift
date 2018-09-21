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
/*
        var matrix = AdjacencyMatrix()
        
        matrix.addMate(master: 0, slave: 1)
        matrix.addMate(master: 0, slave: 4)
        matrix.addMate(master: 0, slave: 5)
        matrix.addMate(master: 2, slave: 0)
        matrix.addMate(master: 2, slave: 1)
        matrix.addMate(master: 2, slave: 2)
        matrix.addMate(master: 2, slave: 3)
        matrix.addMate(master: 3, slave: 1)
        matrix.addMate(master: 3, slave: 2)
        matrix.addMate(master: 3, slave: 4)
        matrix.addMate(master: 3, slave: 5)
        matrix.addMate(master: 3, slave: 6)
        
        matrix.printSelf()
        
        let range = matrix.getRange(master: 2)
        
        print(range)
*/
        canvasView.add(shape: IntersectionTest())
    }

}

