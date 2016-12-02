//
//  TopListView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class TopListView: UIView {

    var tableView:UITableView?
    var dataList:[TopListModel] = []{
        didSet{
            tableView?.reloadData()
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        creatTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatTableView(){
        tableView = UITableView(frame:bounds)
        tableView?.backgroundColor = UIColor.clear
        tableView?.delegate = self
        tableView?.dataSource = self
        addSubview(tableView!)
        
        let headerView = Bundle.main.loadNibNamed("TopHeaderView", owner: nil, options: nil)?[0] as? TopHeaderView
        tableView?.tableHeaderView = headerView
    }

}

extension TopListView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TopCell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TopCell")
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell?.backgroundColor = UIColor.clear
            cell?.textLabel?.textColor = UIColor.white
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        let model = dataList[indexPath.row]
        cell?.textLabel?.text = model.topListNameCn
        return cell!
    }
    
}





