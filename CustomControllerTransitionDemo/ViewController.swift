//
//  ViewController.swift
//  CustomControllerTransitionDemo
//
//  Created by 权仔 on 16/9/22.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var tableView : UITableView?
    
    var titleArray = ["item 01", "item 02", "item 03", "item 04", "item 05"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height), style: .plain)
        tableView?.delegate = self;
        tableView?.dataSource = self;
        view.addSubview(tableView!)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Action", style: .plain, target: self, action: #selector(rightButtonClick(button:)))
    }
    
    func rightButtonClick(button:UIButton)
    {
        let result: UIViewController = ResultViewController()
        present(result, animated: true) {
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
}


