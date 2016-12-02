//
//  CriticismView.swift
//  TimeMovieSwift3
//
//  Created by rocky on 16/12/1.
//  Copyright © 2016年 rocky. All rights reserved.
//

import UIKit

class CriticismView: UIView {

    lazy var stateDic:[String:Any] = {
        return [:]
    }()
    
    var dataList:[CriticismModel]?{
        didSet{
            tableView?.reloadData()
        }
    }
    
    var tableView:UITableView?
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        creatTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatTableView(){
        tableView = UITableView(frame:bounds, style:UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.clear
        addSubview(tableView!)
    }
    

}

extension CriticismView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataList?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CriricismCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("CriricismCell", owner: nil, options: nil)?[0] as? CriricismCell
        }
        cell?.model = dataList?[indexPath.row]
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dataList?[indexPath.row]
        
        // 如果是展开状态就重新计算cell高度
        if model?.isExpand == true {
            // 计算uilabel高度
            let comment = (model?.summary)! as NSString
            let rect = comment.boundingRect(with: CGSize(width:frame.size.width * 0.7 ,height:9999), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil)
            
            return rect.height + 70
        }else{
            return 160
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataList?[indexPath.row]
        
        // 如果是展开状态就把状态取反，再刷新cell
        if model?.isExpand == true {
            model?.isExpand = false
        }else{
            model?.isExpand = true
        }
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
}











