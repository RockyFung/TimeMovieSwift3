//
//  BottomView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class BottomView: UIView {

    //集合视图
    var collectionView:UICollectionView?
    //地铁页面
    var busImageView:UIImageView?
    
    //数据源数组，懒加载
    lazy var dataList: [String] = {
        return []
    }()

    override init(frame:CGRect){
        super.init(frame: frame)
        dataList = ["全部","IMAX厅","中国巨幕","4K放映厅","3D厅","杜比全景声","情侣座","停车场","WI-FI"]
        self.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
        loadSegmentView()
        createCollectionView()
        createImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 分页按钮
    func loadSegmentView(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: KScreen_W, height: 50))
        view.backgroundColor = UIColor(patternImage: UIImage(named: "tab_bg_all@2x")!)
        let segmentView = SegmentView(frame: CGRect(x: 50, y: 0, width: KScreen_W - 100, height: 50))
        segmentView.titleArray = ["特色","商圈","地区","地铁"]
        segmentView.selectImageName = "icon_slider_min@2x"
        view.addSubview(segmentView)
        
        //点击事件
        weak var weakSelf = self
        segmentView.selectAction { (index) in
            switch index{
            case 0:
                weakSelf!.dataList = ["全部","IMAX厅","中国巨幕","4K放映厅","3D厅","杜比全景声","情侣座","停车场","WI-FI"]
                weakSelf!.collectionView?.isHidden = false
                weakSelf!.busImageView?.isHidden = true
            case 1:
                weakSelf!.dataList = ["全部","美食广场","恒隆广场"]
                weakSelf!.collectionView?.isHidden = false
                weakSelf!.busImageView?.isHidden = true
            case 2:
                weakSelf!.dataList = ["全部","历下区","市中区","槐荫区","天桥区","商河区","历城区","长清区"]
                weakSelf!.collectionView?.isHidden = false
                weakSelf!.busImageView?.isHidden = true
            case 3:
                weakSelf!.collectionView?.isHidden = true
                weakSelf!.busImageView?.isHidden = false
            default:
                print("")
            }
            weakSelf!.collectionView?.reloadData()
        }
        
        //关闭按钮
        let closeButton = UIButton(frame: CGRect(x: KScreen_W-50, y: 0, width: 50, height: 50))
        closeButton.setBackgroundImage(UIImage.init(named: "pic_ico_wrong"), for: UIControlState.normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction(button:)), for: UIControlEvents.touchUpInside)
        view.addSubview(closeButton)
        
        addSubview(view)
    }
    
    //关闭按钮点击事件
    func closeButtonAction(button: UIButton) -> Void {
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) {
            weakSelf!.transform = CGAffineTransform.identity
        }
    }
    
    
    //集合视图
    func createCollectionView() -> Void {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 50, width: bounds.size.width, height: bounds.size.height-50), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        //注册单元格
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        addSubview(collectionView!)
        
    }
    
    //地铁视图
    func createImageView() -> Void {
        
        busImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: bounds.size.width, height: bounds.size.height-50))
        busImageView?.image = UIImage(named: "bus")
        busImageView?.isHidden = true
        addSubview(busImageView!)
        
    }

    
    
    
    
}

extension BottomView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //每组单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataList.count
        
    }
    
    //单元格
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        //防止复用出错
        for view in cell.contentView.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
        let label = UILabel(frame: cell.bounds)
        label.text = dataList[indexPath.item]
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        cell.contentView.addSubview(label)
        
        return cell
        
    }
    
    //单元格与边缘距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 50, left: 25, bottom: 0, right: 25)
        
    }
}











































