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
        var numbers = OrdedNumbers()
        numbers.add(number: 0)
        numbers.add(number: 0)
        numbers.add(number: 1)
        numbers.add(number: 1)
        numbers.add(number: 2)
        numbers.add(number: 2)

        
        let range2 = numbers.getRange(number: 2)
        
        assert(range2.begin == 4)
        assert(range2.end == 5)
    }
    
    
    
}
