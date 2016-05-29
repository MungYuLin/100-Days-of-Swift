//
//  ContactModel.swift
//  From Sketch to XCode
//
//  Created by MungYu-Lin on 16/5/29.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation

let projects = ["TAP COUNTER", "TAP OR HOLD COUNTER", "SWIFT IAD", "TIP CALCULATOR", "BASIC TABLE VIEW", "GETTING CURRENT DATE AND TIME", "PASSING DATA TO ANOTHER VIEW", "SWIPE TO DISMISS KEYBOARD", "ADD PHOTO FROM CAMERA ROLL", "PULL TO REFRESH TABLE VIEW", "DELETING AND REARRANGING", "ADD NEW ITEM", "STICKY SECTION HEADERS", "JUMPBAR", "FROM SKETCH TO XCODE", "BUILDING THE USER INTERFACE", "THE MODEL AND CONTROLLERS", "DYNAMIC DATA FOR EACH CELL", "BUTTONS ABOVE KEYBOARD", "SAVE DATE, LOCATION & PHOTO", "SET LOCATION", "SETTING THE DATE", "CHANGE DATE AND TIME", "CUSTOM COLLECTION VIEW", "SCROLL VIEWS", "ACTION SHEET", "SEARCH BAR IN TABLE VIEW", "IMAGE CAROUSEL", "MUTIPLE COLLECTION VIEWS", "SEGMENTED CONTROL VIEWS", "CUSTOM SEARCH RESULTS", "BASIC ANIMATION", "CUSTOM SWIPE TRANSITIONS", "SPRING ANIMATIONS", "CORE ANIMATION & MASKS 1", "CORE ANIMATION & MASKS 2", "CUSTOM TRANSITIONS", "INTERACTIVE TRANSITIONS", "EMBEDDED COLLECTION VIEW", "STRETCHY HEADER"]

class ContactModel {
    var dict = Dictionary<String, [NSObject]>()
    var keys = [String]()
    
    init() {
        for project in projects {
            let firstLetter = (project as NSString).substringToIndex(1).uppercaseString
            if var value = self.dict[firstLetter] {
                value.append(User(contact: project.capitalizedString))
                self.dict[firstLetter] = value
            }
            else {
                self.dict[firstLetter] = [User(contact: project.capitalizedString)]
            }
        }
        keys = self.dict.keys.sort()
    }
}

class User: NSObject {
    var Ico: String?
    var Name: String?
    var Mobile: String?
    var Email: String?
    var Notes: String?
    
    init(contact: String) {
        Ico = "cog-wheel.png"
        Name = contact
        Mobile = "181xxxxxxxx"
        Email = "888888@qq.com"
        Notes = "we are 伐木累"
    }
    
//    override init() {
//        super.init()
//    }
//    
//    convenience init(contact: String) {
//        self.init()
//        Ico = "cog-wheel.png"
//        Name = contact
//        Mobile = "181xxxxxxxx"
//        Email = "888888@qq.com"
//        Notes = "we are 伐木累"
//    }
}