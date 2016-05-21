//
//  DetailViewController.swift
//  Add New Item
//
//  Created by MungYu-Lin on 16/5/21.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class EditDataController: UIViewController {
    
    var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "編輯歌曲"
        self.view.backgroundColor = UIColor.whiteColor()
        showDetailView()
        
        let btn = UIBarButtonItem(title:"Done", style: .Plain, target: self, action: #selector(doneClicked))
        navigationItem.rightBarButtonItem = btn
    }
    
    func showDetailView() {
        textField = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        textField.text = appDelegate.value
        self.view.addSubview(textField)
    }
    
    func doneClicked() {
        navigationController!.popToRootViewControllerAnimated(true)
    }
}