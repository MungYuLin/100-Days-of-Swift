//
//  ViewController.swift
//  Scroll Views
//
//  Created by MungYu-Lin on 16/7/13.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let screenWidth = UIScreen .mainScreen().bounds.width
    let screenHeight = UIScreen .mainScreen().bounds.height
    let idenContentString = "idenContentString"
    let headIdenString = "headIdenString"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photos"
        // 設置狀態欄前景色
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        // 設置導航欄包括狀態欄背景色
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
        // 設置導航欄前景色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        // 設置導航欄按鈕前景色
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.automaticallyAdjustsScrollViewInsets = true
        self.makeUICollectionView()
        
        // 1.使用PHP连接数据库并获取数据，返回json；通过NSURL获取数据
        // 2.使用SQLite.Swift库进行数据库操作
        
        let urlPath: String = "https://localhost/swift-php/swiftconnapi.php"
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        
        do {
            let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal, options: []) as? NSDictionary {
                    print("Synchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func makeUICollectionView()
    {
        // 設置layOut
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.itemSize = CGSizeMake(screenWidth / 2, 150)
        // Item垂直間隔
        layout.minimumLineSpacing = 0
        // Item水平間隔
        layout.minimumInteritemSpacing = 0
        
        // 設置CollectionView
        let ourCollectionView: UICollectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight), collectionViewLayout: layout)
        ourCollectionView.delegate = self
        ourCollectionView.dataSource = self
        ourCollectionView.backgroundColor = UIColor.whiteColor()
        ourCollectionView.registerClass(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: idenContentString)
        
        self.view .addSubview(ourCollectionView)
    }
    
    // 設置組數量
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 設置每個組的Item
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // 自定義Item
    func  collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier(idenContentString, forIndexPath: indexPath) as! ImagesCollectionViewCell
        cell.backgroundColor = UIColor.grayColor()
        cell.imageView.image = UIImage.init(named: "p-\(indexPath.row + 1).jpg")
        return cell;
    }
    
    // item單擊事件
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("點擊了第\(indexPath.row)張圖片！")
        let nextVC = DetailsView()
        navigationController!.pushViewController(nextVC, animated:true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

