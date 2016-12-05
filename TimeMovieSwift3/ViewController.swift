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
        
        // 设置广告动画
        let nav = tabBarVC.viewControllers?[0]
        nav?.view.transform = CGAffineTransform(scaleX:0, y:0)
        UIView.animate(withDuration: 1, animations: { 
            nav?.view.transform = CGAffineTransform(scaleX:1, y:1)
            }) { (finished) in
                //广告视图
                let adView = ADView(frame: CGRect(x: (KScreen_W-300)/2, y: (Kscreen_H-420)/2, width: 300, height: 420))
                adView.closeImageStr = "pic_ico_wrong"
                //添加图片
                var imageArr:[String] = []
                for i in 0 ..< 4{
                    let str = String.init(format: "wizard%d_568@2x.jpg", arguments: [i+1])
                    imageArr.append(str)
                }
                adView.imageArray = imageArr
                adView.showViewAnimation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

