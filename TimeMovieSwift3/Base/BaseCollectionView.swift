//
//  BaseCollectionView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {

    //数据数组
    var dataList:[HomeModel]?
    //单元格宽度
    var itemWidth:CGFloat?

    //被观察的属性，加dynamic关键字
    // 加了@objc标识的方法、属性无法保证都会被运行时调用，因为Swift会做静态优化。要想完全被动态调用，必须使用dynamic修饰。使用dynamic修饰将会隐式的加上@objc标识。
    //记录下标
    dynamic var currentIndex:Int = 0
    
    // 初始化
    init(frame:CGRect, itemwidth: CGFloat) {
        itemWidth = itemwidth
        // 创建layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width:itemwidth, height:400)
        super.init(frame:frame, collectionViewLayout:layout)
        self.delegate = self
        self.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}


extension BaseCollectionView:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    // 返回每组单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList!.count
    }
    
    // 返回单元格， 在子类中复写次方法
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    // 返回单元格于边缘距离(每个section边距)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, (KScreen_W - itemWidth!)/2, 0, (KScreen_W - itemWidth!)/2)
    }
    
    // 将要结束拖动
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 横向偏移量
        let xOffset = targetContentOffset.pointee.x
        
        // 计算当前下标
        var index = Int((xOffset - 10) / itemWidth!)
        if index >= (dataList?.count)! - 1{
            index = (dataList?.count)! - 1
        }
        
        // 偏移
        targetContentOffset.pointee.x = CGFloat(index) * itemWidth! + CGFloat(index * 10)
        currentIndex = index
    }
    
    //点击单元格时调用
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //单元格显示结束时调用
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}









