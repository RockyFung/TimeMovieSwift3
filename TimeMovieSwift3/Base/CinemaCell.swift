//
//  CinemaCell.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class CinemaCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!

    
    //赋值完成后调用
    var model:CinemaModel?{
        didSet{
            
            title.text = model?.cinemaName
            address.text = model?.address
            length.text = String(format: "距离%.2f公里", arguments: [(model?.length)!])
            price.text = String(format: "￥%.1f", arguments: [(model?.minPrice?.floatValue)!/100.0])
            
            var i = 0
            if model?.feature?["has3D"] == 0 {
                img1.isHidden = true
                //每有一个图片隐藏，就 +1
                i+=1
            }
            //平移图片
            img2.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasIMAX"] == 0 {
                img2.isHidden = true
                i+=1
            }
            img3.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasVIP"] == 0 {
                img3.isHidden = true
                i+=1
            }
            img4.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasPark"] == 0 {
                img4.isHidden = true
                i+=1
            }
            img5.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasServiceTicket"] == 0 {
                img5.isHidden = true
                i+=1
            }
            img6.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasWifi"] == 0 {
                img6.isHidden = true
                i+=1
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
