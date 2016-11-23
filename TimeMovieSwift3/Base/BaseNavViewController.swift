//
//  BaseNavViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改导航栏背景图片
        navigationBar.setBackgroundImage(UIImage(named:"pic_title_bg.9"), for: UIBarMetrics.default)
        
        // 修改导航栏字体
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
    }
    
    // 修改状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
