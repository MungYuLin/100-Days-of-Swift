//
//  ImagesCollectionViewCell.swift
//  Custom Collection View
//
//  Created by MungYu-Lin on 16/7/9.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class MyTestCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        self.contentView.addSubview(self.imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
}