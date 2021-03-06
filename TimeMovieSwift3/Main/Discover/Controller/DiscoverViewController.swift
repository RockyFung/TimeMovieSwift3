//
//  DiscoverViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    //新闻视图
    var newsView:NewsView?
    //预告片
    var trailerView:TrailerView?
    //排行榜
    var topListView:TopListView?
    //评论
    var criticismView:CriticismView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "actor_detail_top_background.jpg")!)
        
        //导航栏按钮组
        createSegmentView()
        
        //创建视图
        createView()
        
    }

    
    //创建视图
    func createView() -> Void {
        
        //新闻
        createNewsView()
        
        //预告
        createTrailerView()
        
        //排行榜
        createTopListView()
        
        //影评
        createCriticismView()
        
    }

    
    //新闻
    func createNewsView() -> Void {
        
        newsView = NewsView(frame: CGRect(x: 0, y: 0, width: KScreen_W, height: Kscreen_H-50-10-50))
        //数据
        weak var weakSelf = self
        DiscoverViewModel().newsData { (data) in
            weakSelf!.newsView?.dataList = data
        }
        view.addSubview(newsView!)
        
    }
    
    //预告
    func createTrailerView() -> Void {
        
        trailerView = TrailerView(frame: CGRect(x: KScreen_W, y: 0, width: KScreen_W, height: Kscreen_H-60-50))
        weak var weakSelf = self
        DiscoverViewModel().trailersData { (data) in
            weakSelf!.trailerView?.dataList = data
        }
        view.addSubview(trailerView!)
        
    }
    
    //排行榜
    func createTopListView() -> Void {
        
        topListView = TopListView(frame: CGRect(x: 2*KScreen_W, y: 0, width: KScreen_W, height: Kscreen_H-60-50))
        weak var weakSelf = self
        DiscoverViewModel().topListData { (data) in
            weakSelf!.topListView?.dataList = data
        }
        view.addSubview(topListView!)
        
    }
    
    //影评
    func createCriticismView() -> Void {
        
        criticismView = CriticismView(frame: CGRect(x: 3*KScreen_W, y: 0, width: KScreen_W, height: Kscreen_H-60-50))
        weak var weakSelf = self
        DiscoverViewModel().criticismData { (data) in
            weakSelf!.criticismView?.dataList = data
        }
        view.addSubview(criticismView!)
        
    }
    
    //按钮组
    func createSegmentView() -> Void {
        
        let segmentView = SegmentView(frame: CGRect(x: 0, y: 0, width: KScreen_W, height: 50))
        segmentView.titleArray = ["新闻","预告片","排行榜","影评"]
        //点击方法
        weak var weakSelf = self
        segmentView.selectAction { (index) in
            weakSelf!.viewMoveAction(index: index)
        }
        navigationItem.titleView = segmentView
        
    }
    
    //切换视图方法
    func viewMoveAction(index: Int) -> Void {
        
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) {
            // index改变的时候所有的页面一起往左移动
            weakSelf!.newsView?.transform = CGAffineTransform(translationX: -KScreen_W*CGFloat(index), y: 0)
            weakSelf!.trailerView?.transform = CGAffineTransform(translationX: -KScreen_W*CGFloat(index), y: 0)
            weakSelf!.topListView?.transform = CGAffineTransform(translationX: -KScreen_W*CGFloat(index), y: 0)
            weakSelf!.criticismView?.transform = CGAffineTransform(translationX: -KScreen_W*CGFloat(index), y: 0)
            
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
