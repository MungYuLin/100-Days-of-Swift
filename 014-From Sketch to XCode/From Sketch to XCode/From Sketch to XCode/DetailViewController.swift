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
    
    var imageView: UIImageView!
    var nameLable: UILabel!
    var mobileLable: UILabel!
    var emailLable: UILabel!
    var notesLable: UILabel!
    
    let groups = ContactModel().dict
    let groupTitles = ContactModel().keys
    var data = NSObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Info Card"
        
        let rightButton = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: #selector(editAction))
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = rightButton
        
        imageView = UIImageView(frame: CGRectMake(10, 100, 24, 24))
        self.view.addSubview(imageView)
        nameLable = UILabel(frame: CGRectMake(10, 150, self.view.bounds.size.width, 50))
        mobileLable = UILabel(frame: CGRectMake(10, 200, self.view.bounds.size.width, 50))
        emailLable = UILabel(frame: CGRectMake(10, 250, self.view.bounds.size.width, 50))
        notesLable = UILabel(frame: CGRectMake(10, 300, self.view.bounds.size.width, 100))
        self.view.addSubview(nameLable)
        self.view.addSubview(mobileLable)
        self.view.addSubview(emailLable)
        self.view.addSubview(notesLable)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let key = (appDelegate.selec! as NSString).substringToIndex(1).uppercaseString
        for value in groups[key]!.enumerate() {
            data = value.element
            if (data as! User).Name! == appDelegate.selec {
                break
            }
        }
        imageView.image = UIImage(named: (data as! User).Ico!)
        nameLable.text = "Name\n" + (data as! User).Name!
        nameLable.numberOfLines = 0
        nameLable.textColor = UIColor.blueColor()
        mobileLable.text = "Mobile\n" + (data as! User).Mobile!
        mobileLable.numberOfLines = 0
        emailLable.text = "Email\n" + (data as! User).Email!
        emailLable.numberOfLines = 0
        notesLable.text = "Notes\n" + (data as! User).Notes!
        notesLable.numberOfLines = 0
    }
    
    func editAction() {
        //
    }
}