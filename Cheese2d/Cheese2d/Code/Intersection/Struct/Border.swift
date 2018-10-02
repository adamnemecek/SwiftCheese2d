//
//  Border.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct Border {
    
    let pt0: Point
    let ms0: Int
    let sl0: Int
    
    let pt1: Point
    let ms1: Int
    let sl1: Int

    let isZeroCorner: Int
    
    func convert() -> BorderPath {
        return BorderPath(pt0: DataNormalizer.convert(point: pt0), ms0: ms0, sl0: sl0, pt1: DataNormalizer.convert(point: pt1), ms1: ms1, sl1: sl1)
    }
    
    
    func extract(points: [Point]) -> [CGPoint] {
        let n = points.count
        var path = [CGPoint]()
        if pt0 != points[(ms0 + 1) % n] {
            path.append(DataNormalizer.convert(point: pt0))
        }
        
        let a = ms0 + 1
        let b = ms1 - 1
        
        if isZeroCorner == 1 {
            let lastIndex = n - 1
            if a < lastIndex {
                if a != lastIndex {
                    let firstPart = Array(points[a...lastIndex])
                    path.append(contentsOf: DataNormalizer.convert(iPoints: firstPart))
                } else {
                    path.append(DataNormalizer.convert(point: points[lastIndex]))
                }
            }
            
            if b >= 0 {
                if b != 0 {
                    let secondPart = Array(points[0...b])
                    path.append(contentsOf: DataNormalizer.convert(iPoints: secondPart))
                } else {
                    path.append(DataNormalizer.convert(point: points[0]))
                }
            }
        } else {
            if a < b {
                let part = Array(points[a...b])
                path.append(contentsOf: DataNormalizer.convert(iPoints: part))
            } else if a == b {
                path.append(DataNormalizer.convert(point: points[a]))
            }

        }
        
        if pt1 != points[(ms1 - 1 + n) % n] {
            path.append(DataNormalizer.convert(point: pt1))
        }
        
        return path
    }
}


