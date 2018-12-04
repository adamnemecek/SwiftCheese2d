//
//  TriangulatorTest.swift
//  Tests
//
//  Created by Nail Sharipov on 03/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import XCTest
@testable import Cheese2d


class TriangulatorTest: XCTestCase {
    
    
    private func convert(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> [IndexPoint] {
        var path = [IndexPoint]()
        path.reserveCapacity(points.count)
        var i = 0
        for point in points {
            path.append(IndexPoint(index: i, point: converter.convert(point: point)))
            i += 1
        }
        return path
    }
    
    
    func testSquare() {

        let points: [CGPoint] = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let path = self.convert(points: points)
        
        let index = Breaker.triangulate(path: path)
        
        XCTAssertEqual(index.count, 0)
    }
    
}

