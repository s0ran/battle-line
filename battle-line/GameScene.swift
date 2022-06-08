//
//  GameScene.swift
//  battle-line
//
//  Created by s0ran on 2022/05/23.
//

import SpriteKit
import GameplayKit
import UIKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}


var sceneSize:CGSize?
var cardSize:CGSize?


class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var deckfield : SKNode?
    private var flagfield : SKNode?
    private var myhandfield : SKNode?
    private var enemyfield : SKNode?
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        print("GameScene",self.size)
        sceneSize=self.size
        cardSize=CGSize(width:self.size.height*2/25, height:self.size.height*3/25)
        
        self.deckfield=self.childNode(withName: "//deckfield") as SKNode?
        let deck=NumberDeck()
        let storategydeck=StorategyDeck()
        
        if let deckfield=self.deckfield{
            print("deckfield", deckfield.frame)
            print(deckfield.position)
            let deckpos=CGPoint(x:-self.size.width/2,y:self.size.height/2)
            deckfield.position=deckpos
            print(deckfield.position)
            
            print("deck",deck.size)
            deck.position=CGPoint(x:60,y:-90)
            storategydeck.position=CGPoint(x:120,y:-90)
            deckfield.addChild(deck)
            deckfield.addChild(storategydeck)
        }
        
        self.flagfield=self.childNode(withName: "//flagfield") as SKNode?
        if let flagfield=self.flagfield{
            print("flagfield",flagfield.position)
            let flagmanager=FlagManager.create()
            flagfield.addChild(flagmanager)
        }
        
        //let card=NumberCard(1,1)
        //self.addChild(card)
        
        self.myhandfield=self.childNode(withName: "//myhandfield") as SKNode?
        if let myhandfield=self.myhandfield{
            myhandfield.position=CGPoint(x:0,y:-sceneSize!.height/2+cardSize!.height+20)
            print("myhandfield",myhandfield.position)
            let myhand=Hand(deck)
            myhandfield.addChild(myhand)
        }
    }
    
    
    /*func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }*/
}
