//
//  GameScene.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/15.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //所有的卡牌数据初始
        /*
        var CardName=["阳性","阴性","火","风","水","地","水晶球"]
        for i in 0...(CardName.count-1) {
            
            CCardDeck.append(CardName[i])
            
        }
        
        */
        let cardC=dataController()
        //cardC.saveCardDeckDatas()
        cardC.loadCardDeckDatas()
        println("所有卡组内容包括\(CCardDeck)")
       
        
        
        
        
        
        
        let backgroud = SKSpriteNode(imageNamed: "卡牌框架.png")
        backgroud.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        backgroud.setScale(1.65)
        backgroud.name = "BackGround"
        self.addChild(backgroud)
        
        let CardPlace = SKSpriteNode(imageNamed: "卡牌.png")
        CardPlace.setScale(1.65)
        CardPlace.position = p1
        CardPlace.name = "CardPlace"
        self.addChild(CardPlace)
      
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let cardcontroll=CardController()
        
                /* Called when a touch begins
        */
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let tochname = nodeAtPoint(location).name!
            
            switch tochname {
                case "CardPlace":
                cardcontroll.funcGetNewCard()
            default:
                println()
            }
            
            //let sprite = SKSpriteNode(imageNamed:"Spaceship")
            /*
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        */}
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
