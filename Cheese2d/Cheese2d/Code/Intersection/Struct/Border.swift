//
//  Border.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct Border {
    
    let ms0: Int
    let ms1: Int
    let sl0: Int
    let sl1: Int
    let pt0: Point
    let pt1: Point

    
    func convert() -> BorderPath {
        return BorderPath(pt0: DataNormalizer.convert(point: pt0), ms0: ms0, sl0: sl0, pt1: DataNormalizer.convert(point: pt1), ms1: ms1, sl1: sl1)
    }
    
}


