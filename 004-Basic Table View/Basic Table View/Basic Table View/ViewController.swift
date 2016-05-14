//
//  ViewController.swift
//  Basic Table View
//
//  Created by MungYu-Lin on 16/5/10.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var navigationBar: UINavigationBar!
    var tableView: UITableView!
    var leftButton: UIBarButtonItem!
    var rightButton: UIBarButtonItem!

    var datas: NSMutableArray = ["以父之名", "懦夫", "晴天", "三年二班", "东风破", "你听得到", "同一种调调", "她的睫毛", "爱情悬崖" ,"梯田", "双刀"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar = UINavigationBar(frame: CGRectMake(0, 20, 375, 44))
        let navigationItem = UINavigationItem()
        navigationItem.title = "枼惠美专辑列表"
        leftButton = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: #selector(ViewController.editAction))
        rightButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ViewController.addAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationBar.pushNavigationItem(navigationItem, animated: true)
        self.view.addSubview(navigationBar!)

        tableView = UITableView(frame: CGRectMake(0, 65, 375, 600), style: .Plain)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelectionDuringEditing = true
        tableView.dataSource = self
        tableView.delegate = self;
        self.view.addSubview(tableView)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = datas.objectAtIndex(indexPath.row) as? String
        return cell
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

    func addAction() {
        datas.insertObject("！", atIndex: datas.count)
        let indexPath = NSIndexPath(forRow: datas.count, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
    }

    func editAction() {
        if(leftButton.title == "完成") {
            leftButton.title = "编辑"
            tableView.reloadData()
        } else {
            leftButton.title = "完成"
            datas[0] = "聽媽媽的話"
            let indexPath = NSIndexPath(forRow: datas.count, inSection: 0)
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        }
    }
}
