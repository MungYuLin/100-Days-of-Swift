//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by MungYu-Lin on 16/6/2.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var indexOfSelectedPerson = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionFooterHeight = 0
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0/255, green: 119/255, blue: 204/255, alpha: 1)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return recent.count
        case 1:
            return firends.count
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = recent[indexPath.row]["name"]
            cell.imageView?.image = UIImage(named: recent[indexPath.row]["avatar"]!)
            break
        case 1:
            cell.textLabel!.text = firends[indexPath.row]["name"]
            cell.imageView?.image = UIImage(named: firends[indexPath.row]["avatar"]!)
            break
        default:
            break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "recent"
        case 1:
            return "firends"
        default:
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var info = [String: String]()
        switch indexPath.section {
        case 0:
            info = recent[indexPath.row]
        case 1:
            info = firends[indexPath.row]
        default:
            break
        }
        performSegueWithIdentifier("SendDataSegue", sender: info)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let controller = segue.destinationViewController as? ViewController
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPathForCell(cell)
        switch indexPath!.section {
        case 0:
            controller!.selectedValue = recent[indexPath!.row]
        case 1:
            controller!.selectedValue = firends[indexPath!.row]
        default:
            break
        }
    }
}
