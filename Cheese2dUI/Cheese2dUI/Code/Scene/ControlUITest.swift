//
//  ControlUITest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 11/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d


class ControlUITest: CoordinateSystemScene {
    
    private var master: [CGPoint] = {
        var master = [CGPoint]()
        
        master.append(CGPoint(x: -10, y: 10))
        master.append(CGPoint(x: 10, y: 10))
        master.append(CGPoint(x: 10, y: -10))
        master.append(CGPoint(x: -10, y: -10))
        
        
        return master
    }()
    
    
    private var slave: [CGPoint] = ControlUITest.slave_0_0()
    
    
    private static func slave_0_0() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 5, y: -15),
            CGPoint(x: 5, y: 0),
            CGPoint(x: -5, y: 0)
        ]
    }
    
    private var activeIndex: Int?
    private var isSlave: Bool = false
    
    
    override init() {
        super.init()
        self.addShapes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    private func update() {
        self.removeAll()
        self.addShapes()
    }
    
    private func removeAll() {
        guard let layers = self.sublayers else {
            return
        }
        for layer in layers {
            if !(layer is ShapeCoordinatSystem || layer is ShapeLine) {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    private func addShapes() {
        let result = Intersector.findPins(master: master, slave: slave)
        let points = result.points
        
        self.addSublayer(ShapePolygon(points: master, tip: 1.0, lineWidth: 0.2, color: Colors.slave, showIndeces: true, scaleIndeces: 4, dash: nil))
        self.addSublayer(ShapePolygon(points: slave, tip: 1.0, lineWidth: 0.3, color: Colors.master, showIndeces: true, scaleIndeces: -2.5, dash: [2,3]))
        
        
        let paths = result.path
        for path in paths {
            let shape = ShapePath(points: path, tip: 1.5, lineWidth: 0.3, color: Colors.border, showIndeces: false, showLast: false, scaleIndeces: 1, dash: nil)
            self.addSublayer(shape)
        }
        
        
        for pin in points {
            self.addSublayer(ShapePinDot(pin: pin, radius: 1.0))
        }
        
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        if solution.disposition == .hasIntersections {
            for path in solution.pathCollection {
                let shape = ShapePath(points: path, tip: 1.5, lineWidth: 2.0, color: Colors.solution, showIndeces: false, showLast: false, scaleIndeces: 1, dash: nil)
                self.addSublayer(shape)
            }
        }
    }
    
}


extension ControlUITest: MouseCompatible {
    
    private func findNearest(point: CGPoint, points: [CGPoint]) -> Int? {
        var i = 0
        while i < points.count {
            let p = points[i]
            let dx = p.x - point.x
            let dy = p.y - point.y
            let r = dx * dx + dy * dy
            if r < 0.2 {
                return i
            }
            
            i += 1
        }
        return nil
    }
    
    
    func mouseDown(point: CGPoint) {
        if let index = findNearest(point: point, points: slave) {
            self.activeIndex = index
            self.isSlave = true
            return
        }
        
        if let index = findNearest(point: point, points: master) {
            self.activeIndex = index
            self.isSlave = false
            return
        }
        
        self.activeIndex = nil
    }
    
    
    func mouseUp(point: CGPoint) {
        self.activeIndex = nil
    }
    
    
    func mouseDragged(point: CGPoint) {
        guard let index = self.activeIndex else {
            return
        }
        
        
        
        let x = CGFloat(Int(point.x * 2)) / 2
        let y = CGFloat(Int(point.y * 2)) / 2
        
        let point = CGPoint(x: x, y: y)
        if isSlave {
            let prevPoint = self.slave[index]
            if point != prevPoint {
                self.slave[index] = point
                self.update()
            }
        } else {
            let prevPoint = self.master[index]
            if point != prevPoint {
                print("dragg: \(point)")
                self.master[index] = point
                self.update()
            }
        }
    }
}

