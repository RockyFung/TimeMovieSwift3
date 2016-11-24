//
//  PosterCollectionViewCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class PosterCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView?
    var detailView:PosterDetailView?
    var isLeft:Bool = false
    
    // 赋值完后调用
    var model:HomeModel?{
        didSet{
            imageView?.kf.setImage(with: URL(string:(model?.img)!))
            detailView?.model = model
        }
    }
    
    
    // 自动复用池复用时调用此方法
    override init(frame:CGRect){
        super.init(frame:frame)
        layoutIfNeeded()
        // 加载子视图
        imageView = UIImageView(frame:bounds)
        addSubview(imageView!)
        
        detailView = Bundle.main.loadNibNamed("PosterDetailView", owner: nil, options: nil)?[0] as? PosterDetailView
        detailView?.frame = bounds
        detailView?.isHidden = true
        addSubview(detailView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 此方法用于还原单元格，防止复用时出错
    func bringImageView(){
        imageView?.isHidden = false
        detailView?.isHidden = true
        isLeft = false
    }
    
    // 翻转
    func flipView(){
        let option = isLeft ? UIViewAnimationOptions.transitionFlipFromLeft : UIViewAnimationOptions.transitionFlipFromRight
        
        //动画效果
        weak var weakSelf = self
        UIView.transition(with: self, duration: 0.3, options: option, animations: {
            
            if weakSelf!.isLeft{
                weakSelf!.imageView?.isHidden = false
                weakSelf!.detailView?.isHidden = true
            }else{
                weakSelf!.imageView?.isHidden = true
                weakSelf!.detailView?.isHidden = false
            }
            
        }) { (bool) in
            // 动画完成后
            weakSelf!.isLeft = !(weakSelf!.isLeft)
            
        }
    }
    
    
    
    
    
}
