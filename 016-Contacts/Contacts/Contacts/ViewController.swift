//
//  ViewController.swift
//  Contacts
//
//  Created by MungYu-Lin on 16/6/2.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for item in appDelegate.selec {
            print(item)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

