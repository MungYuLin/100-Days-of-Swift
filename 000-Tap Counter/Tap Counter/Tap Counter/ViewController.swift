//
//  ViewController.swift
//  Tap Counter
//
//  Created by MungYu-Lin on 16/5/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    @IBAction func tabAppent(sender: UIButton) {
        display.text = String((display.text! as NSString).intValue + 1)
    }
    
    @IBAction func resetAppent(sender: UIButton) {
        display.text = String(0);
    }
    
}

