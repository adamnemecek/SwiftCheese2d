//
//  Breaker.swift
//  Cheese2d
//
//  Created by Nail Sharipov on 03/12/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


public struct Breaker {

    fileprivate enum VertexType: Int {
        case empty
        case simple
        case tunnelStart
        case tunnelEnd
        case holeStart
        case holeEnd
    }
    
    fileprivate struct Vertex {
        fileprivate let prev: Int
        fileprivate let index: Int
        fileprivate let next: Int
        fileprivate let point: Point
        fileprivate let type: VertexType
    }
    
    fileprivate struct Tunnel {
        fileprivate var queue: [Vertex]
        
        fileprivate init(vertex: Vertex) {
            self.queue = [vertex]
        }
        
        fileprivate init(queue: [Vertex]) {
            self.queue = queue
        }
        
    }
    
    private static func buildOrigin(points: [CGPoint], converter: PointConverter) -> [Vertex] {
        var origin = [Vertex]()
        let n = points.count
        origin.reserveCapacity(n)
        
        var prev = n - 2
        var index = n - 1
        var next = 0
        var a = converter.convert(point: points[prev])
        var b = converter.convert(point: points[index])

        repeat {
            let c = converter.convert(point: points[next])

            var type: VertexType = .simple
            if a.x <= b.x && b.x > c.x {
                type = .tunnelEnd
            } else if a.x > b.x && b.x <= c.x {
                type = .tunnelStart
            }
            
            let vertex = Vertex(prev: prev, index: index, next: next, point: b, type: type)
            origin.append(vertex)
            prev = index
            index = next
            next += 1
            a = b
            b = c
        } while next < n
        
        return origin
    }
    
    
    private static func buildSortedList(origin: [Vertex]) -> [Vertex] {
        var sortedList = [Vertex]()
        let n = origin.count
        sortedList.reserveCapacity(n)
        
        sortedList.append(origin[n - 1])
        
        var i = 1
        var b: Int64 = 0
        var a: Int64 = 0
        while sortedList.count < n {
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
                    let slice = origin[j...j + length - 1]
                    sortedList.append(contentsOf: slice)
                } else {
                    sortedList.append(origin[j])
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
                    let slice = origin[j...j + length - 1].reversed()
                    sortedList.append(contentsOf: slice)
                } else {
                    sortedList.append(origin[j])
                }
            }
            
            var buffer = [Vertex]()
            buffer.reserveCapacity(i)
            
            var ai = 0
            let aEnd = j
            var bi = j + 1
            let bEnd = j + length
            a = sortedList[ai].point.x
            b = sortedList[bi].point.x
            repeat {
                if b < a {
                    buffer.append(sortedList[bi])
                    bi += 1
                    if bi > bEnd {
                        let slice = sortedList[ai...aEnd]
                        buffer.append(contentsOf: slice)
                        break
                    }
                    b = sortedList[bi].point.x
                } else {
                    buffer.append(sortedList[ai])
                    ai += 1
                    if ai > aEnd {
                        let slice = sortedList[bi...bEnd]
                        buffer.append(contentsOf: slice)
                        break
                    }
                    a = sortedList[ai].point.x
                }
            } while true
            
            sortedList.replaceSubrange(0...i-1, with: buffer)
        }

        return sortedList
    }
    
    
    static func triangulate(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> [Int] {
        
        let n = points.count
        
        let origin: [Vertex] = buildOrigin(points: points, converter: converter)
        
        let sortedList = buildSortedList(origin: origin)
        
        let totalCount = n - 2
        
        var index = [Int]()
        index.reserveCapacity(3 * totalCount)
        
        var tunnelQueue = [Tunnel]()
        //TODO check for vertical wall
        
        var i = 0
        
        repeat {
            let a = sortedList[i]
            var upMerge = -1
            var downMerge = -1
            var mergePointIndex = -1
            if a.type != .tunnelStart {
                for j in 0..<tunnelQueue.count {
                    var tunnel = tunnelQueue[j]

                    let n = tunnel.queue.count
                    var b = tunnel.queue[0]
                    
                    if n > 1 {
                        var c = tunnel.queue[n - 1]
                        var m = 0
                        if c.prev == a.index || c.next == a.index {
                            var k = n - 1
                            repeat {
                                k -= 1
                                b = tunnel.queue[k]
                                
                                if Triangle.isCCW(a: a.point, b: b.point, c: c.point) {
                                    index.append(a.index)
                                    index.append(b.index)
                                    index.append(c.index)
                                    m += 1
                                } else {
                                    break
                                }
                                c = b
                            } while k > 0

                            if m > 0 {
                                let mergePoint = tunnel.queue[0]
                                if mergePoint.type == .tunnelEnd {
                                    upMerge = j
                                    mergePointIndex = mergePoint.index
                                }
                                
                                tunnel.queue.removeLast(m)
                            }
                            tunnel.queue.append(a)
                        } else if b.prev == a.index || b.next == a.index {
                            var k = 1
                            repeat {
                                c = tunnel.queue[k]
                                
                                if Triangle.isCCW(a: a.point, b: b.point, c: c.point) {
                                    index.append(a.index)
                                    index.append(b.index)
                                    index.append(c.index)
                                    m += 1
                                } else {
                                    break
                                }
                                b = c
                                k += 1
                            } while k < n
                            
                            if m > 0 {
                                let mergePoint = tunnel.queue[n - 1]
                                if mergePoint.type == .tunnelEnd {
                                    downMerge = j
                                    mergePointIndex = mergePoint.index
                                }
                                
                                tunnel.queue.removeFirst(m)
                            }
                            tunnel.queue.insert(a, at: 0)
                        }
                    } else { // n == 1 {
                        if b.prev == a.index || b.next == a.index {
                            if a.point.y >= b.point.y {
                                tunnel.queue.append(a)
                            } else {
                                tunnel.queue.insert(a, at: 0)
                            }
                            
                        }
                        
                    }

                    tunnelQueue[j] = tunnel
                }  // tunnel for
                
                if downMerge >= 0 {
                    for j in 0..<tunnelQueue.count {
                        if j != downMerge {
                            let tunnel = tunnelQueue[j]
                            if tunnel.queue[0].index == mergePointIndex {
                                upMerge = j
                                break
                            }
                        }
                    }
                } else if upMerge >= 0 {
                    for j in 0..<tunnelQueue.count {
                        if j != upMerge {
                            let tunnel = tunnelQueue[j]
                            let n = tunnel.queue.count
                            if tunnel.queue[n - 1].index == mergePointIndex {
                                downMerge = j
                                break
                            }
                        }
                    }
                }
                
                if downMerge >= 0 && upMerge >= 0 {
                    let upTunnel = tunnelQueue[upMerge]
                    let downTunnel = tunnelQueue[downMerge]
                    var queue = [Vertex]()
                    
                    queue.reserveCapacity(upTunnel.queue.count + downTunnel.queue.count - 1)
                    let range = downTunnel.queue[0..<downTunnel.queue.count - 1]
                    queue.append(contentsOf: range)
                    queue.append(contentsOf: upTunnel.queue)
                    let tunnel = Tunnel(queue: queue)
                    
                    if downMerge > upMerge {
                        tunnelQueue.remove(at: downMerge)
                        tunnelQueue[upMerge] = tunnel
                    } else {
                        tunnelQueue.remove(at: upMerge)
                        tunnelQueue[downMerge] = tunnel
                    }
                }
            } else {
                tunnelQueue.append(Tunnel(vertex: a))
            }
            
            i += 1
        } while i < n
        
        
        
        return index
    }
}
