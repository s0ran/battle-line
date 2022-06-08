//
//  Card.swift
//  battle-line
//
//  Created by s0ran on 2022/05/28.
//

import Foundation
import SpriteKit
import UIKit

class NumberCard:SKSpriteNode{
    let number:Int
    let color_id:Int
    let colors=[SKColor.red, SKColor.blue, SKColor.purple, SKColor.yellow, SKColor.orange, SKColor.green]
    var state:CardState = .back {
        willSet(newState) {
            print("state changed",newState)
            switch newState{
            case .back:
                turnover()
            case .face:
                print("in front")
                open()
            }
        }
    }
    
    enum CardState{
        case face
        case back
    }
    
    init(_ color_id:Int, _ number:Int){
        self.number=number
        self.color_id=color_id
        super.init(texture:SKTexture(),color:.systemRed,size:cardSize!)
        let background=SKShapeNode(rectOf: cardSize!)
        background.fillColor=SKColor.red
        self.addChild(background)
    }
    
    func turnover(){
        self.removeAllChildren()
        let background=SKShapeNode(rectOf: cardSize!)
        background.fillColor=SKColor.red
        self.addChild(background)
    }
    
    func open(){
        print("called open")
        self.removeAllChildren()
        let background=SKShapeNode(rectOf: cardSize!)
        print(color_id)
        background.fillColor=colors[color_id]
        self.addChild(background)
        let label=SKLabelNode(text:String(self.number))
        label.fontName = "AvenirNext-Bold"
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

