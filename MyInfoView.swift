//
//  MyInfoView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/2.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class MyInfoView: UIView {
    
    var dataList:NSArray?
    
    var tableView:UITableView?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        creatTableView()
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(){
        dataList = NSArray(contentsOfFile:Bundle.main.path(forResource: "MyInfoDataList", ofType: "plist")!)
        tableView?.reloadData()
    }

    func creatTableView(){
        tableView = UITableView(frame:bounds, style:UITableViewStyle.grouped)
//        tableView?.backgroundColor = UIColor.clear
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.sectionHeaderHeight = 30
        addSubview(tableView!)
    }
}


extension MyInfoView:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (dataList?.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (dataList![section] as! NSArray).count
  
    }
    
    //组头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        view.backgroundColor = UIColor.gray
        
        return view
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1")
        var cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")
        
        if indexPath.section == 0 {
            
            //数据
            let array = dataList?[indexPath.section] as? NSArray
            let dic = array![indexPath.row] as? NSDictionary
            if cell1 == nil {
                cell1 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
                cell1?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            cell1?.textLabel?.text = dic?.object(forKey: "title") as? String
            cell1?.imageView?.image = UIImage(named: (dic?.object(forKey: "image") as? String)!)
            
            return cell1!
            
        }else {
            
            let array = dataList?[indexPath.section] as? NSArray
            if cell2 == nil {
                cell2 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell2")
                cell2?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            cell2?.textLabel?.text = array?[indexPath.row] as? String
            
            return cell2!
            
        }

    }
}








