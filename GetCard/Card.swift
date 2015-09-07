//
//  Card.swift
//  GetCard
//
//  Created by wuchengfeng on 15/6/15.
//  Copyright (c) 2015年 wuchengfeng. All rights reserved.
//

import Foundation
import SpriteKit
class  Card {
    var Cvalue:Int = 0
    var Cname:String = ""
    var Cgroup:String = ""
    var Cimage:String = ""
    var CChoseIndex:Int = 0
    var Cnode:SKNode = SKSpriteNode()
    /*有名字就能初始化
*/
    init(name:String){
        Cname = name
    }
}

