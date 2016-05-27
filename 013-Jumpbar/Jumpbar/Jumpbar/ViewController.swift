//
//  ViewController.swift
//  Jumpbar
//
//  Created by MungYu-Lin on 16/5/27.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    var leftButton: UIBarButtonItem!
    var rightButton: UIBarButtonItem!
    
    let projects = ["TAP COUNTER", "TAP OR HOLD COUNTER", "SWIFT IAD", "TIP CALCULATOR", "BASIC TABLE VIEW", "GETTING CURRENT DATE AND TIME", "PASSING DATA TO ANOTHER VIEW", "SWIPE TO DISMISS KEYBOARD", "ADD PHOTO FROM CAMERA ROLL", "PULL TO REFRESH TABLE VIEW", "DELETING AND REARRANGING", "ADD NEW ITEM", "STICKY SECTION HEADERS", "JUMPBAR", "FROM SKETCH TO XCODE", "BUILDING THE USER INTERFACE", "THE MODEL AND CONTROLLERS", "DYNAMIC DATA FOR EACH CELL", "BUTTONS ABOVE KEYBOARD", "SAVE DATE, LOCATION & PHOTO", "SET LOCATION", "SETTING THE DATE", "CHANGE DATE AND TIME", "CUSTOM COLLECTION VIEW", "SCROLL VIEWS", "ACTION SHEET", "SEARCH BAR IN TABLE VIEW", "IMAGE CAROUSEL", "MUTIPLE COLLECTION VIEWS", "SEGMENTED CONTROL VIEWS", "CUSTOM SEARCH RESULTS", "BASIC ANIMATION", "CUSTOM SWIPE TRANSITIONS", "SPRING ANIMATIONS", "CORE ANIMATION & MASKS 1", "CORE ANIMATION & MASKS 2", "CUSTOM TRANSITIONS", "INTERACTIVE TRANSITIONS", "EMBEDDED COLLECTION VIEW", "STRETCHY HEADER"]
    
    var groups = [String: [String]]()
    var groupTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Swift Project List"
        
        tableView = UITableView(frame: CGRectMake(0, 20, 370, 650), style: .Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView!)
        
        initData()
    }
    
    func initData() {
        let newArray = projects.map({$0.capitalizedString})
        for i in 65...90 {
            let character = Character(UnicodeScalar(i))
            groupTitles.append(String(character))
            groups[String(character)] = newArray.filter(){
                return $0.rangeOfString(String(character)) != nil
            }.sort {$0 < $1}
        }
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return groupTitles
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        var tpIndex:Int = 0
        for character in groupTitles {
            if character == title{
                return tpIndex
            }
            tpIndex += 1
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let firstLetter = groupTitles[section]
        return groups[firstLetter]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let firstLetter = groupTitles[indexPath.section]
        let datas = groups[firstLetter]!
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = datas[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupTitles[section]
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = UIView(frame: CGRect(x: 15, y: 20, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.size.width, height: 40))
        label.text = groupTitles[section]
        label.textColor = UIColor.whiteColor()
        headerview.backgroundColor = UIColor.lightGrayColor()
        headerview.addSubview(label)
        return headerview
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

