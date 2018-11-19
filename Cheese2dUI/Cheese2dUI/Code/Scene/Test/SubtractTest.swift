//
//  SubtractTest.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 11/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
import Cheese2d


class SubtractTest: CoordinateSystemScene {

    private var master: [CGPoint] = SubtractTest.master_0()
    private var slave: [CGPoint] = SubtractTest.slave_0_13()
    
    private let maxPageIndex: Int = 14
    private var pageIndex: Int = 0
    
    private static func master_0() -> [CGPoint] {
        return [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
    }
    
    private static func master_spiral_0() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 10),
            CGPoint(x: 12.5, y: 10),
            CGPoint(x: 12.5, y: 5),
            CGPoint(x: -7.5, y: 5)
        ]
    }
    
    
    private static func master_spiral_1() -> [CGPoint] {
        return [
            CGPoint(x: -7.5, y: 2.5),
            CGPoint(x: 12.5, y: 2.5),
            CGPoint(x: 12.5, y: -2.5),
            CGPoint(x: -7.5, y: -2.5)
        ]
    }
    
    
    private static func slave_0_0() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 5, y: -15),
            CGPoint(x: 5, y: 0),
            CGPoint(x: -5, y: 0)
        ]
    }
    
    
    private static func slave_0_1() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 15)
        ]
    }
    
    
    private static func slave_0_2() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -15),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
    }
    
    
    private static func slave_0_3() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -5, y: 10)
        ]
    }

    
    private static func slave_0_4() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -10, y: 10)
        ]
    }
    
    
    private static func slave_0_5() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: -10),
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -20, y: 10)
        ]
    }
    
    
    private static func slave_0_6() -> [CGPoint] {
        return [
            CGPoint(x: 15, y: -15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_0_7() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: -15),
            CGPoint(x: 0, y: 0),
            CGPoint(x: -15, y: 0)
        ]
    }
    
    
    private static func slave_0_8() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 0),
            CGPoint(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_0_9() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 0, y: 10)
        ]
    }
    
    
    private static func slave_0_10() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 5),
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_0_11() -> [CGPoint] {
        return [
            CGPoint(x: -30, y: -10),
            CGPoint(x: 0, y: -10),
            CGPoint(x: 10, y: 10)
        ]
    }
    
    
    private static func slave_0_12() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 5)
        ]
    }
    
    
    private static func slave_0_13() -> [CGPoint] {
        return [
            CGPoint(x: 5, y: -10),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 0, y: -15)
        ]
    }
    
    
    private static func slave_0_14() -> [CGPoint] {
        return [
            CGPoint(x: -5, y: 10),
            CGPoint(x: -10, y: 5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -5, y: -10),
            CGPoint(x: 5, y: -10),
            CGPoint(x: 10, y: -5),
            CGPoint(x: 10, y: 5),
            CGPoint(x: 5, y: 10)
        ]
    }
    
    
    private static func slave_spiral_0() -> [CGPoint] {
        return [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 20),
            CGPoint(x: -15, y: 20),
            CGPoint(x: -15, y: -10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: 10, y: 30),
            CGPoint(x: -25, y: 30),
            CGPoint(x: -25, y: -20),
            CGPoint(x: 20, y: -20),
            CGPoint(x: 20, y: 20),
            CGPoint(x: 15, y: 20),
            CGPoint(x: 15, y: -15),
            CGPoint(x: -20, y: -15),
            CGPoint(x: -20, y: 25),
            CGPoint(x: 5, y: 25),
            CGPoint(x: 5, y: -5),
            CGPoint(x: -10, y: -5),
            CGPoint(x: -10, y: 15),
            CGPoint(x: -5, y: 15),
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
        
        self.addSublayer(ShapeForm(points: slave, color: Colors.slave_second))
        
        let solver = Solver(master: master, slave: slave)
        let solution: FloatSolution = solver.substract()
        
        if solution.disposition == .hasIntersections {
            for path in solution.pathCollection {
                let shape = ShapeForm(points: path, color: Colors.solution)
                self.addSublayer(shape)
            }
        }
        
        self.addSublayer(ShapePolygon(points: master, tip: 1.0, lineWidth: 0.2, color: Colors.slave, showIndeces: true, scaleIndeces: 4, dash: nil))
        self.addSublayer(ShapePolygon(points: slave, tip: 1.0, lineWidth: 0.3, color: Colors.master, showIndeces: true, scaleIndeces: -2.5, dash: [2,3]))
        
        let paths = result.path
        for path in paths {
            let shape = ShapePath(points: path, tip: 1.5, lineWidth: 0.3, color: Colors.border, showIndeces: false, showLast: false, scaleIndeces: 1, dash: nil)
            self.addSublayer(shape)
        }

        
        for pin in points {
            self.addSublayer(ShapePinDot(pin: pin, radius: 0.6))
        }
    }
    
    func showPpage(index: Int) {
        switch index {
        case 1:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_1()
        case 2:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_2()
        case 3:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_3()
        case 4:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_4()
        case 5:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_5()
        case 6:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_6()
        case 7:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_7()
        case 8:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_8()
        case 9:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_9()
        case 10:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_10()
        case 11:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_11()
        case 12:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_12()
        case 13:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_13()
        case 14:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_14()
        default:
            self.master = SubtractTest.master_0()
            self.slave = SubtractTest.slave_0_0()
        }
        self.update()
    }
    
}


extension SubtractTest: MouseCompatible {
    
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
                print("drag: \(point)")
                self.master[index] = point
                self.update()
            }
        }
    }
}

extension SubtractTest: Navigation {
    func next() {
        self.pageIndex = (self.pageIndex + 1) % maxPageIndex
        self.showPpage(index: self.pageIndex)
    }
    
    func back() {
        self.pageIndex = (self.pageIndex - 1 + maxPageIndex) % maxPageIndex
        self.showPpage(index: self.pageIndex)
    }
}

