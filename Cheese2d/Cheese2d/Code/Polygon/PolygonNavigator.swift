//
//  PolygonNavigator.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 07/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


struct PolygonNavigator {
    
    struct Vertex {
        let index: Int
        let point: Point
    }
    
    struct Link {
        var prev: Int
        var next: Int
    }
    
    
    let origin: [Vertex]
    let sortedList: [Vertex]
    var linkedList: [Link]

    
    init(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) {
        let n = points.count
        
        // build origin
        
        var list = [Vertex]()
        list.reserveCapacity(n)
        
        for i in 0...n-1 {
            let point = converter.convert(point: points[i])
            let vertex = Vertex(index: i, point: point)
            list.append(vertex)
        }
        
        self.origin = list
        
        // build sortedList
        
        var sortBuffer = [Vertex]()
        sortBuffer.reserveCapacity(n)

        sortBuffer.append(origin[n - 1])

        var i = 1
        var b: Int64 = 0
        var a: Int64 = 0
        while sortBuffer.count < n {
            let j = i - 1
            b = origin[j].point.x
            a = origin[i].point.x
            var length = 0
            if a >= b {
                repeat {
                    i += 1
                    length += 1
                    if i < n {
                        b = a
                        a = origin[i].point.x
                    } else {
                        break
                    }
                } while a >= b
                if length > 1 {
                    let slice = origin[j...j + length - 1].reversed()
                    sortBuffer.append(contentsOf: slice)
                } else {
                    sortBuffer.append(origin[j])
                }
            } else {
                repeat {
                    i += 1
                    length += 1
                    if i < n {
                        b = a
                        a = origin[i].point.x
                    } else {
                        break
                    }
                } while a <= b
                if length > 1 {
                    let slice = origin[j...j + length - 1]
                    sortBuffer.append(contentsOf: slice)
                } else {
                    sortBuffer.append(origin[j])
                }
            }

            var buffer = [Vertex]()
            buffer.reserveCapacity(i)
            
            var ai = 0
            let aEnd = j
            var bi = j + 1
            let bEnd = j + length
            a = sortBuffer[ai].point.x
            b = sortBuffer[bi].point.x
            repeat {
                if b > a {
                    buffer.append(sortBuffer[bi])
                    bi += 1
                    if bi > bEnd {
                        let slice = sortBuffer[ai...aEnd]
                        buffer.append(contentsOf: slice)
                        break
                    }
                    b = sortBuffer[bi].point.x
                } else {
                    buffer.append(sortBuffer[ai])
                    ai += 1
                    if ai > aEnd {
                        let slice = sortBuffer[bi...bEnd]
                        buffer.append(contentsOf: slice)
                        break
                    }
                    a = sortBuffer[ai].point.x
                }
            } while true
            
            sortBuffer.replaceSubrange(0...i-1, with: buffer)
        }
        
        self.sortedList = sortBuffer
        
        // build linked list
        
        self.linkedList = [Link]()
        linkedList.reserveCapacity(n)

        linkedList.append(Link(prev: n-1, next: 1))
        for i in 1...n-2 {
            linkedList.append(Link(prev: i - 1, next: i + 1))
        }
        linkedList.append(Link(prev: n-2, next: 0))
    }

    
}
