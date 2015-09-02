//
//  AllData.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/16.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
import SpriteKit

//屏幕分辨率
let CScreenSize = CGSizeMake(UIScreen.mainScreen().bounds.width * UIScreen.mainScreen().scale,UIScreen.mainScreen().bounds.height * UIScreen.mainScreen().scale)

let CScreenFrame = UIScreen.mainScreen().bounds
//空位字符串
let NoCard:String = "NoCard"



//边条一半的宽度
let CLineWith:CGFloat = 15.5 * 1.65

//第一个卡位置中心
let p1 = CGPoint(x: ((CScreenSize.width/2 + CLineWith)/2 + CLineWith)/2, y: (CScreenSize.height/2 + CScreenSize.height - CLineWith)/2)

//第二个卡位置中心
let p2 = CGPoint(x: p1.x + ((CScreenSize.width/2 + CLineWith)/2 + CLineWith) - CLineWith*2, y: p1.y)

//第三个卡位置中心
let p3 = CGPoint(x: p2.x + ((CScreenSize.width/2 + CLineWith)/2 + CLineWith) - CLineWith*2, y: p1.y)

//第四个卡位置中心
let p4 = CGPoint(x: p3.x + ((CScreenSize.width/2 + CLineWith)/2 + CLineWith) - CLineWith*2, y: p1.y)

//第五个卡位置中心
let p5 = CGPoint(x: p1.x , y: (CScreenSize.height/2 + CLineWith)/2)

//第六个卡位置中心
let p6 = CGPoint(x: p2.x , y: p5.y)

//第七个卡位置中心
let p7 = CGPoint(x: p3.x , y: p5.y)

//第八个卡位置中心
let p8 = CGPoint(x: p4.x , y: p5.y)


//当前界面卡位置内容容器
var CCardPlaceName = [String](count: 8, repeatedValue: "uninit")

//所有卡位置中心容器
let CCardPlacePoint:[CGPoint] = [p1,p2,p3,p4,p5,p6,p7,p8]

