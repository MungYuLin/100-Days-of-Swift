//
//  ViewController.swift
//  Buttons Above Keyboard
//
//  Created by MungYu-Lin on 16/6/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var navigationBar: UINavigationBar!
    var lable: UILabel!
    var dateFormatter = NSDateFormatter()
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar = UINavigationBar(frame: CGRectMake(0, 20, 375, 44))
        let navigationItem = UINavigationItem()
        navigationItem.title = "New Entry"
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(closeAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(saveAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationBar.barStyle = .Default
        navigationBar.tintColor = UIColor.init(red: 142/255, green: 189/255, blue: 131/255, alpha: 1)
        navigationBar.barTintColor = UIColor.init(red: 228/255, green: 252/255, blue: 222/255, alpha: 1)
        navigationBar.pushNavigationItem(navigationItem, animated: true)
        self.view.addSubview(navigationBar!)
        
        dateFormatter.dateFormat = "MMM dd, yyyy"
        lable = UILabel(frame: CGRectMake(0, 70, self.view.bounds.size.width, 10))
        lable.text = dateFormatter.stringFromDate(NSDate())
        lable.textColor = UIColor.init(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        lable.font = UIFont(name: "Thonburi", size: 10)
        lable.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lable)
        
        textView = UITextView(frame: CGRectMake(0, 85, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        
        addToolBar(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addToolBar(textField: UITextView){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(cameraAction))
//        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil);
        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil);
        btngap1.width = 30
        let locatButton = UIBarButtonItem()
        locatButton.image = UIImage.init(named: "location-pin")
        locatButton.action = #selector(locatAction)
        
        toolBar.setItems([cameraButton, btngap1, locatButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func closeAction() {
        //
    }
    
    func saveAction() {
        //
    }
    
    func cameraAction() {
        //
    }
    
    func locatAction() {
        //
    }
}

