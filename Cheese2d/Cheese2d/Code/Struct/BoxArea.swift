//
//  BoxArea.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct BoxArea {

    static let empty = BoxArea(minX: CGFloat.greatestFiniteMagnitude, minY: CGFloat.greatestFiniteMagnitude, maxX: -CGFloat.greatestFiniteMagnitude, maxY: -CGFloat.greatestFiniteMagnitude)
    
    private (set) var minX: CGFloat
    private (set) var minY: CGFloat
    private (set) var maxX: CGFloat
    private (set) var maxY: CGFloat

    init(minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        self.minX = minX
        self.minY = minY
        self.maxX = maxX
        self.maxY = maxY
    }
    
    init(a: Vector2, b: Vector2) {
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
    
    
    mutating func assimilate(p: Vector2) {
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
    
    
    func isNotIntersecting(a: Vector2, b: Vector2) -> Bool {
        return a.x < minX && b.x < minX || a.x > maxX && b.x > maxX ||
            a.y < minY && b.y < minY || a.y > maxY && b.y > maxY
    }
    
    
    func isInterscting(box: BoxArea) -> Bool {
        return !(maxX < box.minX || minX > box.maxX || maxY < box.minY || minY > box.maxY)
    }
    
}

