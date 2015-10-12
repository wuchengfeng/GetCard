//
//  DataController.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/17.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
import SpriteKit
//数据控制器
class dataController {
    
    //获取沙盒地址
    func documentsDirectory()->String{
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory:String = paths.first!
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
            print("no this type")
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
            var CPlayerCardString = [String]()
            
            CPlayerCardString = unarchiver.decodeObjectForKey("PlayerDatas") as! Array
            CPlayerCardData.removeAll(keepCapacity: false)

            for item in CPlayerCardString{
                 CPlayerCardData.append(Card(name: item))
            }
            
            unarchiver.finishDecoding()
        }else {
            savePlayerDatas()
        }
    }
    
    //保存玩家卡牌数据
    func savePlayerDatas(){
        var CPlayerCardDataString = [String]()
        
        for item in CPlayerCardData {
            CPlayerCardDataString.append(item.Cname)
        }
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(CPlayerCardDataString, forKey: "PlayerDatas")
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
            var CCardDeckString = [String]()
            CCardDeckString = unarchiver.decodeObjectForKey("CardDeckData") as! Array
            unarchiver.finishDecoding()
            CCardDeck.removeAll(keepCapacity: false)
            for item in CCardDeckString{
                CCardDeck.append(Card(name: item))
            }
        }else {
            saveCardDeckDatas()
        }
    }
    
    //保存到所有卡牌数据
    func saveCardDeckDatas(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        var CCardDeckString = [String]()
        for item in CCardDeck{
            CCardDeckString.append(item.Cname)
        }
        archiver.encodeObject(CCardDeckString, forKey: "CardDeckData")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath("CardDeckData"), atomically: true)
    }
}