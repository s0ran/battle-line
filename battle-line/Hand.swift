//
//  Hand.swift
//  battle-line
//
//  Created by s0ran on 2022/06/08.
//

import Foundation
import SpriteKit


class Hand:SKSpriteNode{
    var hands:Array<NumberCard>=[]
    
    init(_ deck:NumberDeck){
        super.init(texture:SKTexture(),color:.systemRed,size:cardSize!)
        var num_cards=0
        while num_cards<7 {
            let next:(Int,Int) = deck.next()!
            print(next)
            self.hands.append(NumberCard(next.0,next.1))
            num_cards+=1
        }
        self.isUserInteractionEnabled  = true
        paint()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func paint(){
        for (i,card) in self.hands.enumerated(){
            print(card.state)
            card.state = .face
            print(card.state)
            card.position=CGPoint(x:CGFloat(i-3)*cardSize!.width, y:0)
            print(card.position)
            self.addChild(card)
        }
    }
}
