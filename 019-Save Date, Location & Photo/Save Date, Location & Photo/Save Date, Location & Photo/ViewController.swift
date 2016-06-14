//
//  ViewController.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/6/12.
//  Copyright © 2016年 MY. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    let groups = [
        [
            "data": "2015",
            "ico": "",
            "note": "😄呵呵呵",
            "location": "雲南"
        ], [
            "data": "2015",
            "ico": "",
            "note": "╮(╯_╰)╭ ",
            "location": "浙江"
        ]
    ]
    let groupTitles = ["2015", "2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Timeline"
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 142/255, green: 189/255, blue: 131/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 228/255, green: 252/255, blue: 222/255, alpha: 1)
        
        tableView = UITableView(frame: CGRectMake(0, 0, 375, 665), style: .Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = groups[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = item["note"]
//        let image = UIImage(named: item["ico"] ?? "");
//        cell.imageView?.image = image
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupTitles[section]
    }
    
    func addAction() {
        navigationController!.pushViewController(addViewController(), animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


