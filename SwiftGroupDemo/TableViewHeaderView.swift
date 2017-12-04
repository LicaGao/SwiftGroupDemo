//
//  TableViewHeaderView.swift
//  SwiftGroupDemo
//
//  Created by 高鑫 on 2017/12/4.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

protocol TableViewHeaderViewDelegate {
    func tableViewHeaderClick(_ headerView: TableViewHeaderView, section: Int)
}

class TableViewHeaderView: UITableViewHeaderFooterView {
    
    var delegate : TableViewHeaderViewDelegate?
    var section : Int = 0
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 20)
        label.textAlignment = .center
        label.font = UIFont(name: "Apple Color Emoji", size: 30)
        return label
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.addSubview(label)
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func headerViewWithTableView(_ tableView: UITableView) -> TableViewHeaderView {
        let headerIdentifier = "header"
        
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier)
        
        if headerView == nil {
            headerView = TableViewHeaderView(reuseIdentifier: headerIdentifier)
        }
        
        return headerView as! TableViewHeaderView
    }
    
    lazy var tapGesture : UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tapGesture:)))
        return tapGesture
    }()
    
    @objc func tapAction(tapGesture: UITapGestureRecognizer) {
        
        if delegate != nil {
            delegate?.tableViewHeaderClick(self, section: section)
        }
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
