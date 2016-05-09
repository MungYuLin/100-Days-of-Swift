//
//  Calculator.swift
//  Tip Calculator
//
//  Created by MungYu-Lin on 16/5/9.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation
import UIKit

class CalculatorModal: NSObject {
    
    var importValue: String = ""
    var money: Double = 0.0
    var tipMoney: Double = 0.0
    var currentValue: Int = 0
    
    func getTotleMoney() -> String {
        return "$\(NSString(format: "%.2f", money + tipMoney))"
    }
    
    func getTipMoney() -> String {
        return "$\(NSString(format: "%.2f", tipMoney))"
    }
    
    func getCurrentValue() -> String {
        return "Tip(\(currentValue)%)"
    }
    
    func getMoney() -> String {
        return "$\(NSString(format: "%.2f", money))"
    }
}