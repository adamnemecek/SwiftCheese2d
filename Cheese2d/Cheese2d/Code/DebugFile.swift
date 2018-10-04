//
//  DebugFile.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 21/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public class DebugFile {
    
    
    public static func run() {
        let emptyVertex = BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0)
        
        var borders = [Border]()
        
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 5, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 4, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 3, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 2, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 1, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 0, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        
        Border.sort(borders: &borders)
        
    }
    
    
    
}
