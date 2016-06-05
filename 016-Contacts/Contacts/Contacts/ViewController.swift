//
//  ViewController.swift
//  Contacts
//
//  Created by MungYu-Lin on 16/6/2.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedValue = [String: String]()
    
    @IBOutlet weak var icoView: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var mobileLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icoView.image = UIImage(named: selectedValue["avatarBig"]!)
        icoView.layer.masksToBounds = true
        icoView.layer.cornerRadius = icoView.frame.size.width / 2
        icoView.layer.borderWidth = 3.0;
        let color = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        icoView.layer.borderColor = color.CGColor
        
        firstName.text = selectedValue["name"]
        mobileLable.text = selectedValue["mobile"]
        emailLable.text = selectedValue["email"]
        notesTextView.text = selectedValue["notes"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

