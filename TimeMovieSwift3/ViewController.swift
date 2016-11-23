//
//  ViewController.swift
//  TimeMovieSwift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        creatMainViewControllers()
    }

    func creatMainViewControllers(){
        let imgNames = ["home","payticket","store","discover","myinfo"]
        
        // 创建标签控制器数组存储标签控制器名字
        let viewControllersArray = ["HomeViewController","PayTicketViewController","StoreViewController","DiscoverViewController","MyInfoViewController"]
        // 控制器容器
        var VCs:[UIViewController] = []
        for i in 0..<5 {
            let str = viewControllersArray[i]
            // 获取命名空间
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            // 将字符串转化为类
            let uivcType = NSClassFromString(namespace + "." + str) as? UIViewController.Type
            // 可选绑定
            if let type = uivcType {
                let uiVC = type.init()
                uiVC.tabBarItem.selectedImage = UIImage(named:imgNames[i] + "_on")
                uiVC.tabBarItem.image = UIImage(named:imgNames[i])
                uiVC.title = imgNames[i]
                let bnv = BaseNavViewController(rootViewController: uiVC)
                VCs.append(bnv)
            }
        }
        
        // 设置tabBarController
        let tabBarVC = BaseTabBarViewController()
        tabBarVC.tabBar.selectionIndicatorImage = UIImage(named:"选中")
        tabBarVC.tabBar.backgroundImage = UIImage(named:"tab_bg_all")
        tabBarVC.viewControllers = VCs
        
        // 设置根视图
        (UIApplication.shared.delegate!.window!)!.rootViewController = tabBarVC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

