//
//  ViewController.swift
//  Change Date And Time
//
//  Created by MungYu-Lin on 16/7/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModeViewControlDelegate {
    
    var lable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let todayDate = NSDate()
        let customDateFormatter = NSDateFormatter()
        lable = UILabel(frame: CGRectMake(100, 200, 200, 100))
        customDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        lable.text = customDateFormatter.stringFromDate(todayDate)
        self.view.addSubview(lable)
        
        let setDateTimeBut = UIButton()
        setDateTimeBut.setTitle("Set Date And Time", forState: UIControlState.Normal)
        setDateTimeBut.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        setDateTimeBut.frame = CGRect(x: 80, y: 260, width: 200, height: 80)
        setDateTimeBut.addTarget(self, action: #selector(ViewController.setDateTime), forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(setDateTimeBut)
        
    }
    
    func currentDate(dateTime: String) {
        lable.text = dateTime
    }
    
    func setDateTime() {
        let nextVC = setDateTimeController()
        nextVC.delegate = self
        navigationController!.pushViewController(nextVC, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

