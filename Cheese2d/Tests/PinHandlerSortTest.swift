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
        
        //init(sortFactor: SortUnit, index: Int, isPinPath: Int) {
        let array: [PinHandler] = [
            PinHandler(sortFactor: SortUnit(index: 0, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 1, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 5, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 4, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 3, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 2, offset: 0), index: 0, isPinPath: 0)
        ]
        
        var sortedArray: [PinHandler] = array
        PinHandler.sort(array: &sortedArray)

        let template: [PinHandler] = [array[0], array[1], array[5], array[4], array[3], array[2]]

        let isEqual = sortedArray == template
        
        XCTAssertEqual(isEqual, true)
    }

    
    func test_1() {
        
        var array: [PinHandler] = [
            PinHandler(sortFactor: SortUnit(index: 0, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 1, offset: 1), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 1, offset: 3), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 1, offset: 2), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 3, offset: 0), index: 0, isPinPath: 0),
            PinHandler(sortFactor: SortUnit(index: 2, offset: 0), index: 0, isPinPath: 0)
        ]
        
        var sortedArray: [PinHandler] = array
        
        PinHandler.sort(array: &sortedArray)
        
        let template: [PinHandler] = [array[0], array[1], array[3], array[2], array[5], array[4]]
        
        let isEqual = sortedArray == template
        
        XCTAssertEqual(isEqual, true)
    }
    
}
