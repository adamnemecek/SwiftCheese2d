//
//  Range.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 05/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Range {
    let begin: Int
    let end: Int
    var isEmpty: Bool {
        return begin == -1
    }
}
