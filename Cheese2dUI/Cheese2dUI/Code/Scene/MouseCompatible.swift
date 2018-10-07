//
//  MouseCompatible.swift
//  Cheese2dUI
//
//  Created by Nail Sharipov on 06/10/2018.
//  Copyright © 2018 Nail Sharipov. All rights reserved.
//

import Foundation


protocol MouseCompatible {
    
    func mouseDown(point: CGPoint)
    
    func mouseUp(point: CGPoint)
    
    func mouseDragged(point: CGPoint)
    
}

