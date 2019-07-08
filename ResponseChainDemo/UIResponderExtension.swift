//
//  UIResponderExtension.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/8.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import Foundation
import UIKit

protocol UIResponderChainProtocol {
    func routerEventWithName(_ eventName: String, userInfo: Dictionary<String, Any>?)
}

extension UIResponder: UIResponderChainProtocol {
    
    @objc func routerEventWithName(_ eventName: String, userInfo: Dictionary<String, Any>?) {
        self.next?.routerEventWithName(eventName, userInfo: userInfo)
    }
    
}
