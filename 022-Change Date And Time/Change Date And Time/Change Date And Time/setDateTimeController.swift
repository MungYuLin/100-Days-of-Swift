//
//  setDateTimeController.swift
//  Change Date And Time
//
//  Created by MungYu-Lin on 16/7/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class setDateTimeController: UIViewController {
    
    weak var delegate: ModeViewControlDelegate?
    
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    var lable = UILabel()
    
    var strs = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Set Date And Time"
        self.view.backgroundColor = UIColor.whiteColor()
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancelAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(saveAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        // String 轉 NSDate
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let today = formatter.dateFromString(strs)
        
        lable = UILabel(frame: CGRectMake(130, 80, 200, 50))
        lable.font = UIFont(name: "Arial", size: 14)
        lable.text = String("today is \(strs)")
        self.view.addSubview(lable)
        
        datePicker = UIDatePicker(frame: CGRectMake(0, 120, 375, 200))
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        datePicker.datePickerMode = .Date
        datePicker.date = today!
        self.view.addSubview(datePicker)
        
        timePicker = UIDatePicker(frame: CGRectMake(0, 350, 375, 200))
        timePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        timePicker.datePickerMode = .Time
        datePicker.date = today!
        self.view.addSubview(timePicker)
    }
    
    func cancelAction() {
        navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func saveAction() {
        // NSDate 轉 String
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        
        let date = dateFormatter.stringFromDate(datePicker.date)
        let time = timeFormatter.stringFromDate(timePicker.date)
        
        if self.delegate != nil {
            self.delegate!.currentDate("\(date) \(time)")
        } else {
            print("delegate is nil")
        }
        
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}