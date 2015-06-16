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
    //产生范围内的随机整数
    func randomIn(#min: Int, max: Int) -> Int {    return Int(arc4random()) % (max - min + 1) + min}
    
    //返回一张新卡
    private func getNewCard()->Card{
        
        let CardDeckCount = CCardDeck.count
        
        var randomForGetCard = randomIn(min: 0, max: CardDeckCount-1)
        
        var newCard:Card=Card(name: CCardDeck[randomForGetCard])
    
        return newCard
    }
    
    //点击抽卡
    func funcGetNewCard()->Card{
        let newCard = getNewCard()
        println("你获得了一张\(newCard.Cname)")

        return newCard
    }
    
}