//
//  ViewController.swift
//  Add Photo From Camera Roll
//
//  Created by MungYu-Lin on 16/5/16.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    var list = ["以父之名", "懦夫", "晴天", "三年二班", "东风破", "你听得到", "同一种调调", "她的睫毛", "爱情悬崖" ,"梯田", "双刀"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second View"
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = list[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let detailViewController = DetailViewController()
        detailViewController.oldInfo = list[indexPath.row]
        navigationController!.pushViewController(detailViewController, animated:true)
    }
}

