//
//  addViewController.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/6/14.
//  Copyright © 2016年 MY. All rights reserved.
//


import Foundation
import UIKit
import CoreLocation

class addViewController: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate   {
    
    var navigationBar: UINavigationBar!
    var lable: UILabel!
    var dateFormatter = NSDateFormatter()
    var textView: UITextView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Entry"
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(closeAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(saveAction))
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        lable = UILabel(frame: CGRectMake(0, 70, self.view.bounds.size.width, 10))
        lable.text = dateFormatter.stringFromDate(NSDate())
        lable.textColor = UIColor.init(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        lable.font = UIFont(name: "Thonburi", size: 10)
        lable.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lable)
        
        textView = UITextView(frame: CGRectMake(0, 85, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        
        addToolBar(textView)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locatAction()
    }
    
    func addToolBar(textField: UITextView){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(cameraAction))
        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil);
        btngap1.width = 30
        let locatButton = UIBarButtonItem()
        locatButton.image = UIImage.init(named: "location")
        locatButton.action = #selector(locatAction)
        let title = UIBarButtonItem()
        
        toolBar.setItems([cameraButton, btngap1, locatButton, title], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func closeAction() {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func saveAction() {
        //
    }
    
    func cameraAction() {
        //
    }
    
    func locatAction() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(manager.location!.coordinate.latitude)
        print(manager.location!.coordinate.longitude)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print(error)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
