//
//  GameScene.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/15.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let cardControll=CardController()
    let dataControll=dataController()
    let gamelogic = gameLogic()
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //所有的卡牌数据初始
        
        var CardName=["阳性","阴性","火","风","水","地","水晶球"]//所有的卡牌名称
        for i in 0...(CardName.count-1) {
            //绑定到卡组中
            CCardDeck.append(Card(name:CardName[i]))
            
        }
        
    
       
        
        //读取存储的卡组信息
        dataControll.loadCardDeckDatas()
        dataControll.loadPlayerDatas()
        
        //展示所有的卡组内容
        cardControll.funcShowCardInfo(CCardDeck)
        cardControll.funcShowCardInfo(CPlayerCardData)
        
        println(self.size)//展示一下当前设备的尺寸
        var point1=CGPointMake(80, self.size.height-40)
        
        for item in CPlayerCardData{
            var label=SKLabelNode(text: item.Cname)
            label.position=point1
            point1=CGPointMake(point1.x, point1.y-30)
            label.name = item.Cname
            item.Cnode = label
            
            self.addChild(label)
        }
        
        /*
        for i in 0...7{
            let CardPlace = SKSpriteNode(imageNamed: "卡牌.png")
            //CardPlace.setScale(1.65)
            CardPlace.position = CCardPlacePoint[i]
            CardPlace.name = "CardPlace"
            
            backgroud.addChild(CardPlace)
        }
        */
        
      
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       
                /* Called when a touch begins*/

        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let tochname = nodeAtPoint(location)
            
            if tochname.frame == self.frame{
                cardControll.funcShowCardChose(CPlayerCardData)
                cardControll.getNewCard()
                dataControll.savePlayerDatas()
            }
            else{
                println(location)
            gamelogic.gameLogic_touchCard(tochname)
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
        
        cardControll.funcShowCardInfo(CPlayerCardData)
        

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
