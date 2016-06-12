//
//  ViewController.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/6/12.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var navigationBar: UINavigationBar!
    var lable: UILabel!
    var dateFormatter = NSDateFormatter()
    var textView: UITextView!
    
    let locationManager = CLLocationManager()
    var currLocation = CLLocation()
    
    let locatLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar = UINavigationBar(frame: CGRectMake(0, 20, 375, 44))
        let navigationItem = UINavigationItem()
        navigationItem.title = "New Entry"
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(closeAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(saveAction))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationBar.barStyle = .Default
        navigationBar.tintColor = UIColor.init(red: 142/255, green: 189/255, blue: 131/255, alpha: 1)
        navigationBar.barTintColor = UIColor.init(red: 228/255, green: 252/255, blue: 222/255, alpha: 1)
        navigationBar.pushNavigationItem(navigationItem, animated: true)
        self.view.addSubview(navigationBar!)
        
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
        locatLable.text = "测试代码"
        title.customView = locatLable
        
        toolBar.setItems([cameraButton, btngap1, locatButton, title], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func closeAction() {
        //
    }
    
    func saveAction() {
        //
    }
    
    func cameraAction() {
        //
    }
    
    func locatAction() {
        self.locationManager.delegate = self;
        //定位方式
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        //iOS8.0以上才可以使用
        if(UIDevice.currentDevice().systemVersion >= "8.0"){
            //始终允许访问位置信息
            locationManager.requestAlwaysAuthorization()
            //使用应用程序期间允许访问位置数据
            locationManager.requestWhenInUseAuthorization()
        }
        //开启定位
        locationManager.startUpdatingLocation()
    }
    
    // 获取定位信息
    func locationManager(manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        //取得locations数组的最后一个
        let location = locations[locations.count - 1] 
        currLocation = locations.last!
        //判断是否为空
        if(location.horizontalAccuracy > 0){
            let lat = Double(String(format: "%.1f", location.coordinate.latitude))
            let long = Double(String(format: "%.1f", location.coordinate.longitude))
            locatLable.text = "纬度:\(long!), 经度:\(lat!)"
            LonLatToCity()
            
            //停止定位
            locationManager.stopUpdatingLocation()
        }
    }
    
    // 出现错误
    func locationManager(manager: CLLocationManager, didFinishDeferredUpdatesWithError error: NSError?) {
        locatLable.text = error?.debugDescription
    }
    
    
    // 将经纬度转换为城市名
    func LonLatToCity() {
        let geocoder: CLGeocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(currLocation) { (placemark, error) -> Void in
            if(error == nil)
            {
                let array = placemark! as NSArray
                let mark = array.firstObject as! CLPlacemark
                //国家编码
                let CountryCode: NSString = (mark.addressDictionary! as NSDictionary).valueForKey("CountryCode") as! NSString
                //国家
                let country: NSString = (mark.addressDictionary! as NSDictionary).valueForKey("Country") as! NSString
                //省
                var State: String = (mark.addressDictionary! as NSDictionary).valueForKey("State") as! String
                //城市
                var city: String = (mark.addressDictionary! as NSDictionary).valueForKey("City") as! String
                //区
                let SubLocality: NSString = (mark.addressDictionary! as NSDictionary).valueForKey("SubLocality") as! NSString
                //街道位置
                let FormattedAddressLines: NSString = (mark.addressDictionary! as NSDictionary).valueForKey("FormattedAddressLines")?.firstObject as! NSString
                //具体位置
                let Name: NSString = (mark.addressDictionary! as NSDictionary).valueForKey("Name") as! NSString
                
                //如果需要去掉“市”和“省”字眼
                State = State.stringByReplacingOccurrencesOfString("省", withString: "")
                let citynameStr = city.stringByReplacingOccurrencesOfString("市", withString: "")
                
                self.locatLable.text = "您的位置是： \(country), \(State), \(city), \(SubLocality), \(FormattedAddressLines), \(Name)"
            }
            else
            {
                self.locatLable.text = error?.debugDescription
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
