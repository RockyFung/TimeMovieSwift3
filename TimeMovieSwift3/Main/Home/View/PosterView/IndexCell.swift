//
//  IndexCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class IndexCell: UICollectionViewCell {
    var imageView:UIImageView?
    var model:HomeModel?{
        didSet{
            imageView?.kf.setImage(with: URL(string: (model?.img)!))
        }
    }
    
    //复用时会调用此方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: bounds)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        addSubview(imageView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
