//
//  CriricismCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/2.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher


class CriricismCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    
    var model:CriticismModel?{
        didSet{
            title.text = model?.title
            comment.text = model?.summary
            let movieImageUrl = model?.relatedObj?["image"] as! String
            movieImage.kf.setImage(with: URL(string:movieImageUrl))
            userIcon.kf.setImage(with: URL(string:(model?.userImage)!))
            userName.text = model?.nickname
            movieName.text = model?.relatedObj?["title"] as? String
            let aStr = NSMutableAttributedString(string:(model?.rating)!)
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location: 2, length: 1))
            rating.attributedText = aStr
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
