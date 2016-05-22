//
//  AddDataController.swift
//  Add New Item
//
//  Created by MungYu-Lin on 16/5/21.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class AddDataViewController: UIViewController, UITextViewDelegate {
    
    var addTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "新增歌曲"
        showDetailView()
        
        let btn = UIBarButtonItem(title:"Done", style: .Plain, target: self, action: #selector(doneClicked))
        navigationItem.rightBarButtonItem = btn
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSwipeGesture(_:)))
        swipeGesture.direction = .Down
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    func showDetailView() {
        addTextView = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        addTextView.becomeFirstResponder()
        addTextView.returnKeyType = .Done
        addTextView.delegate = self
        self.view.addSubview(addTextView)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            doneClicked()
        }
        return true
    }
    
    func doneClicked() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.datas.addObject(addTextView.text!)
        navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func moveSwipeGesture(sender: UISwipeGestureRecognizer){
        switch (sender.direction){
        case UISwipeGestureRecognizerDirection.Down:
            addTextView.resignFirstResponder()
            break
        default:
            break;
        }
    }
}