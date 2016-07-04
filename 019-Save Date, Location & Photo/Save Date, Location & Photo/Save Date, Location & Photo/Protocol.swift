//
//  Protocol.swift
//  Save Date, Location & Photo
//
//  Created by MungYu-Lin on 16/7/4.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation

//协议，定义代理要实现的方法
protocol ModeViewControlDelegate: NSObjectProtocol {
    func changeData(user: [String: String])
}