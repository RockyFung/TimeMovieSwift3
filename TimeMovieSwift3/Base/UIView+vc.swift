
//
//  UIView+vc.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/2.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
extension UIView{
    func viewController() -> UIViewController?{
        var next = self.next
        while next != nil {
            //此响应者为UIViewController，return
            if next is UIViewController {
                return (next as? UIViewController)!
            }
            
            //继续获取下一响应者
            next = next?.next
        }
        return nil
    }
}
