//
//  BreakTest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 04/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
@testable import Cheese2d

class BreakTest: CoordinateSystemScene {
    
    private var points: [CGPoint] = []
    
    private var pageIndex: Int = BreakTestData.active
    
    private var activeIndex: Int?
    private var isSlave: Bool = false
    
    
    override init() {
        super.init()
        self.showPpage(index: pageIndex)
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
        let index = Breaker.triangulate(points: points)
        var count = 0
        var triangle = [CGPoint.zero, CGPoint.zero, CGPoint.zero]

        let font = NSFont.systemFont(ofSize: 32)
        while count < index.count {
            triangle[0] = points[index[count]]
            triangle[1] = points[index[count + 1]]
            triangle[2] = points[index[count + 2]]
            count += 3
            self.addSublayer(Triangle(points: triangle, lineWidth: 0.1, color: Colors.gray, number: count / 3, font: font))
        }

        self.addSublayer(ShapePolygon(points: points, tip: 1.0, lineWidth: 0.4, color: Colors.master, showIndeces: true, scaleIndeces: 4, dash: nil))
    }
    
    func showPpage(index: Int) {
        self.points = BreakTestData.data[index][0]
        self.update()
    }
    
}


extension BreakTest: MouseCompatible {
    
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
        
        if let index = findNearest(point: point, points: points) {
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
        let prevPoint = self.points[index]
        if point != prevPoint {
            self.points[index] = point
            self.update()
        }
    }
}

extension BreakTest: TestNavigation {
    func next() {
        let n = BreakTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        self.showPpage(index: self.pageIndex)
    }
    
    func back() {
        let n = BreakTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        self.showPpage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
