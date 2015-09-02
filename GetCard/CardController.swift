//
//  CardController.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/15.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
import SpriteKit
class CardController {
    /*产生范围内随机数的函数
    */
    func randomIn(#min: Int, max: Int) -> Int {return Int(arc4random()) % (max - min + 1) + min}
    
    
    /*获取新卡片逻辑：
    1、从标准卡组中读取卡组长度
    2、在长度范围内选择随机数，抽出数字
    3、返回对应数字的卡片对象
    */
    func getNewCard(){
        
        let CardDeckCount = CCardDeck.count
        
        var randomForGetCard = randomIn(min: 0, max: CardDeckCount-1)
        
        var newCard:Card=Card(name: CCardDeck[randomForGetCard].Cname)
        
        CPlayerCardData.append(newCard)
        
    }
    
    //点击抽卡
    func funcComCard(){
        
        //CPlayerCardData.append(Card(name:CardName[i]))
    }
    
    /*展示卡组内卡片名称的方法
    */
    func funcShowCardInfo(cardSet:[Card]){
        println("卡组内容包括：")
        for item in cardSet{ println(item.Cname)}
        println("************************")
    }
    
}