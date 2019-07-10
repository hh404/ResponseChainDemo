//
//  CSTableViewDataSource.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/9.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

class CSTableViewDataSource: NSObject {
    fileprivate var itemsArray: [CSTableBaseItem] = []
    func cellClassForObject(_ item: CSTableBaseItem) -> CSBaseItemTCell.Type {
        if item.isKind(of: CSTableBaseItem.self){
            return CSBaseItemTCell.self
        }
        else {
            return CSBaseItemTCell.self
        }
    }
    
    func objectForRowAtIndexPath(_ index: IndexPath) -> CSTableBaseItem {
        return CSTableBaseItem()
    }
}

extension CSTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.objectForRowAtIndexPath(indexPath)
        let cellClass: CSBaseItemTCell.Type = self.cellClassForObject(item)
        let identifier = String.init(describing: cellClass.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        return cell!
    }

}
