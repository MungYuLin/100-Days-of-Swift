//
//  ViewController.swift
//  From Sketch to XCode
//
//  Created by MungYu-Lin on 16/5/27.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    let groups = ContactModel().dict
    let groupTitles = ContactModel().keys
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let navigationItem = UINavigationItem()
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addAction))
        let leftButton = UIBarButtonItem(image: UIImage(named: "cog.png"), style: .Plain, target: nil, action: #selector(cogAction))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Contacts"
        
//        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, 375, 65))
//        navigationBar.barTintColor = UIColor.init(red: 0/255, green: 127/255, blue: 255/255, alpha: 1)
//        navigationBar.tintColor = UIColor.whiteColor()
//        navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "BradleyHandITCTT-Bold", size: 36)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
//        navigationBar.pushNavigationItem(navigationItem, animated: true)
//        self.view.addSubview(navigationBar)
        
        self.view.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0/255, green: 127/255, blue: 255/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "BradleyHandITCTT-Bold", size: 33)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
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
        let firstLetter = groupTitles[section]
        return groups[firstLetter]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let key = groupTitles[indexPath.section]
        let users = groups[key]!
        let item = users[indexPath.row] as! User
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = item.Name ?? "Not initalized"
        cell.accessoryType = .DisclosureIndicator
        let image = UIImage(named: item.Ico ?? "");
        cell.imageView?.image = image
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupTitles[section]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        print(cell!.textLabel?.text)
        appDelegate.selec = cell!.textLabel?.text
        
        
        let detailViewController = DetailViewController()
        navigationController!.pushViewController(detailViewController, animated:true)
    }
    
    func cogAction() {
        //
    }
    
    func addAction() {
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

