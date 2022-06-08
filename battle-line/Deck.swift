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
        super.init(texture:SKTexture(),color:.systemRed,size:cardSize!)
        self.isUserInteractionEnabled  = true
        //self.position=CGPoint(x:-200,y:0)
        let cardBack=SKShapeNode(rectOf: cardSize!)
        cardBack.fillColor=SKColor.red
        self.addChild(cardBack)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func next() -> (Int,Int)?{
        //print("called")
        return self.nextCards.popLast()
    }
    func touchUp(atPoint pos : CGPoint) {
        print("touched")
        _ = next()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
            print(t)
        }
    }
}

class StorategyDeck:SKSpriteNode{
    var nextCards: Array<Int>
    init(){
        self.nextCards=[]
        for i in 0...5{
            self.nextCards.append(i)
        }
        self.nextCards.shuffle()
        super.init(texture:SKTexture(),color:.systemRed,size:cardSize!)
        //self.position=CGPoint(x:-220,y:0)
        self.isUserInteractionEnabled  = true
        let cardBack=SKShapeNode(rectOf: cardSize!)
        cardBack.fillColor=SKColor.red
        self.addChild(cardBack)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func next() -> Int?{
        return self.nextCards.popLast()
    }
    func touchUp(atPoint pos : CGPoint) {
        _ = next()
        print("touched")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
            print(t)
        }
    }
}

