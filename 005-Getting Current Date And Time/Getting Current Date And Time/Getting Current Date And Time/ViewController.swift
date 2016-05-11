//
//  ViewController.swift
//  Getting Current Date And Time
//
//  Created by MungYu-Lin on 16/5/11.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var systemDateTimeLable: UILabel!
    @IBOutlet weak var dateTimeLable: UILabel!
    
    var now = NSDate()
    var timer: NSTimer!
    var dateFormatter = NSDateFormatter()
    var customDateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        systemDateTimeLable.text = dateFormatter.stringFromDate(now)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.systemRefreshDateTime), userInfo: nil, repeats: true)
        
        customDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateTimeLable.text = customDateFormatter.stringFromDate(now)
    }

    
    @IBAction func refreshDateTime(sender: UIButton) {
        dateTimeLable.text = customDateFormatter.stringFromDate(now)
    }
    
    func systemRefreshDateTime() {
        now = NSDate()
        systemDateTimeLable.text = dateFormatter.stringFromDate(now)
    }
}
