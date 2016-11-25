
    //
//  SegmentView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/11/25.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

//  typealias 是用来为已经存在的类型重新定义名字的,通过命名,可以使代码变得更加清晰
typealias ActionBlock = (_ index:Int) -> ()

class SegmentView: UIView {

    var actionBlock:ActionBlock?
    var selectImageView:UIImageView?
    
    var titleArray:[String]?{
        didSet{
            let titleCount = titleArray?.count
            
            for i in 0..<titleCount! {
                //创建按钮
                let btn = UIButton(type: UIButtonType.custom)
                btn.frame = CGRect(x: CGFloat(i)*bounds.size.width/CGFloat(titleCount!), y: 0, width: bounds.size.width/CGFloat(titleCount!), height: bounds.size.height)
                btn.setTitle(titleArray?[i], for: UIControlState.normal)
                btn.setTitleColor(UIColor.white, for: UIControlState.normal)
                btn.setTitleColor(UIColor.orange, for: UIControlState.selected)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                btn.addTarget(self, action: #selector(buttonAction(btn:)), for: UIControlEvents.touchUpInside)
                if i == 0 {
                    btn.isSelected = true
                    btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
                }
                btn.tag = i + 100
                
                addSubview(btn)
            }
        }
    }
    
    
    var selectImageName:String?{
        didSet{
            selectImageView = UIImageView(frame: CGRect(x: 0, y: bounds.size.height-2, width: bounds.size.width/CGFloat((titleArray?.count)!), height: 2))
            let image = UIImage(named: selectImageName!)?.stretchableImage(withLeftCapWidth: 200, topCapHeight: 0)
            selectImageView?.image = image
            addSubview(selectImageView!)
        }
    }

    
    //按钮点击方法
    func buttonAction(btn: UIButton) -> Void {
        
        //将全部按钮改为非选中
        for view in subviews {
            if view is UIButton {
                let button = view as! UIButton
                button.isSelected = false
                button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            }
        }
        
        // 当前按钮设置为选中
        btn.isSelected = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        // 设置底部选中指示图片位置
        let index = btn.tag - 100
        let width = frame.size.width/CGFloat((titleArray?.count)!)
        //动画效果
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) {
            weakSelf!.selectImageView?.frame = CGRect(x: CGFloat(index)*width, y: (weakSelf!.selectImageView?.frame.origin.y)!, width: (weakSelf!.selectImageView?.frame.size.width)!, height: (weakSelf!.selectImageView?.frame.size.height)!)
        }
        
        // 回调点击index
        if let block = actionBlock{
            block(index)
        }
    }
    
    // 闭包赋值
    func selectAction(action:@escaping ActionBlock){
        actionBlock = action
    }
    
    
    
    
    
    
    
    
}
