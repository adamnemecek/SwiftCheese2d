//
//  BorderSortTest.swift
//  Tests
//
//  Created by Nail Sharipov on 04/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import XCTest
@testable import Cheese2d


class BorderSortTest: XCTestCase {
    
    
    func testOrded() {
        
        let emptyVertex = BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0)
        
        var borders = [Border]()
        
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 1, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 2, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 3, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 4, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 5, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))

        Border.sort(borders: &borders)

        XCTAssertEqual(borders[0].v0.ms, 0)
        XCTAssertEqual(borders[1].v0.ms, 1)
        XCTAssertEqual(borders[2].v0.ms, 2)
        XCTAssertEqual(borders[3].v0.ms, 3)
        XCTAssertEqual(borders[4].v0.ms, 4)
        XCTAssertEqual(borders[5].v0.ms, 5)
    }
    
    
    func testReversed() {
        
        let emptyVertex = BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0)
        
        var borders = [Border]()
        
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 5, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 4, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 3, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 2, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 1, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        
        Border.sort(borders: &borders)
        
        XCTAssertEqual(borders[0].v0.ms, 0)
        XCTAssertEqual(borders[1].v0.ms, 1)
        XCTAssertEqual(borders[2].v0.ms, 2)
        XCTAssertEqual(borders[3].v0.ms, 3)
        XCTAssertEqual(borders[4].v0.ms, 4)
        XCTAssertEqual(borders[5].v0.ms, 5)
    }
    
    func testGrouped_0() {
        
        let emptyVertex = BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0)
        
        var borders = [Border]()
        
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 5, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 4, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 3, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 2, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 1, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 0, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        
        Border.sort(borders: &borders)
        
        XCTAssertEqual(borders[0].v0.ms, 4)
        XCTAssertEqual(borders[1].v0.ms, 5)
        XCTAssertEqual(borders[2].v0.ms, 2)
        XCTAssertEqual(borders[3].v0.ms, 3)
        XCTAssertEqual(borders[4].v0.ms, 0)
        XCTAssertEqual(borders[5].v0.ms, 1)
    }
    
    
    
    func testGrouped_1() {
        
        let emptyVertex = BorderVertex(pt: Point.zero, ms: 0, ed: 0, sl: 0)
        
        var borders = [Border]()
        
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 5, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 4, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 3, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 2, ed: 0, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 1, ed: 1, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        borders.append(Border(v0: BorderVertex(pt: Point.zero, ms: 0, ed: 2, sl: 0), v1: emptyVertex, isZeroCorner: 0, length: 0))
        
        Border.sort(borders: &borders)
        
        XCTAssertEqual(borders[0].v0.ms, 2)
        XCTAssertEqual(borders[1].v0.ms, 3)
        XCTAssertEqual(borders[2].v0.ms, 1)
        XCTAssertEqual(borders[3].v0.ms, 4)
        XCTAssertEqual(borders[4].v0.ms, 0)
        XCTAssertEqual(borders[5].v0.ms, 5)
    }

}
