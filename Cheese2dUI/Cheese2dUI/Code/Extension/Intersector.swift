//
//  Intersector.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 23/11/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation
@testable import Cheese2d

extension Intersector {
    static func findPins(master: [CGPoint], slave: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> IntersectorResult {
        let iMaster = converter.convert(points: master)
        let iSlave = converter.convert(points: slave)
        
        let navigator = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, converter: converter, exclusionPinType: PinPoint.null)
        
        var borders = [[CGPoint]]()
        var points = [PinPoint]()
        
        for node in navigator.nodeArray {
            if node.marker == 0 {
                let index = node.index
                if node.isPinPath == 1 {
                    let path = navigator.pinPathArray[index]
                    borders.append(path.extract(points: iMaster, converter: converter))
                    points.append(path.v0)
                    points.append(path.v1)
                } else {
                    let p = navigator.pinPointArray[index]
                    points.append(p)
                }
            }
            
        }
        
        return IntersectorResult(points: points, path: borders)
    }
}
