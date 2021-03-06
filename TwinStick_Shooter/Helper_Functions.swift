//
//  Helper_Functions.swift
//  TwinStick_Shooter
//
//  Created by William Leet on 2/3/20.
//  Copyright © 2020 William Leet. All rights reserved.
//
//  Functions to help things move and fire properly, among other things

import UIKit
import SpriteKit
import GameplayKit


func point_on_circle(angle: CGFloat, circle_size: CGFloat) -> [CGFloat]{
    //Returns the x and y coordinates for a point from the radius of circle at {0,0}
    //The angle determines the location of the point on the radius
    //Used for calculating bullet launch speeds and starting position
    var coords = [CGFloat]()
    let x = cos(angle) * circle_size
    let y = sin(angle) * circle_size
    coords.append(y)
    coords.append(x)
    return coords
}

//Returns the distance between two points
//Helps with certain AI behaviors. 
func getDistance(_ point1: CGPoint, _ point2: CGPoint) -> CGFloat{
    let x = point1.x - point2.x
    let y = point1.y - point2.y
    return sqrt((x*x) + (y*y))
}
