//
//  DetailViewController.swift
//  ResponseChainDemo
//
//  Created by huangjianwu on 2019/7/8.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

typealias myFunc = (Dictionary<String,Any>) -> Void
//typealias myFunc = (Double) -> Double
var eventStrategy : Dictionary = [String : myFunc]()

class DetailViewController: UIViewController {
  var tableView = UITableView.init(frame: CGRect(x: 0, y: 200, width: 300, height: 300))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mtfunc : myFunc =  {param in
            print("Hi\(param)")
            //return $0
        }
        let hansfunc : myFunc =  {param in
            print("hansfunc\(param)")
            //return $0
        }
        
        eventStrategy["Sandeep"] = mtfunc
        eventStrategy["hans"] = hansfunc
       // dic?["aaaa"] = self.test(_)
        self.view.backgroundColor = .white
        
        let btn = UIButton.init(frame: CGRect(x: 0, y: 120, width: 120, height: 40))
        btn.setTitle("Dismiss", for: .normal)
        btn.backgroundColor = .red
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        let btn2 = UIButton.init(frame: CGRect(x: 0, y: 190, width: 120, height: 40))
        btn2.setTitle("Clicked", for: .normal)
        self.view.addSubview(btn2)
        btn2.backgroundColor = .yellow
        btn2.addTarget(self, action: #selector(test), for: .touchUpInside)
        self.initTableView()
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func test()  {
        let mtfunc : myFunc =  {param in
            print("Hi\(param)")
            //return $0
        }
        let m: myFunc = eventStrategy["Sandeep"] ?? mtfunc
        m(["aaaa":"bbbb"])
    }
    
    func initTableView()  {
        tableView.register(Type1TableViewCell.self, forCellReuseIdentifier: "Type1TableViewCell")
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    deinit {
        print("dd")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func routerEventWithName(_ eventName: String, userInfo: Dictionary<String, Any>?) {
    print("\(eventName), \(userInfo)")
        if let m: myFunc = eventStrategy[eventName] {
            m(userInfo ?? [:])
        }
    }
}


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Type1TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Type1TableViewCell") as! Type1TableViewCell
        return cell
    }
    
    
}


extension DetailViewController {
//    func routerEventWithName(_ eventName: String, userInfo: Dictionary<String, Any>?) {
//
//    }
}
