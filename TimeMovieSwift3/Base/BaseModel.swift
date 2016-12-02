//
//  BaseModel.swift
//  TimeMovieSwift3
//
//  Created by rocky on 2016/11/23.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    // 自定义构造方法
    init(dic:[String:Any]) {
        super.init()
        setAttribut(dic: dic)
    }
    
    func setAttribut(dic:[String:Any]){
        let attributDic = attributesDic(dic: dic)
        
        // runtime 获取本类属性
        var count:UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        for i in 0..<count {
            // 取出属性名
            let ivar = ivars?[Int(i)]
            let ivarName = ivar_getName(ivar!)
            let nName = String(cString:ivarName!)
            
            // 取出要赋值的值
            var attribut = attributDic[nName]
            if attribut == nil{
                attribut = ""
            }
            
            var value:NSObject
            if dic[attribut!] != nil {
                value = dic[attribut!] as! NSObject
            }else{
                value = "" as NSObject
            }
            
            // 利用KVC给本类属性赋值
            self.setValue(value, forKey: nName)
            
        }
        
    }
    
    // 如果属性名与数据字典的key值不对应，那么在子类model中复写此方法，将属性名作为key，字典key作为value
    func attributesDic(dic:[String:Any]) -> [String:String]{
        var newDic:[String:String] = [:]
        for key in dic.keys {
            // 复写时注意将属性名作为key，数据字典的key作为value
            newDic[key] = key
        }
        return newDic
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
