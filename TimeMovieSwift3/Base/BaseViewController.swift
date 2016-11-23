//
//  BaseViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

let KScreen_W = UIScreen.main.bounds.size.width
let Kscreen_H = UIScreen.main.bounds.size.height

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_mtime_star.jpg")!)
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
