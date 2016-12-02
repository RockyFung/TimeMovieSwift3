//
//  TrailerView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit
import Kingfisher


class TrailerView: UIView {

    var trailerTableView:UITableView?
    var headerView:UIImageView?
    
    //数据源数组，赋值完成后调用
    var dataList:[TrailerModel]?{
        didSet{
            
            createHeaderView()
            trailerTableView?.reloadData()
            
        }
    }
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        createTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        trailerTableView = UITableView(frame: bounds)
        trailerTableView?.delegate = self
        trailerTableView?.dataSource = self
        trailerTableView?.backgroundColor = UIColor.clear
        trailerTableView?.rowHeight = 120
        
        addSubview(trailerTableView!)
        
    }

    
    func createHeaderView(){
        let model = dataList?[0]
        headerView = UIImageView(frame: CGRect(x: 0, y: -255, width: KScreen_W, height: 255))
        headerView?.kf.setImage(with: URL(string: (model?.coverImg)!))
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: (headerView?.bounds.size.height)!-50, width: KScreen_W, height: 50))
        textLabel.text = model?.movieName
        textLabel.textColor = UIColor.white
        textLabel.backgroundColor = UIColor(white: 0, alpha: 0.4)
        textLabel.font = UIFont.systemFont(ofSize: 25)
        textLabel.textAlignment = NSTextAlignment.center
        headerView?.addSubview(textLabel)
        
        headerView?.contentMode = UIViewContentMode.scaleAspectFill;
        headerView?.clipsToBounds = true
        
        
        trailerTableView?.contentInset = UIEdgeInsetsMake(255, 0, 0, 0)
        trailerTableView?.addSubview(headerView!)
        
        //添加一个点击事件
        headerView?.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        headerView?.addGestureRecognizer(tap)
    }
    
    func tapAction(tap:UITapGestureRecognizer){
        //创建VC
        let trailerVC = TrailerViewController()
        trailerVC.model = dataList?[0]
        //隐藏标签栏
        trailerVC.hidesBottomBarWhenPushed = true
        
        viewController()?.navigationController?.pushViewController(trailerVC, animated: true)
    }

}


extension TrailerView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataList?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TrailerCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("TrailerCell", owner: nil, options: nil)![0] as? TrailerCell
        }
        cell?.model = dataList?[indexPath.row+1]
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TrailerViewController()
        vc.model = dataList?[indexPath.row + 1]
        vc.hidesBottomBarWhenPushed = true
        viewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 滑动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let fy = scrollView.contentOffset.y

        // 向下滑动
        if scrollView.contentOffset.y < -255 {

            headerView?.frame.origin.y = fy
            headerView?.frame.size.height = -fy
            
            // title位置也要改变
            for title in (headerView?.subviews)! {
                if title is UILabel {
                    title.frame.origin.y = -fy - 50
                }
            }
        }
    }
}








