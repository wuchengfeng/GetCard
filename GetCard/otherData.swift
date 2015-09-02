//
//  otherData.swift
//  GetCard
//
//  Created by wuchengfeng on 15/9/2.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
//玩家卡牌数据，当前玩家持有的卡牌数据缓存
var CPlayerCardData = [Card]()

//所有卡牌数据.也可以叫做图鉴哦
var CCardDeck = [Card]()
//所有卡牌名字索引


//存档用的文件名称.玩家数据存档
let CStringPlayerDatasPlist:NSString="PlayerDatas.plist"

//存档用的文件名称.图鉴数据存档
let CStringCardDeckDatasPlist:NSString="CardDeckDatas.plist"

//选中的卡片容器
var CChoesCards = [Card]()