//
//  ViewController.swift
//  SwiftGroupDemo
//
//  Created by 高鑫 on 2017/12/4.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewHeaderViewDelegate {
    
    var itemData = ItemData.itemData
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemData[section].isShow ? itemData[section].item.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableViewHeaderView.headerViewWithTableView(self.tableView)
        let data = itemData[section]
        header.delegate = self
        header.section = section
        header.label.text = data.title
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let data = itemData[indexPath.section]
        cell.itemLabel?.text = data.item[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableViewHeaderClick(_ headerView: TableViewHeaderView, section: Int) {

        let show = itemData[section].isShow
        itemData[section].isShow = !show!
        
        let index = IndexSet(integer: section)
        self.tableView.reloadSections(index, with: .fade)
    }

}
