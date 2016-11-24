//
//  PosterView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class PosterView: UIView {

    var posterCollectionView:PosterCollectionView?
    var headerView:UIImageView? // 黄色箭头的背景图
    var indexCollectionView:IndexCollectionView? // 小海报collectionView
    var coverView:UIView? // 半透明遮罩
    
    // 赋值时调用
    var dataList:[HomeModel]?{
        didSet{
            posterCollectionView?.dataList = dataList
            indexCollectionView?.dataList = dataList
        }
    }
    
    //复写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutIfNeeded()
        loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 加载子视图
    func loadSubviews(){
        // 大海报
        createCollectionView()
        
        // 小海报
        creatHeaderView()
        
        // 遮罩
        createCoverView()
        
        // 灯光
        createLight()
        
        // 滑动监听
        addObserver()
    }
    
    // 大海报
    func createCollectionView(){
        posterCollectionView = PosterCollectionView(frame:CGRect.init(x:0, y:0, width:KScreen_W, height:frame.size.height), itemwidth: KScreen_W - 150)
        addSubview(posterCollectionView!)
    }
    
    // 小海报
    func creatHeaderView(){
        headerView = UIImageView(frame: CGRect(x: 0, y: -135, width: KScreen_W, height: 155))
        headerView?.image = UIImage(named: "indexBG_home")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 5)
        headerView?.isUserInteractionEnabled = true
        addSubview(headerView!)
        
        //按钮
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: KScreen_W/2.0-100.0/2.0+3.5, y: 130, width: 100, height: 30)
        btn.addTarget(self, action: #selector(btnAction(btn:)), for: UIControlEvents.touchUpInside)
        btn.setImage(UIImage.init(named: "down_home"), for: UIControlState.normal)
        headerView?.addSubview(btn)
        
        // 小海报collectionView
        indexCollectionView = IndexCollectionView(frame:CGRect(x: 0, y: 0, width: KScreen_W, height: 135),itemwidth:100)
        headerView?.addSubview(indexCollectionView!)
    }
    
    func btnAction(btn:UIButton){
        if btn.isSelected == false {
            // 动画
            //动画
            weak var weakSelf = self
            UIView.animate(withDuration: 0.3, animations: {
                weakSelf!.coverView?.isHidden = false
                weakSelf!.headerView?.transform = CGAffineTransform(translationX: 0, y: 135)
                //按钮旋转
                btn.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            })
        }else{
            //还原
            weak var weakSelf = self
            UIView.animate(withDuration: 0.3, animations: {
                weakSelf!.coverView?.isHidden = true
                weakSelf!.headerView?.transform = CGAffineTransform.identity // 还原
                btn.transform = CGAffineTransform.identity
            })

        }
        btn.isSelected = !btn.isSelected
    }


    //灯光
    func createLight() -> Void {
        
        let lightView = UIImageView(frame: CGRect(x: 0, y: 10, width: 124, height: 240))
        lightView.image = UIImage(named: "light")
        addSubview(lightView)
        let lightView2 = UIImageView(frame: CGRect(x: KScreen_W-124.0, y: 10, width: 124, height: 240))
        lightView2.image = UIImage(named: "light")
        addSubview(lightView2)
        
    }


    // 遮罩
    func createCoverView() -> Void {
        
        coverView = UIView(frame: bounds)
        coverView?.backgroundColor = UIColor.black
        coverView?.alpha = 0.5
        coverView?.isHidden = true
        insertSubview(coverView!, belowSubview: headerView!)
        
    }
    
    //添加监听,监听滑动
    func addObserver() -> Void {
        
        //添加indexCollectionView的监听
        indexCollectionView?.addObserver(self, forKeyPath: "currentIndex", options: NSKeyValueObservingOptions.new, context: nil)
        
        //添加posterCollectionView的监听
        posterCollectionView?.addObserver(self, forKeyPath: "currentIndex", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    // 观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // 变化后的值
        let index = change?[NSKeyValueChangeKey.newKey] as! Int
        
        // 创建indexPath
        let indexPath = IndexPath(item:index, section:0)
        
        // 判断是否是currenIndex属性
        guard keyPath == "currentIndex" else {
            return
        }
        
        // 判断对象的类型
        if object is PosterCollectionView {
            //滑动到指定单元格
            indexCollectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            
        }else if object is IndexCollectionView{
            
            //滑动到指定单元格
            posterCollectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            
        }
        
    }

    // 销毁
    deinit {
        //移除观察者
        indexCollectionView?.removeObserver(self, forKeyPath: "currentIndex")
        posterCollectionView?.removeObserver(self, forKeyPath: "currentIndex")
    }
}























