//
//  ViewController.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/6/12.
//  Copyright © 2016年 MY. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let groups = [
        [
            "id": "001",
            "date": "2015-10-1 10:01",
            "ico": "icon-1.jpg",
            "note": "😄呵呵呵",
            "location": "銀河系偏遠地區太陽系中的第三顆行星地球村亞洲東部"
        ], [
            "id": "002",
            "date": "2015-10-1 10:01",
            "ico": "icon-2.jpg",
            "note": "╮(╯_╰)╭ ",
            "location": "銀河系偏遠地區太陽系中的第三顆行星地球村亞洲東部"
        ]
    ]
    
    let groupTitles = ["2015", "2016"]
    
    var tableView: UITableView!
    
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
        //创建一个重用的单元格
        tableView!.registerNib(UINib(nibName: "myTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        self.view.addSubview(tableView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = groups[indexPath.row]
        let cell:myTableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! myTableViewCell
        cell.dateLable.text = item["date"]
        cell.noteLable.text = item["note"]
        cell.locationLable.text = item["location"]
        let image = UIImage(named: item["ico"] ?? "");
        cell.iconImageView.image = image
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupTitles[section]
    }
    
    func addAction() {
        navigationController!.pushViewController(addViewController(), animated:true, completion: {
            println("我要确定了，你知道吗？");
        })
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        print(appDelegate.User)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


