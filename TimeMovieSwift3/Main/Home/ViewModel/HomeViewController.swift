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
    var posterView:PosterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载数据
        loadData()
        // 加载视图
        creatView()
        // 导航栏视图
        creatNavBarItem()
        
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
        
        posterView = PosterView(frame:(tableView?.frame)!)
        posterView?.isHidden = true
        posterView?.dataList = dataList
        posterView?.backgroundColor = UIColor.clear
        view.addSubview(posterView!)
    }
    
    // 加载数据
    func loadData(){
        let homeViewModel = HomeViewModel()
        weak var weakSelf = self
        homeViewModel.loadMovieData { (data) in
            weakSelf?.dataList = data
        }
    }
    
    // 导航栏
    func creatNavBarItem(){
        // 右侧按钮
        let rightBtn = UIButton(type:UIButtonType.custom)
        rightBtn.frame = CGRect(x:0, y:0, width: 49, height:25)
        rightBtn.setImage(UIImage(named:"list_home"), for: UIControlState.normal)
        rightBtn.setBackgroundImage(UIImage(named:"exchange_bg_home"), for: UIControlState.normal)
        rightBtn.setImage(UIImage(named:"poster_home"), for: UIControlState.selected)
        rightBtn.setBackgroundImage(UIImage(named:"exchange_bg_home"), for: UIControlState.selected)
        rightBtn.addTarget(self, action: #selector(rightBtnAction(btn:)), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView:rightBtn)
    }
    
    // 右侧点击事件
    func rightBtnAction(btn:UIButton){
        btn.isSelected = !btn.isSelected
        
        if btn.isSelected {
            navigationController?.navigationBar.alpha = 0.5
            tableView?.isHidden = true
            posterView?.isHidden = false
            
        }else{
            navigationController?.navigationBar.alpha = 1
            tableView?.isHidden = false
            posterView?.isHidden = true
        }
        
        // 按钮翻转
        flipWithView(view: btn, isLeft: !btn.isSelected)
        // 本页面翻转
        flipWithView(view: view, isLeft: !btn.isSelected)
    }
    
    // 翻转动画
    func flipWithView(view:UIView, isLeft:Bool){
        UIView.animate(withDuration: 0.3) { 
            UIView.setAnimationTransition(isLeft ? UIViewAnimationTransition.flipFromLeft : UIViewAnimationTransition.flipFromRight, for: view, cache: true)
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






