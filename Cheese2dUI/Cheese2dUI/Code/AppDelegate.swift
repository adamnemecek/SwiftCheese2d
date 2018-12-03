//
//  AppDelegate.swift
//  SwiftCheese2d
//
//  Created by Nail Sharipov on 18/09/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Cocoa
@testable import Cheese2d

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private func convert(points: [CGPoint], converter: PointConverter = PointConverter.defaultConverter) -> [IndexPoint] {
        var path = [IndexPoint]()
        path.reserveCapacity(points.count)
        var i = 0
        for point in points {
            path.append(IndexPoint(index: i, point: converter.convert(point: point)))
            i += 1
        }
        return path
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let points: [CGPoint] = [
            CGPoint(x: -10, y: 10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 10, y: -10),
            CGPoint(x: -10, y: -10)
        ]
        
        let path = self.convert(points: points)
        
        let index = Triangulator.triangulate(path: path)
        
        print(index)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

