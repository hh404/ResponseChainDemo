//
//  ViewController.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/8.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var eventStrategy: Dictionary<String, Any>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventStrategy?["d"] = clicked1
        
        let btn = UIButton.init(frame: CGRect(x: 0, y: 120, width: 120, height: 40))
        btn.setTitle("Next", for: .normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(clicked1), for: .touchUpInside)
        btn.backgroundColor = .red
    }

    @objc func clicked1() {
        let vc = DetailViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

}

