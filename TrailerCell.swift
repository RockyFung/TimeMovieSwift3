//
//  TrailerCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/2.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher

class TrailerCell: UITableViewCell {
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var moveImg: UIImageView!

    var model:TrailerModel?{
        didSet{
            content.text = model?.movieName
            title.text = model?.summary
            moveImg.kf.setImage(with: URL(string: (model?.coverImg)!))
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
