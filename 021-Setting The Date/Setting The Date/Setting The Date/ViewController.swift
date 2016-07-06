//
//  ViewController.swift
//  Setting The Date
//
//  Created by MungYu-Lin on 16/7/6.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.center = self.view.center
        datePicker.datePickerMode = .DateAndTime
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
    }
    
    @IBAction func setdate(sender: AnyObject) {
        let currentDate = datePicker.date
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        navigationBar.topItem?.title = dformatter.stringFromDate(currentDate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

