//
//  WillMovieCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/25.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class WillMovieCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!

    
    var model:WillModel?{
        didSet{
            // 左侧时间
            time.text = "\((model?.rDay)!)日"
            
            // 图片
            movieImage.kf.setImage(with: URL(string: (model?.image)!))
            
            // 电影名称
            title.text = model?.title
            
            // 电影类型
            type.text = model?.type
            
            //想看人数
            let aStr = NSMutableAttributedString(string: "\((model?.wantedCount)!)人在期待上映")
            aStr.setAttributes([NSForegroundColorAttributeName:UIColor.orange], range: NSRange(location: 0, length: aStr.length-6))
            aStr.setAttributes([NSForegroundColorAttributeName:UIColor.blue], range: NSRange(location: aStr.length-6, length: 6))
            count.attributedText = aStr
            count.adjustsFontSizeToFitWidth = true
            
            // 导演
            director.text = model?.director
            
            // 预告片按钮
            button2.layer.cornerRadius = 10
            button2.layer.borderWidth = 2
            button2.layer.borderColor = UIColor.gray.cgColor
            button2.clipsToBounds = true
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
