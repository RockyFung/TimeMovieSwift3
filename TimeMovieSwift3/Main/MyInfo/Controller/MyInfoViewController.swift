//
//  MyInfoViewController.swift
//  TimeMovie-Swift3
//
//  Created by rocky on 2016/11/22.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class MyInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myInfoView = MyInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height-64-49))
        view.addSubview(myInfoView)
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
