//
//  ViewController.swift
//  Custom Collection View
//
//  Created by MungYu-Lin on 16/7/9.
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
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Photos"
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, screenWidth, 65))
        navigationBar.pushNavigationItem(navigationItem, animated: true)
        self.view.addSubview(navigationBar)
        
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
        
        // 設置CollectionView
        let ourCollectionView: UICollectionView = UICollectionView(frame: CGRectMake(0, 65, screenWidth, screenHeight-65), collectionViewLayout: layout)
        ourCollectionView.delegate = self
        ourCollectionView.dataSource = self
        ourCollectionView.backgroundColor = UIColor.whiteColor()
        ourCollectionView.registerClass(MyTestCollectionViewCell.self, forCellWithReuseIdentifier: idenContentString)
        
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
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier(idenContentString, forIndexPath: indexPath) as! MyTestCollectionViewCell
        cell.backgroundColor = UIColor.grayColor()
        cell.imageView.image = UIImage.init(named: "p-\(indexPath.row + 1).jpg")
        return cell;
    }
    
    // item單擊事件
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("點擊了第\(indexPath.row)張圖片！")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




