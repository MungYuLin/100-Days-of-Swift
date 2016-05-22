//
//  ViewController.swift
//  Add New Item
//
//  Created by MungYu-Lin on 16/5/21.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    var leftButton: UIBarButtonItem!
    var rightButton: UIBarButtonItem!
    
    //var list = ["以父之名", "懦夫", "晴天", "三年二班", "东风破", "你听得到", "同一种调调", "她的睫毛", "爱情悬崖" ,"梯田", "双刀"]
    var datas: NSMutableArray = ["以父之名", "懦夫", "晴天", "三年二班", "东风破", "你听得到", "同一种调调", "她的睫毛", "爱情悬崖" ,"梯田", "双刀"]
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "枼惠美专辑列表"
        
        leftButton = UIBarButtonItem(title: "編輯", style: .Plain, target: self, action: #selector(editAction))
        leftButton.tag = 100
        rightButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView!)
    }
    
    override func viewWillAppear(animated: Bool) {
        datas = appDelegate.datas
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = datas.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        navigationController!.pushViewController(EditDataController(), animated:true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            datas.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        tableView.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
        datas.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
    }

    
    func editAction() {
        if(leftButton.tag == 100) {
            leftButton.tag = 200
            leftButton.title = "完成"
            tableView.editing = true
        } else {
            leftButton.tag = 100
            leftButton.title = "編輯"
            tableView.editing = false
        }
    }
    
    func addAction() {
        appDelegate.datas = datas
        navigationController!.pushViewController(AddDataViewController(), animated:true)
    }
}