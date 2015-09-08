//
//  GameLogic.swift
//  GetCard
//
//  Created by wuchengfeng on 15/9/7.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
import SpriteKit
class gameLogic {
    var cardControll = CardController()
    var dataControll = dataController()
    func gameLogic_touchCard(tochname:SKNode,skscene:SKScene)->Bool{
        if tochname.frame == skscene.frame{
            cardControll.funcShowCardChose(CPlayerCardData)
            cardControll.getNewCard()
            dataControll.savePlayerDatas()
        }
        else{
        switch tochname.name! {
            
        case "阳性","阴性","火","风","水","地","水晶球" :
            
            if tochname.xScale==1 && cardControll.funcFindCardWhoisChosed().count<2
            {
                tochname.setScale(2.0)
            }
            else
            {
                tochname.setScale(1.0)
            }
            var cardchoseIndex = cardControll.funcFindCardWithNode(tochname)
            
            if CPlayerCardData[cardchoseIndex].CChoseIndex == 0
            {
                if cardControll.funcFindCardWhoisChosed().count<2
                {
                    CPlayerCardData[cardchoseIndex].CChoseIndex = 1
                }
                else{
                    println("已经有两张卡片被选中了，无法再选中卡片")
                }
            }
            else
            { CPlayerCardData[cardchoseIndex].CChoseIndex = 0}
            cardControll.funcShowTheChoseInfo(cardControll.funcFindCardWhoisChosed())
            
        case "BackGround" :
            
            println()
            
        case "合成" :
            if cardControll.funcFindCardWhoisChosed().count == 2
            {
                //通过选中的卡牌，删除这个卡牌，并合成一张新的
                if cardControll.funcFindCardWhoisChosed()[0] < cardControll.funcFindCardWhoisChosed()[1]{
                    var cardstring1 = CPlayerCardData[cardControll.funcFindCardWhoisChosed()[0]].Cname
                    
                CPlayerCardData.removeAtIndex(cardControll.funcFindCardWhoisChosed()[0])
                    println(cardControll.funcFindCardWhoisChosed())
                    var cardstring2 = CPlayerCardData[cardControll.funcFindCardWhoisChosed()[0]].Cname
                    
                CPlayerCardData.removeAtIndex(cardControll.funcFindCardWhoisChosed()[0])
                    cardControll.funcShowCardInfo(CPlayerCardData)
                    
                }
                else
                {
                    CPlayerCardData.removeAtIndex(cardControll.funcFindCardWhoisChosed()[0])
                    CPlayerCardData.removeAtIndex(cardControll.funcFindCardWhoisChosed()[0])
                }
                //招一个新的卡片
                cardControll.getNewCard()
                println("你合成了一张卡片，为\(CPlayerCardData)")
                dataControll.savePlayerDatas()
                skscene.removeAllChildren()
                skscene.didMoveToView(skscene.view!)
            }
            
        default:
            
            println("没有命名的卡片哦")
        }
        return true
        }
        return false
    }
}