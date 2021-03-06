//
//  DetailViewController.swift
//  Swipe to Dismiss Keyboard
//
//  Created by MungYu-Lin on 16/5/16.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var textField: UITextView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First View"
        self.view.backgroundColor = UIColor.whiteColor()
        showDetailView()
        
        let btn = UIBarButtonItem(title:"Done", style: .Plain, target: self, action: #selector(doneClicked))
        navigationItem.rightBarButtonItem = btn
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSwipeGesture(_:)))
        swipeGesture.direction = .Down
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    func showDetailView() {
        textField = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textField.text = appDelegate.value
        textField.becomeFirstResponder()
        self.view.addSubview(textField)
    }
    
    func doneClicked() {
        appDelegate.value = textField.text
        navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func moveSwipeGesture(sender: UISwipeGestureRecognizer){
        switch (sender.direction){
            case UISwipeGestureRecognizerDirection.Down:
                textField.resignFirstResponder()
                break
            default:
                break;
        }
    }
}
