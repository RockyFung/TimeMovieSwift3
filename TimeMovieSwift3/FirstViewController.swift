//
//  FirstViewController.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/5.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //将button隐藏
        closeBtn.isHidden = true
        
        creatScrollView()
    }

    @IBAction func closeAction(_ sender: AnyObject) {
        ViewController().creatMainViewControllers()
    }
    
    // 设置滑动视图
    func creatScrollView(){
        scrollView.contentSize = CGSize(width:KScreen_W * 3, height:Kscreen_H)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        for i in 0 ..< 3 {
            
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*KScreen_W, y: 0, width: KScreen_W, height: Kscreen_H))
            imageView.image = UIImage(named: String(format: "wizard%d_920.jpg", arguments: [i+1]))
            scrollView.addSubview(imageView)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension FirstViewController:UIScrollViewDelegate{
    //已经结束减速
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //判断当前页数
        let index = Int(scrollView.contentOffset.x/KScreen_W)
        if index == 2 {
            closeBtn.isHidden = false
        } else {
            closeBtn.isHidden = true
        }
        
    }
}






