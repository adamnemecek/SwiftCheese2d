//
//  AngleTest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa
import Cheese2d

class AngleTest: CoordinateSystemScene {
    
    private var points: [CGPoint] = {
        var points = [CGPoint]()
        
        points.append(CGPoint(x: 0, y: 0))
        points.append(CGPoint(x: 0, y: 10))
        points.append(CGPoint(x: 10, y: -10))
        points.append(CGPoint(x: 10, y: 0))
        
        return points
    }()
    
    private var activeIndex: Int?
    
    
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

        let vecOA = ShapeVector(start: points[0], end: points[1], tip: 1.5, lineWidth: 0.3, strokeColor: Colors.darkGray, dash: nil)
        let vecOB = ShapeVector(start: points[0], end: points[2], tip: 1.5, lineWidth: 0.3, strokeColor: Colors.darkGray, dash: nil)
        
        
        let corner = Corner(o: points[0], a: points[1], b: points[2])
        
        let result = corner.isBetween(p: points[3])
        
        let color: CGColor
        if result {
            color = Colors.red
        } else {
            color = Colors.blue
        }
        
        
        let dot = ShapeDot(position: points[3], radius: 1.0, color: color)

        self.addSublayer(vecOA)
        self.addSublayer(vecOB)
        self.addSublayer(dot)

    }
    
}


extension AngleTest: MouseCompatible {
    
    private func findNearest(point: CGPoint, points: [CGPoint]) -> Int? {
        var i = 0   // skip O point
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
        if let index = findNearest(point: point, points: points) {
            self.activeIndex = index
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
        let prevPoint = self.points[index]
        if point != prevPoint {
            if index == 3 {
                let a = points[0]
                let b = points[3]
                let dx = a.x - b.x
                let dy = a.y - b.y
                if (dx*dx + dy*dy) < 0.0001 {
                    return
                }
            }
            print("point: \(point)")
            self.points[index] = point
            self.update()
        }
    }
}
