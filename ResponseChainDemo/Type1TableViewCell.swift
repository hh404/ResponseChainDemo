//
//  Type1TableViewCell.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/8.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

class Type1TableViewCell: UITableViewCell {
let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(btn)
        btn.setTitle("Button", for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func btnClicked() {
        self.routerEventWithName("Type1TableViewCellBtnClicked", userInfo: ["name":"hans"])
    }

}
