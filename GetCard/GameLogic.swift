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
    func gameLogic_touchCard(tochname:SKNode)->Bool{
        switch tochname.name! {
            
        case "阳性","阴性","火","风","水","地","水晶球" :
            
            if tochname.xScale==1 && cardControll.funcFindCardWhoisChosed().count<2{
                tochname.setScale(2.0)}
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
            
        default:
            
            println("没有命名的卡片哦")
        }
        return true
    }
}