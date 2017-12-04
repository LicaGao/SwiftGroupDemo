# SwiftGroupDemo
#### 12月4日练习
* 实现tableView分组折叠的效果。
* 创建TableViewHeaderViewDelegate协议，给headerView添加tap点击手势并实现协议方法 tableViewHeaderClick
```
    func tableViewHeaderClick(_ headerView: TableViewHeaderView, section: Int) {

        let show = itemData[section].isShow
        itemData[section].isShow = !show!
        
        let index = IndexSet(integer: section)
        self.tableView.reloadSections(index, with: .fade)
    }
```
* 其实demo中只有一个headerView写协议是有点多余了的但是毕竟Swift核心是面向协议，平时多用协议对以后的学习或者工作后写项目有很大好处
