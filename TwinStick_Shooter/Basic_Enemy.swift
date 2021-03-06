//
//  Basic_Enemy.swift
//  TwinStick_Shooter
//
//  Created by William Leet on 6/7/20.
//  Copyright © 2020 William Leet. All rights reserved.
//
//  My first actual enemy! Moves slowly towards player, periodically firing a basic bullet at them

import UIKit
import SpriteKit
import GameplayKit


class Basic_Enemy: Enemy{
    
    //Is given a weapon and the player's data to help it aim
    var weapon: Weapon!
    
    convenience init(scale: CGFloat, game_world: GameScene){
        self.init(sprite: "Basic Enemy", scale: scale, game_world: game_world, hp: 3, hitbox: 0.5)
        weapon = Enemy_Pistol(game_world: game_scene, user: self, barrel_len: (self.frame.height/2))
    }
    
    //Runs the ship's movement and firing behaviors indefinitely. 
    override func deploy(){
        let attack: SKAction = SKAction.run{
                self.weapon.fire(angle: self.zRotation)
        }
        let between_shots = SKAction.wait(forDuration: self.weapon.get_fire_rate())
        let firing_seq = SKAction.sequence([between_shots,attack])
        let firing_behavior = SKAction.repeatForever(firing_seq)
        let movement_behavior = aggressive_behavior(scene: game_scene, ship: self, opponent: opponent)
        self.run(firing_behavior)
        self.run(movement_behavior)
        
    }
    
    override func set_constraints(){
        //Defines a constraint that forces the ship to always face the player
        //This lets it actually fire with some degree of sensibility
        let lookAtConstraint: SKConstraint = SKConstraint.orient(to: opponent, offset: SKRange(constantValue: -CGFloat.pi / 2))
        self.constraints = [lookAtConstraint]
    }
    
}
