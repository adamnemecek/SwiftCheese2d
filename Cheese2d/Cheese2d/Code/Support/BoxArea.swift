//
//  BoxArea.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct BoxArea {

    static let empty = BoxArea(minX: Int64.max, minY: Int64.max, maxX: Int64.min, maxY: Int64.min)
    
    private (set) var minX: Int64
    private (set) var minY: Int64
    private (set) var maxX: Int64
    private (set) var maxY: Int64

    init(minX: Int64, minY: Int64, maxX: Int64, maxY: Int64) {
        self.minX = minX
        self.minY = minY
        self.maxX = maxX
        self.maxY = maxY
    }
    
    init(a: Point, b: Point) {
        if b.x > a.x {
            minX = a.x
            maxX = b.x
        } else {
            minX = b.x
            maxX = a.x
        }
        if b.y > a.y {
            minY = a.y
            maxY = b.y
        } else {
            minY = b.y
            maxY = a.y
        }
    }
    
    
    mutating func assimilate(p: Point) {
        if minX > p.x {
            minX = p.x
        }
    
        if minY > p.y {
            minY = p.y
        }
    
        if maxX < p.x {
            maxX = p.x
        }
    
        if maxY < p.y {
            maxY = p.y
        }
    }
    
    
    func isNotIntersecting(a: Point, b: Point) -> Bool {
        return a.x < minX && b.x < minX || a.x > maxX && b.x > maxX ||
            a.y < minY && b.y < minY || a.y > maxY && b.y > maxY
    }
    
    
    func isInterscting(box: BoxArea) -> Bool {
        return !(maxX < box.minX || minX > box.maxX || maxY < box.minY || minY > box.maxY)
    }
    
}

