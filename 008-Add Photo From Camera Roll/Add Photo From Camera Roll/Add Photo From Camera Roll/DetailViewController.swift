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
    
    var textView: UITextView!
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
        textView = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textView.text = oldInfo
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
    }
    
    func cameraClicked() {
        self.imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let attachment = NSTextAttachment()
        attachment.image = scaleImage(image)
        let attString = NSAttributedString(attachment: attachment)
        textView.textStorage.insertAttributedString(attString, atIndex: textView.selectedRange.location)
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doneClicked() {
        let viewController = ViewController()
        for (index, value) in viewController.list.enumerate() {
            if(value == oldInfo) {
                viewController.list[index] = textView.text!
                break
            }
        }
        viewController.tableView!.reloadData()
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
    
    func scaleImage(image:UIImage) -> UIImage{
        UIGraphicsBeginImageContext(CGSizeMake(self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        image.drawInRect(CGRectMake(0, 0, self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        let scaledimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledimage
    }
}