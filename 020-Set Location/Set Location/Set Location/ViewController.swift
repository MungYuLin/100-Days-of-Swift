//
//  ViewController.swift
//  Set Location
//
//  Created by MungYu-Lin on 16/7/4.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLable: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func refreshLocation(sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            //self.locationManager.requestAlwaysAuthorization()
            self.locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
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
            // 强制转成简体中文
            let array = NSArray(object: "zh-hans")
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "AppleLanguages")
            // 显示所有信息
            if error != nil {
                self.locationLable.text = "错误：\(error!.localizedDescription))"
                return
            }
            
            if let p = placemarks?[0]{
                let dict = p.addressDictionary
                // 输出反编码信息
                // 國家：Country 國家編碼：CountryCode
                // 省：State 城市：City 區：SubLocality
                // 街道完整名稱：Street 街道名稱：Thoroughfare
                // 街道相关信息 SubThoroughfare
                // 地址：Name
                self.locationLable.text = "您的位置是：\(dict!["Country"] as! String)\(dict!["City"] as! String)\(dict!["Street"] as! String)"
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
        // Dispose of any resources that can be recreated.
    }

}

