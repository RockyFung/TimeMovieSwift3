//
//  PosterCollectionView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class PosterCollectionView: BaseCollectionView {

    // 复写初始化方法
    override init(frame:CGRect, itemwidth:CGFloat){
        super.init(frame:frame, itemwidth:itemwidth)
        self.backgroundColor = UIColor.clear
        // 注册单元格
        register(PosterCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "PosterCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //单元格已经结束显示
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let posterCell = cell as! PosterCollectionViewCell
        posterCell.bringImageView()
        
    }
    
    //复写返回单元格方法
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:PosterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as! PosterCollectionViewCell
        cell.model = dataList?[indexPath.row]
        
        return cell
        
    }
    
    // 复写点击单元格
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 判断当前点击的单元格是否为屏幕中央
        if indexPath.item == currentIndex {
            // 通过indexPath取到单元格后，调用翻转方法
            let cell = collectionView.cellForItem(at: indexPath) as! PosterCollectionViewCell
            cell.flipView()
        }else{
            // 不是中间单元格就把这个单元格滑动到中间
            scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            currentIndex = indexPath.item
        }
    }
    
    
    
    
}
