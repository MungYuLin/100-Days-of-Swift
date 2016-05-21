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
    
    var textView: UITextView!
    
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
        textView = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textView.becomeFirstResponder()
        textView.returnKeyType = .Done
        textView.delegate = self
        self.view.addSubview(textView)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            doneClicked()
        }
        return true
    }
    
    func doneClicked() {
        navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func moveSwipeGesture(sender: UISwipeGestureRecognizer){
        switch (sender.direction){
        case UISwipeGestureRecognizerDirection.Down:
            textView.resignFirstResponder()
            break
        default:
            break;
        }
    }
}