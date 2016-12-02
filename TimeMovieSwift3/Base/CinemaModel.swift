//
//  CinemaModel.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class CinemaModel: BaseModel {
    var cinemaName:String?
    var address:String?
    var minPrice:NSNumber?
    var longitude:NSNumber?
    var latitude:NSNumber?
    var feature:[NSString:Int]?
    var length:Float = 0.0
}
