//
//  protocol.swift
//  Change Date And Time
//
//  Created by MungYu-Lin on 16/7/7.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation

//代理传值，定义代理要实现的方法
protocol ModeViewControlDelegate: NSObjectProtocol {
    func currentDate(dateTime: String)
}