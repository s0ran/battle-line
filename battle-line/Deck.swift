//
//  Deck.swift
//  battle-line
//
//  Created by s0ran on 2022/05/28.
//

import Foundation
import SpriteKit

class NumberDeck:SKSpriteNode{
    var nextCards: Array<(Int,Int)>
    init(){
        self.nextCards=[]
        for i in 0...5{
            for j in 1...10{
                self.nextCards.append((i,j))
            }
        }
        self.nextCards.shuffle()
        super.init(texture:SKTexture(),color:.systemRed,size:CGSize(width:50, height:70))
        self.position=CGPoint(x:-200,y:0)
        let cardBack=SKShapeNode(rectOf: CGSize(width: 50, height: 70))
        cardBack.fillColor=SKColor.red
        self.addChild(cardBack)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nextCards=[]
        for i in 0...6{
            for j in 1...11{
                self.nextCards.append((i,j))
            }
        }
        super.init(coder: aDecoder)
    }
    
    func next() -> (Int,Int)?{
        return self.nextCards.popLast()
    }
}
