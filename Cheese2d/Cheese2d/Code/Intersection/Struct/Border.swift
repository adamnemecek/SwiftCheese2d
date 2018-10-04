//
//  Border.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 30/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation

struct BorderVertex {
    let pt: Point
    let ms: Int
    let ed: Int
    let sl: Int
}

struct Border {
    
    let v0: BorderVertex
    let v1: BorderVertex

    let isZeroCorner: Int
    let length: Int
    
    func extract(points: [Point]) -> [CGPoint] {
        let n = points.count
        var path = [CGPoint]()
        
        guard length > 1 else {
            return [DataNormalizer.convert(point: v0.pt), DataNormalizer.convert(point: v1.pt)]
        }
        
        path.reserveCapacity(length + 1)
        path.append(DataNormalizer.convert(point: v0.pt))
        
        let a = (v0.ms + 1) % n
        let b = (v1.ms - 1 + n) % n

        if isZeroCorner == 1 && a != 0 {
            let lastIndex = n - 1
            if a <= lastIndex {
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
        } else if a != v1.ms {
            if a < b {
                let part = Array(points[a...b])
                path.append(contentsOf: DataNormalizer.convert(iPoints: part))
            } else if a == b {
                path.append(DataNormalizer.convert(point: points[a]))
            }
        }
        
        path.append(DataNormalizer.convert(point: v1.pt))
        
        return path
    }
}


