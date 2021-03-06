//
//  CombineTest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 29/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//


import Cocoa
@testable import Cheese2d

class CombineTest: CoordinateSystemScene {
    
    private var master: [CGPoint] = []
    private var slave: [CGPoint] = []
    
    private var pageIndex: Int = CombineTestData.active
    
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
        let result = Intersector.findPins(master: master, slave: slave, converter: PointConverter.defaultConverter, exclusionPinType: -2)
        let points = result.points
        
        self.addSublayer(ShapeForm(points: slave, color: Colors.slave_second))
        self.addSublayer(ShapeForm(points: master, color: Colors.master_second))
        
        
        let solution: FloatSolution = Combiner.combine(master: master, slave: slave)
        
        if solution.disposition == .hasIntersections {
            for polygon in solution.polygons {
                if !polygon.isHole {
                    let shape = ShapeForm(points: polygon.path, color: Colors.solution)
                    self.addSublayer(shape)
                }
            }
            for polygon in solution.polygons {
                if polygon.isHole {
                    let shape = ShapeForm(points: polygon.path, color: Colors.solution_second)
                    self.addSublayer(shape)
                }
            }
        }
        
        self.addSublayer(ShapePolygon(points: master, tip: 1.0, lineWidth: 0.4, color: Colors.master, showIndeces: .index, scaleIndeces: 4, dash: nil))
        self.addSublayer(ShapePolygon(points: slave, tip: 1.0, lineWidth: 0.4, color: Colors.slave, showIndeces: .index, scaleIndeces: -2.5, dash: [2,3]))
        
        let paths = result.path
        for edgePath in paths {
            let colors = edgePath.colors
            let shape = ShapePath(points: edgePath.path, tip: 1.5, lineWidth: 0.4, color: colors[0], showIndeces: .none, showLast: false, scaleIndeces: 1, dash: nil, arrowColor: colors[1])
            self.addSublayer(shape)
        }
        
        
        for pin in points {
            self.addSublayer(ShapePinDot(pin: pin, radius: 0.7))
        }
    }
    
    func showPpage(index: Int) {
        let result = CombineTestData.data(index: index)
        self.master = result.master
        self.slave = result.slave
        self.update()
    }
    
}


extension CombineTest: MouseCompatible {
    
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
                self.master[index] = point
                self.update()
            }
        }
    }
}

extension CombineTest: TestNavigation {
    func next() {
        self.pageIndex = (self.pageIndex + 1) % CombineTestData.count
        self.showPpage(index: self.pageIndex)
    }
    
    func back() {
        self.pageIndex = (self.pageIndex - 1 + CombineTestData.count) % CombineTestData.count
        self.showPpage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
