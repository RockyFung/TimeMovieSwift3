//
//  StoreViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController {

    // 表视图
    var cinemaTableView:UITableView?
    
    //筛选视图
    var bottomView:BottomView?
    
    lazy var dataList:[CinemaModel] = {
       return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        creatSegmentView()
        creatTableView()
        createBottomView()
    }

    
    // 加载数据
    func loadData(){
        weak var weakSelf = self
        CinemaViewModel().loadCinemaData { (data) in
            weakSelf?.dataList = data
        }
    }
    
    // segment
    func creatSegmentView(){
        let segmentView = SegmentView(frame:CGRect(x:0,y:0,width:KScreen_W,height:50))
        segmentView.titleArray = ["全部","附近","价格","筛选"]
        segmentView.selectImageName = "icon_slider_min"
        view.addSubview(segmentView)
        
        // 按钮点击
        weak var weakSelf = self
        segmentView.selectAction { (index) in
            //首先还原底部筛选视图
            weakSelf!.moveBottomView(pop: false)
            
            switch index{
                case 0:
                    weakSelf?.loadData()
                case 1:
                    // 位置排序
                    CinemaViewModel().loadDataWithAddress(data: { (data) in
                        weakSelf?.dataList = data
                    })
                case 2:
                    // 价格排序
                    CinemaViewModel().loadDataWithPrice(data: { (data) in
                        weakSelf?.dataList = data
                    })
                case 3:
                     // 弹出底部筛选图
                    weakSelf!.moveBottomView(pop: true)
                
                default:
                print("")
            }
            weakSelf?.cinemaTableView?.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            weakSelf!.cinemaTableView?.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
        }
        
    }
    
    func creatTableView(){
        cinemaTableView = UITableView(frame:CGRect(x:0, y:50, width:KScreen_W, height:Kscreen_H - 64 - 49),style:UITableViewStyle.plain)
        cinemaTableView?.backgroundColor = UIColor.clear
        cinemaTableView?.rowHeight = 150
        cinemaTableView?.delegate = self
        cinemaTableView?.dataSource = self
        view.addSubview(cinemaTableView!)
    }
    
    
    //筛选视图
    func createBottomView() -> Void {
        
        bottomView = BottomView(frame: CGRect(x: 0, y: Kscreen_H+150, width: KScreen_W, height: 400))
        view.addSubview(bottomView!)
        
    }
    
    //弹出/隐藏筛选
    func moveBottomView(pop: Bool) -> Void {
        
        let transfrom = pop ? CGAffineTransform(translationX: 0, y: -500-113) : CGAffineTransform.identity
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) {
            weakSelf!.bottomView?.transform = transfrom
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension StoreViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cinemacell") as? CinemaCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("CinemaCell", owner: nil, options: nil)![0] as? CinemaCell
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.model = dataList[indexPath.row]
        
        return cell!
    }
    
    // 结束显示
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //遍历所有子视图，还原所有更改
        for view in cell.contentView.subviews {
            if view is UIImageView {
                view.transform = CGAffineTransform.identity
                view.isHidden = false
            }
        }
    }
    
    
}







