//
//  DetailViewController.swift
//  From Sketch to XCode
//
//  Created by MungYu-Lin on 16/5/29.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var lable: UILabel!
    
    let groups = ContactModel().dict
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Info Card"
        
        let rightButton = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: #selector(editAction))
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = rightButton
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
    }
    
    func editAction() {
        //
    }
}