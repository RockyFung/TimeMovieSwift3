//
//  HomeViewModel.swift
//  TimeMovieSwift3
//
//  Created by rocky on 2016/11/23.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    // 首页电影列表数据
    func loadMovieData(sucess:@escaping ([HomeModel]) ->()){
        // 加载json文件
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "home_header")
        guard dataDic != nil else {
            return
        }
        
        let array = dataDic?["movies"] as? NSArray
        guard array != nil else {
            return
        }
        var dataList:[HomeModel] = []
        for dic in array! {
            let model:HomeModel = HomeModel(dic:dic as! [String:Any])
            dataList.append(model)
        }
        sucess(dataList)
    }
}
