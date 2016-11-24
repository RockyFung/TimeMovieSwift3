//
//  IndexCollectionView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class IndexCollectionView: BaseCollectionView {

    //复写初始化方法
    override init(frame: CGRect, itemwidth: CGFloat) {
        super.init(frame: frame, itemwidth: itemwidth)
        
        //注册单元格
        register(IndexCell.classForCoder(), forCellWithReuseIdentifier: "IndexCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //复写返回单元格的方法
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let indexCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IndexCell", for: indexPath) as? IndexCell
        indexCell?.model = dataList?[indexPath.item]
        
        return indexCell!
    }

}














