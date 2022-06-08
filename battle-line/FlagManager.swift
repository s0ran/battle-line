//
//  FlagManager.swift
//  battle-line
//
//  Created by s0ran on 2022/06/04.
//

import Foundation
import SpriteKit



enum GameResult{
    case enemywin
    case playerwin
    case pending
}

final internal class Flag:SKShapeNode{
    enum FlagState{
        case mine
        case yours
        case unowned
    }
    var state:FlagState = .unowned
    init(_ id:Int,circleOfRadius: CGFloat){
        super.init()
        let diameter = circleOfRadius * 2
        self.fillColor=SKColor.red
        let diff=sceneSize!.width/11
        self.position=CGPoint(x:CGFloat(id+1)*diff-sceneSize!.width/2,y:0)
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint.zero, size: CGSize(width: diameter, height: diameter)), transform:nil)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final internal class FlagManager:SKNode{
    var flags: Array<Flag>
    private override init(){
        self.flags=(0..<9).map{Flag($0,circleOfRadius: 15);}
        super.init()
        print("flagman frame", self.frame)
        for flag in self.flags {
            self.addChild(flag)
        }
        //flag.fillColor=SKColor.red
        
        //self.addChild(flag)
    }
    
    internal static func create()->FlagManager{
        return FlagManager()
    }
    
    func checkResult()->GameResult{
        var minecount=0
        var yourscount=0
        var consmine=0
        var consyours=0
        for flag in self.flags{
            switch flag.state{
            case Flag.FlagState.unowned:
                consmine=0
                consyours=0
            case Flag.FlagState.mine:
                minecount+=1
                if consyours==0{
                    consmine+=1
                }
            case Flag.FlagState.yours:
                yourscount+=1
                if consmine==0{
                    consyours+=1
                }
            }
            if consmine==3{
                return GameResult.playerwin
            }
            if consyours==3{
                return GameResult.enemywin
            }
        }
        if minecount==5{
            return GameResult.playerwin
        }
        if yourscount==5{
            return GameResult.enemywin
        }
        return GameResult.pending
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
