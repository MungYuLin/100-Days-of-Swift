//
//  DetailsView.swift
//  Scroll Views
//
//  Created by MungYu-Lin on 16/7/13.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {
    
    var imageInfo = ModelImageInfos()
    let screenWidth = UIScreen .mainScreen().bounds.width
    let screenHeight = UIScreen .mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let rightButton = UIBarButtonItem(title: "...", style: .Plain, target: self, action: #selector(showAction))
        self.view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = rightButton
        
        let imageView = UIImageView(frame: CGRectMake(10, 10, screenWidth, screenHeight / 2))
        self.view.addSubview(imageView)
        let likeLable = UILabel(frame: CGRectMake(10, screenHeight / 2 + 50, self.view.bounds.size.width, 50))
        let infoLable = UILabel(frame: CGRectMake(10, screenHeight / 2 + 100, self.view.bounds.size.width, 200))
        let tagLable = UILabel(frame: CGRectMake(10, screenHeight / 2 + 150, self.view.bounds.size.width, 50))
        self.view.addSubview(likeLable)
        self.view.addSubview(infoLable)
        self.view.addSubview(tagLable)
        
        imageView.image = UIImage(named: imageInfo.image)
        likeLable.text = " \(imageInfo.like) likes"
        infoLable.text = imageInfo.info
        for item in imageInfo.tags {
            tagLable.text! += "#\(item) "
        }
    }
    
    func showAction() {
        print("詳情")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}