//
//  PosterDetailView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/24.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class PosterDetailView: UIView {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleCN: UILabel!
    @IBOutlet weak var titleEN: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var rating: UILabel!

    var model:HomeModel?{
        didSet{
            movieImage.kf.setImage(with: URL(string:(model?.img)!))
            titleCN.text = "片名:\((model?.titleCn)!)"
            titleEN.text = "英文名:\((model?.titleEn)!)"
            year.text = "上映时间:\((model?.rYear)!)"
            
            guard var ratingFinal = model?.ratingFinal else {
                return
            }
            if ratingFinal.floatValue <= 0{
                ratingFinal = 0
            }
            // 富文本属性
            let aStr = NSMutableAttributedString(string: String(format: "%.1f", arguments: [ratingFinal.floatValue]))
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location: 2, length: 1))
            
            rating.attributedText = aStr
            ratingView.rating = CGFloat(ratingFinal.floatValue)
            
            backgroundColor = UIColor.init(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        }
    }

}






















