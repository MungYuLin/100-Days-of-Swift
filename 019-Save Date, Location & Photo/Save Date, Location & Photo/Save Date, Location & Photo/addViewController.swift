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

class addViewController: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate {
    
    var navigationBar: UINavigationBar!
    var lable: UILabel! //新增日期
    var dateFormatter = NSDateFormatter()
    var textView: UITextView!
    var imagePicker: UIImagePickerController!
    let toolBar = UIToolbar()
    var locat = "地址信息" //定位信息
    
    var locationManager: CLLocationManager!
    
    //  代理成员变量
    weak var delegate: ModeViewControlDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Entry"
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(closeAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(saveAction))
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        lable = UILabel(frame: CGRectMake(0, 70, self.view.bounds.size.width, 10))
        lable.text = dateFormatter.stringFromDate(NSDate())
        lable.textColor = UIColor.init(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        lable.font = UIFont(name: "Thonburi", size: 10)
        lable.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lable)
        
        textView = UITextView(frame: CGRectMake(0, 85, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        
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
        
        addToolBar(textView)
    }
    
    func addToolBar(textField: UITextView) {
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(cameraAction))
        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil);
        btngap1.width = 30
        let locatButton = UIBarButtonItem()
        locatButton.image = UIImage.init(named: "location")
        locatButton.action = #selector(locatAction)
        let title = UIBarButtonItem()
        let butlabel = UILabel(frame: CGRectMake(0, 0, 200, 15))
        butlabel.textAlignment = .Right
        butlabel.text = locat
        title.customView = butlabel
        
        toolBar.setItems([cameraButton, btngap1, locatButton, title], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func cameraAction() {
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
    
    func scaleImage(image:UIImage) -> UIImage{
        UIGraphicsBeginImageContext(CGSizeMake(self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        image.drawInRect(CGRectMake(0, 0, self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        let scaledimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledimage
    }
    
    func locatAction() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = manager.location!.coordinate.latitude
        let longitude = manager.location!.coordinate.longitude
        
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: latitude, longitude: longitude)
        geocoder.reverseGeocodeLocation(currentLocation, completionHandler: {
            (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
            print("轉換經緯度ING~")
            //强制转成简体中文
            let array = NSArray(object: "zh-hans")
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "AppleLanguages")
            //显示所有信息
            if error != nil {
                self.locat = "错误：\(error!.localizedDescription))"
                return
            }
            
            if let p = placemarks?[0]{
                //输出反编码信息
                self.locat = p.name!
                print(self.locat)
            } else {
                print("No placemarks!")
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("位置獲取失敗：\(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func closeAction() {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func saveAction() {
        let user: [String: String] = [
            "id": "003",
            "date": lable.text!,
            "ico": "icon-1.jpg",
            "note": textView.text,
            "location": locat
        ]
        if self.delegate != nil {
            self.delegate!.changeData(user)
        } else {
            print("delegate is nil")
        }
        navigationController!.popViewControllerAnimated(true)
    }
}
