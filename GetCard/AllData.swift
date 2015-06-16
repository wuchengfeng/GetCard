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

//玩家卡牌数据
var CPlayerCardData = [String]()

//所有卡牌数据
var CCardDeck = [String]()

//边条一半的宽度
let CLineWith:CGFloat = 15.5 * 1.65

//第一个卡位置中心
let p1 = CGPoint(x: ((CScreenSize.width/2 + CLineWith)/2 + CLineWith)/2, y: (CScreenSize.height/2 + CScreenSize.height - CLineWith)/2)


//数据控制器
class dataController {
 
    //获取沙盒地址
    func documentsDirectory()->String{
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentsDirectory:String = paths.first as! String
        return documentsDirectory
    }
    
    //返回文件地址
    func dataFilePath(type:String)->String{
        switch type{
            case "PlayerData":
            return self.documentsDirectory().stringByAppendingString("PlayerDatas.plist")
            
            case "CardDeckData":
            return self.documentsDirectory().stringByAppendingString("CardDeckDatas.plist")
            
        default :
            println("no this type")
            return "no such file"
        }
        
    }
    
    //读取玩家卡牌数据
    func loadPlayerDatas(){
        let path = self.dataFilePath("PlayerData")
        let defaultManager = NSFileManager()
        if defaultManager.fileExistsAtPath(path){
            let data = NSData(contentsOfFile: path)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            CPlayerCardData = unarchiver.decodeObjectForKey("PlayerDatas") as! Array
            unarchiver.finishDecoding()
        }else {
        savePlayerDatas()
        }
    }
    
    //保存玩家卡牌数据
    func savePlayerDatas(){
        var data = NSMutableData()
        var archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(CPlayerCardData, forKey: "PlayerDatas")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath("PlayerData"), atomically: true)
    }
    
    //读取所有卡牌数据
    func loadCardDeckDatas(){
        let path = self.dataFilePath("CardDeckData")
        let defaultManager = NSFileManager()
        if defaultManager.fileExistsAtPath(path){
            let data = NSData(contentsOfFile: path)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            CCardDeck = unarchiver.decodeObjectForKey("CardDeckData") as! Array
            unarchiver.finishDecoding()
        }else {
            savePlayerDatas()
        }
    }
    
    //保存到所有卡牌数据
    func saveCardDeckDatas(){
        var data = NSMutableData()
        var archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(CCardDeck, forKey: "CardDeckData")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath("CardDeckData"), atomically: true)
    }
}