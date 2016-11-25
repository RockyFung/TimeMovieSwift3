//
//  PayTicketViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class PayTicketViewController: BaseViewController {

    var tableView1:UITableView?
    var tableView2:UITableView?
    
    //正在热映数据源，懒加载
    lazy var hotNowData: [HotModel] = {
        return []
    }()
    
    //即将上映表头数据源
    lazy var willHeadData: [WillModel] = {
        return []
    }()
    
    //即将上映数据
    lazy var willDataDic: [String:[WillModel]] = {
        return [:]
    }()
    //即将上映数据个数
    var willDataCount: Int = 0
    
    //即将上映数据keys
    lazy var willDataDicKeys: [String] = {
        return []
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
        
        // 加载数据
        loadData()
    }

    // 加载数据
    func loadData(){
        PayTicketViewModel().hotNowData { (data) in
            hotNowData = data
        }
        
        PayTicketViewModel().willNewData(headData: { (headData) in
            willHeadData = headData
            }, bodyData: { (bodyData, count) in
                willDataDic = bodyData
                willDataCount = count
            }) { (keys) in
                willDataDicKeys = keys
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
