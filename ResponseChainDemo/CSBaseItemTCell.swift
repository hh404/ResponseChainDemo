//
//  CSBaseItemTCell.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/9.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

class CSBaseItemTCell: UITableViewCell {
    open var object: Any?
    
    func setViewModelItem(_ viewModelItem: CSTableBaseItem) {
        self.object = viewModelItem
    }
}
