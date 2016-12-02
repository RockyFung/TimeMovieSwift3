//
//  NewsView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class NewsView: UIView {

    
    //表视图
    var newsTableView:UITableView?
    
    //数据源，赋值完成后调用
    var dataList:[NewsModel]?{
        didSet{
            
            newsTableView?.reloadData()
            
        }
    }
    
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        //创建表视图
        createTableView()
    }
    
    
    //加载表视图
    func createTableView() -> Void {
        
        newsTableView = UITableView(frame: bounds)
        newsTableView?.delegate = self
        newsTableView?.dataSource = self
        newsTableView?.backgroundColor = UIColor.clear
        
        addSubview(newsTableView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension NewsView:UITableViewDelegate,UITableViewDataSource{
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = dataList?[indexPath.row]
        if model?.type == 1 {
            return 150
        }else{
            return 160
        }
        
    }
    
    //每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataList?.count)!
        
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = dataList?[indexPath.row]
        var cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as? NewsCell
        var cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2") as? NewsCell
        
        if model?.type == 1 {
            
            //返回cell2
            if cell2 == nil {
                cell2 = Bundle.main.loadNibNamed("NewsCell", owner: nil, options: nil)![1] as? NewsCell
            }
            cell2?.model = model
            cell2?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell2!
            
        } else {
            
            //返回cell1
            if cell1 == nil {
                cell1 = Bundle.main.loadNibNamed("NewsCell", owner: nil, options: nil)![0] as? NewsCell
            }
            cell1?.model = model
            cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell1!
            
        }
        
    }
    
}





