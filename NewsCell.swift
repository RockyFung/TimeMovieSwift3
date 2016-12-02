//
//  NewsCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var comment1: UILabel!

    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var comment2: UILabel!
    @IBOutlet weak var time2: UILabel!
    
    
    var model:NewsModel?{
        didSet{
            if model?.type == 1 {
                title2.text = model?.title
                time2.text = "2小时前评论"
                comment2.text = "\((model?.commentCount)!)条评论"
                let dic1 = model?.images?[0] as? [String:Any]
                let dic2 = model?.images?[1] as? [String:Any]
                let dic3 = model?.images?[2] as? [String:Any]
                image1.kf.setImage(with: URL(string:(dic1?["url1"] as? String)!))
                image2.kf.setImage(with: URL(string:(dic2?["url1"] as? String)!))
                image3.kf.setImage(with: URL(string:(dic3?["url1"] as? String)!))
                
            }else{
                //cell1
                time1.text = "4小时前评论"
                title1.text = model?.title
                content1.text = model?.title2
                icon.kf.setImage(with: URL(string: (model?.image)!))
                comment1.text = "\((model?.commentCount)!)条评论"
            }
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
