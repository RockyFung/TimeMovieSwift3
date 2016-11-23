//
//  HomeViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // 数据数组懒加载
    lazy var dataList:[HomeModel] = {
        return []
    }()
    
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载数据
        loadData()
        // 加载视图
        creatView()
        
        
    }
    
    
    // 加载视图
    func creatView(){
        tableView = UITableView(frame:CGRect(x:0, y:0, width:KScreen_W, height:Kscreen_H - 64 - 49), style:UITableViewStyle.plain)
        tableView?.backgroundColor = UIColor.clear
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.rowHeight = 110
        view.addSubview(tableView!)
    }
    
    // 加载数据
    func loadData(){
        let homeViewModel = HomeViewModel()
        weak var weakSelf = self
        homeViewModel.loadMovieData { (data) in
            weakSelf?.dataList = data
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier:"HomeTableViewCell") as? HomeTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: nil, options: nil)?[0] as? HomeTableViewCell
        }
        cell?.homeModel = dataList[indexPath.row]
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
}






