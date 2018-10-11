//
//  PinHandlerSortTest.swift
//  Tests
//
//  Created by Nail Sharipov on 11/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation



import XCTest
@testable import Cheese2d


class PinHandlerSortTest: XCTestCase {
    
    
    func test_0() {
        
        let array: [PinHandler] = [
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 0, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 5, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 4, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 3, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 2, index: 0, isPinPath: 0)
        ]
        
        var sortedArray: [PinHandler] = array
        PinHandler.sort(array: &sortedArray)

        let template: [PinHandler] = [array[0], array[1], array[5], array[4], array[3], array[2]]

        let isEqual = sortedArray == template
        
        XCTAssertEqual(isEqual, true)
    }

    
    func test_1() {
        
        var array: [PinHandler] = [
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 0, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 1, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 3, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 2, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 3, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 0, y: 0), masterPoint: .zero, masterIndex: 2, index: 0, isPinPath: 0)
        ]
        
        var sortedArray: [PinHandler] = array
        
        PinHandler.sort(array: &sortedArray)
        
        let template: [PinHandler] = [array[0], array[1], array[3], array[2], array[5], array[4]]
        
        let isEqual = sortedArray == template
        
        XCTAssertEqual(isEqual, true)
    }
    
    
    
    func test_2() {
        
        var array: [PinHandler] = [
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 5, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 1, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 3, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 2, y: 0), masterPoint: .zero, masterIndex: 1, index: 0, isPinPath: 0),
            PinHandler(point: .zero, masterPoint: .zero, masterIndex: 3, index: 0, isPinPath: 0),
            PinHandler(point: Point(x: 0, y: 0), masterPoint: .zero, masterIndex: 2, index: 0, isPinPath: 0)
        ]
        
        var sortedArray: [PinHandler] = array
        
        PinHandler.sort(array: &sortedArray)
        
        let template: [PinHandler] = [array[1], array[3], array[2], array[5], array[4], array[0]]
        
        let isEqual = sortedArray == template
        
        XCTAssertEqual(isEqual, true)
    }
    
}
