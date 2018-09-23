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
        let num = [0, 0, 0, 0, 1, 1, 1, 2, 2, 2]
        let adj = [0, 1, 2, 3, 1, 2, 3, 3, 5, 7]
        
        let matrix = AdjacencyMatrix(masterIndices: SortedNumbers(numbers: num), adjacencies: adj)
        
        let revMatrix = matrix.reverse()
        
        let a = revMatrix.adjacencies == [0, 0, 1, 0, 1, 0, 1, 2, 2, 2, 1]
        print(a)
        print(revMatrix)
        
    }
    
    
    
}
