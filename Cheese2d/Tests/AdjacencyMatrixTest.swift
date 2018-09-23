//
//  AdjacencyMatrixTest.swift
//  Tests
//
//  Created by Nail Sharipov on 23/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import XCTest
@testable import Cheese2d


class AdjacencyMatrixTest: XCTestCase {

    
    func testReverseEmpty() {
        let num = [Int]()
        let adj = [Int]()
        
        let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: num), adjacencies: adj)
        let revMatrix = matrix.reverse()
        
        XCTAssertEqual(revMatrix.adjacencies, [])
        XCTAssertEqual(revMatrix.masterIndices.numbers, [])
    }
    
    func testReverseSingle() {
        let num = [1]
        let adj = [0]

        let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: num), adjacencies: adj)
        let revMatrix = matrix.reverse()

        XCTAssertEqual(revMatrix.adjacencies, [1])
        XCTAssertEqual(revMatrix.masterIndices.numbers, [0])
    }
    
    
    func testReverseSimple() {
        let num = [0, 1, 2]
        let adj = [2, 1, 0]
        
        let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: num), adjacencies: adj)
        let revMatrix = matrix.reverse()
        
        XCTAssertEqual(revMatrix.masterIndices.numbers, [0, 1, 2])
        XCTAssertEqual(revMatrix.adjacencies, [2, 1, 0])
    }
    
    
    func testA() {
        let num = [0, 0, 0]
        let adj = [0, 1, 2]
        
        let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: num), adjacencies: adj)
        let revMatrix = matrix.reverse()
        
        XCTAssertEqual(revMatrix.masterIndices.numbers, [0, 1, 2])
        XCTAssertEqual(revMatrix.adjacencies, [0, 0, 0])
    }
    
    
    func testRandom() {
        for _ in 0...100 {
            let xn = Int(arc4random_uniform(100)) + 1
            let yn = Int(arc4random_uniform(100)) + 1
            
            var map: [[Bool]] = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: yn), count: xn)
            
            for _ in 0...xn + yn {
                let x = Int(arc4random_uniform(UInt32(xn)))
                let y = Int(arc4random_uniform(UInt32(yn)))
                
                map[x][y] = true
            }
            
            var index = Array<Int>()
            var adjacency = Array<Int>()
            for y in 0...yn - 1 {
                for x in 0...xn - 1 {
                    if map[x][y] {
                        index.append(y)
                        adjacency.append(x)
                    }
                }
            }
            
            let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: index), adjacencies: adjacency)
            let revMatrix = matrix.reverse()

            var revIndex = Array<Int>()
            var revAdjacency = Array<Int>()
            for x in 0...xn - 1 {
                for y in 0...yn - 1 {
                    if map[x][y] {
                        revIndex.append(x)
                        revAdjacency.append(y)
                    }
                }
            }
            
            XCTAssertEqual(revMatrix.masterIndices.numbers, revIndex)
            XCTAssertEqual(revMatrix.adjacencies, revAdjacency)
        }
    }
    
}
