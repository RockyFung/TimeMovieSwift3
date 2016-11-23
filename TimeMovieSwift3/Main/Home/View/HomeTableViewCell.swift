//
//  HomeTableViewCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 2016/11/23.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var ratingLabel: UILabel!

    // 赋值完成后调用
    var homeModel:HomeModel?{
        didSet{
            titleLabel.text = homeModel?.titleCn
            imgView.kf.setImage(with: URL(string:(homeModel?.img)!))
            // 可选绑定
            guard var ratingFinal = homeModel?.ratingFinal else {
                return
            }
            
            if ratingFinal.floatValue <= 0 {
                ratingFinal = 0
            }
            
            // 富文本属性
            let aStr = NSMutableAttributedString(string:String(format:"%.1f", [ratingFinal.floatValue]))
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location:2, length:1))
            
            ratingLabel.attributedText = aStr
            ratingView.rating = CGFloat(ratingFinal.floatValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
