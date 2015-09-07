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
    func funcShowCardChose(cardSet:[Card]){
        println("卡组中卡片被选择情况")
        for item in cardSet{ println(item.CChoseIndex)}
        println("************************")
    }
    /* 查找对应的node指代的是哪一张卡片
        1、找到卡片，返回在玩家卡组中的序列
        2、未找到卡片，返回-1 并打印信息
    */
    func funcFindCardWithNode(sknode:SKNode)->Int{
        for (index, value) in enumerate(CPlayerCardData) {
            if value.Cnode == sknode {
                println("找到了指代的卡片它是第\(index+1)张")
                return index}
        }
        println("没有找到对应的卡片")
        return -1
    }
    /* 读取出被选中的卡牌 数据，返回一个序列*/
    func funcFindCardWhoisChosed()->[Int]{
        var count = 0
        var choseNum = [Int]()
        for (index, value) in enumerate(CPlayerCardData)
        {
            if value.CChoseIndex == 1
            {
                count++
                choseNum.append(index)
            }
        }
        
        return choseNum
    }
    
    func funcShowTheChoseInfo(choseNum:[Int])->Bool{
        if choseNum.isEmpty {
            println("没有卡牌被选中")
            
        }
        else
        {
            for i in choseNum {
                println("第\(i+1)张卡片被选中了")
            }
            println("一共有\(choseNum.count)张卡片被选中了")
        }
        if choseNum.count <= 1 {
            return true
        }
        else {return false}
    }
    
    
    
}