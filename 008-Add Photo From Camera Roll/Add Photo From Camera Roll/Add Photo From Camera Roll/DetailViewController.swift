//
//  DetailViewController.swift
//  Add Photo From Camera Roll
//
//  Created by MungYu-Lin on 16/5/16.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var textField: UITextView!
    var oldInfo: String!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First View"
        self.view.backgroundColor = UIColor.whiteColor()
        showDetailView()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(cameraClicked))
        navigationItem.rightBarButtonItem = btn
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSwipeGesture(_:)))
        swipeGesture.direction = .Down
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    func showDetailView() {
        textField = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textField.text = oldInfo
        textField.becomeFirstResponder()
        self.view.addSubview(textField)
    }
    
    func cameraClicked() {
        self.imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print(picker)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "test")
        //attachment.bounds = CGRectMake(0, 0, attachment.image!.size.width, attachment.image!.size.height);
        let attributedStr = NSAttributedString(attachment: attachment)
        textField.attributedText = attributedStr
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doneClicked() {
        let viewController = ViewController()
        for (index, value) in viewController.list.enumerate() {
            if(value == oldInfo) {
                viewController.list[index] = textField.text!
                break
            }
        }
        viewController.tableView!.reloadData()
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