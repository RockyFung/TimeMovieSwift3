//
//  PayTicketViewModel.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/25.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class PayTicketViewModel: NSObject {
    // 正在热映数据
    func hotNowData(data:([HotModel])->()){
        var dataArray:[HotModel] = [];
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "buy_now")
        // 可选绑定
        guard let dictionary = dataDic else {
            return
        }
        let array = dictionary["ms"] as! [[String:Any]]
        for dic in array {
            let model = HotModel(dic:dic)
            dataArray.append(model)
        }
        data(dataArray)
    }
    
    // 即将上映数据
    func willNewData(headData:([WillModel])->(),bodyData:([String:[WillModel]],Int)->(), bodyKeys:([String])->()){
        var dataArray:[WillModel] = []
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "buy_new")
        
        guard let dictionary = dataDic else {
            return
        }
        
        let array1 = dictionary["attention"] as! [[String:Any]]
        let array2 = dictionary["moviecomings"] as! [[String:Any]]
        
        // 头部视图数据
        for dic in array1 {
            let model = WillModel(dic:dic)
            dataArray.append(model)
        }
        headData(dataArray)
        
        // 表视图
        // 新建字典key：月份，value：WillModel
        var bodyDataDic:[String:[WillModel]] = [:]
        for dic in array2 {
            let model = WillModel(dic:dic)
            
            // 取出月份
            let month = String(format:"%d",(model.rMonth?.intValue)!)
            
            // 取出月份对应的数组
            var modelArray = bodyDataDic[month]
            
            if modelArray == nil {
                // 如果该数组为空则新建数组并添加model，再添加到字典中
                var newModelArray:[WillModel] = []
                newModelArray.append(model)
                bodyDataDic[month] = newModelArray
            }else{
                // 如果不为空，则把model添加到改数组中，再添加到字典中
                modelArray?.append(model)
                bodyDataDic[month] = modelArray
            }
        }
        
        bodyData(bodyDataDic,array2.count)
        
        let arr = Array(bodyDataDic.keys)
        let keysArray = arr.sorted()
        bodyKeys(keysArray)
    }
}



















