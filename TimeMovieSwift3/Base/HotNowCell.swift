//
//  HotNowCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/25.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class HotNowCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!

    var model:HotModel?{
        didSet{
            // 图片
            movieImageView.kf.setImage(with: URL(string:(model?.img)!))
            
            // 标题
            titleLabel.text = model?.t
            
            // 评价
            if model?.commonSpecial == "" {
                let str = NSMutableAttributedString(string: "\((model?.wantedCount)!)人在期待上映")
                str.setAttributes([NSForegroundColorAttributeName:UIColor.orange], range: NSRange(location: 0, length: str.length-6))
                str.setAttributes([NSForegroundColorAttributeName:UIColor.green], range: NSRange(location: str.length-6, length: 6))
                comment.attributedText = str
            }else{
                comment.text = model?.commonSpecial
            }
            
            // 日期 "rd": "20150619"
            let date = (model?.rd)! as NSString
            let day = date.substring(from:6)
            let mon = date.substring(with: NSRange(location:4, length:2))
            time.text = "\(mon)月\(day)日"
            
            // 数量
            count.text = "今日\((model?.nearestCinemaCount)!)家影院\((model?.nearestShowtimeCount)!)场"
            
            //评分
            if (model?.r?.floatValue)! <= 0.0 {
                model?.r = 0
            }
            let rStr = NSMutableAttributedString(string: String.init(format: "%.1f", arguments: [(model?.r?.floatValue)!]))
            rStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 22)], range: NSRange(location: 0, length: 1))
            rating.attributedText = rStr
            
            // 屏幕
            if (model?.isIMAX?.boolValue)! {
                image1.image = UIImage(named: "icon_hot_show_IMAX")
            }
            if (model?.isIMAX3D?.boolValue)! {
                image1.image = UIImage(named: "icon_hot_show_IMAX3D")
            }
            if image1.image == nil {
                if (model?.isDMAX?.boolValue)! {
                    image1.image = UIImage(named: "icon_hot_show_DMAX")
                }
            }else if image1.image != nil {
                if (model?.isDMAX?.boolValue)! {
                    image2.image = UIImage(named: "icon_hot_show_DMAX")
                }
            }

            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func butTicketAction(_ sender: AnyObject) {
        print("点击购票")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
