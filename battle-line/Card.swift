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
    init(number:Int,color_id:Int){
        self.number=number
        self.color_id=color_id
        let colors=[SKColor.red,SKColor.blue,SKColor.purple,SKColor.yellow,SKColor.orange,SKColor.green]
        super.init(texture:SKTexture(),color:.systemRed,size:CGSize(width:50, height:70))
        let background=SKShapeNode(rectOf: CGSize(width: 50, height: 70))
        background.fillColor=SKColor.red
        let label=SKLabelNode(text:String(self.number))
        label.fontName = "AvenirNext-Bold"
        self.addChild(background)
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.number=0
        self.color_id=0
        super.init(coder: aDecoder)
    }
}

