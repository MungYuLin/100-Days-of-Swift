//
//  ViewController.swift
//  Tap Or Hold Counter
//
//  Created by MungYu-Lin on 16/5/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLable: UILabel!
    
    var counter: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0
    }
    
    @IBAction func tapButtonTapped(sender: UIButton) {
        displayLable.text = String(++counter!)
    }
    
    @IBAction func tapButtonDragged(sender: UIButton) {
        displayLable.text = String(++counter!)
    }
    
    @IBAction func resetBarButton(sender: UIBarButtonItem) {
        counter = 0
        displayLable.text = String(counter!)
    }
}

