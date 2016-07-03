//
//  myTableViewCell.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/7/3.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var noteLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
