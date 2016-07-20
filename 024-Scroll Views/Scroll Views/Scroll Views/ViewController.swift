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
    let url = "http://localhost/APIProject/swiftconnapi.php"
    
    var imageData = [ModelImageInfos]()
    var ourCollectionView = UICollectionView()
    
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
        
        HttpRequest.request(url, complete: { (responseData, errorText) -> () in
            if let err = errorText {
                print("數據獲取失敗，錯誤信息：\(err)")
            } else {
                self.imageData = responseData
            }
        })
        
        // 設置CollectionView
        ourCollectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight), collectionViewLayout: layout)
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
        let data = self.imageData
        cell.imageView.image = UIImage.init(named: data[indexPath.row].image)
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let controller = segue.destinationViewController as? DetailsView
        // var indexpath = self.ourCollectionView.indexPathsForSelectedItems()
        let indexPath = self.ourCollectionView.indexPathForCell(sender as! UICollectionViewCell)
        controller!.imageInfo.id = imageData[indexPath!.row].id
        controller!.imageInfo.like = imageData[indexPath!.row].like
        controller!.imageInfo.image = imageData[indexPath!.row].image
        controller!.imageInfo.info = imageData[indexPath!.row].info
        controller!.imageInfo.tags = imageData[indexPath!.row].tags
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

