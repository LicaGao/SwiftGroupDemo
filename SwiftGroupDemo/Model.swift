//
//  Model.swift
//  SwiftGroupDemo
//
//  Created by 高鑫 on 2017/12/4.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    var title : String!
    var item : [String]!
    var isShow : Bool!
}

class ItemData {

    static let itemData = [
    Item(title: "😂", item: ["00001","00002","00003"], isShow: false),
    Item(title: "😎", item: ["00001","00002","00003"], isShow: false),
    Item(title: "😜", item: ["00001","00002","00003"], isShow: false),
    Item(title: "🙄", item: ["00001","00002","00003"], isShow: false),
    Item(title: "🤔", item: ["00001","00002","00003"], isShow: false)
    ]
}
