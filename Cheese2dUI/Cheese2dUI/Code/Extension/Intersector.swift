//
//  Intersector.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 23/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
@testable import Cheese2d

struct EdgePath {
    let path: [CGPoint]
    fileprivate let type: Int
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct Pin {
    let point: CGPoint
    fileprivate let type: Int
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct IntersectorResult {
    
    let points: [Pin]
    let path: [EdgePath]
    
    fileprivate static func getColors(type: Int) -> [CGColor] {
        switch type {
            case -2: return [Colors.out, Colors.into]
            case -1: return [Colors.out, Colors.out]
            case 1: return [Colors.into, Colors.into]
            case 2: return [Colors.into, Colors.out]
            default: return [Colors.black, Colors.black]
        }
    }
}


extension Intersector {
    static func findPins(master: [CGPoint], slave: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> IntersectorResult {
        let iMaster = converter.convert(points: master)
        let iSlave = converter.convert(points: slave)
        
        let navigator = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, converter: converter, exclusionPinType: PinPoint.null)
        
        var borders = [EdgePath]()
        var points = [Pin]()
        
        for node in navigator.nodeArray {
            if node.marker == 0 {
                let index = node.index
                if node.isPinPath == 1 {
                    let path = navigator.pinPathArray[index]
                    let edgePath = EdgePath(path: path.extract(points: iMaster, converter: converter), type: path.v0.type)
                    borders.append(edgePath)
                } else {
                    let p = navigator.pinPointArray[index]
                    let point = converter.convert(point: p.point)
                    points.append(Pin(point: point, type: p.type))
                }
            }
            
        }
        
        return IntersectorResult(points: points, path: borders)
    }
}
