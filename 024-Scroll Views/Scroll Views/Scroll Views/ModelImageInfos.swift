//
//  ModelImageInfos.swift
//  Scroll Views
//
//  Created by MungYu-Lin on 16/7/14.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit


class ModelImageInfos: NSObject {
    
    var id: String!
    var image: String!
    var like: Int!
    var info: String!
    var tags: [String]!
    
    override init() {
        super.init()
    }

    init(id: String, image: String, like: String, info: String, tag: String) {
        self.id = id
        self.image = image
        self.like = Int(like)!
        self.info = info
        self.tags = tag.componentsSeparatedByString(",")
    }
    
    init(coder aDecoder: NSCoder!){
        self.id = aDecoder.decodeObjectForKey("id") as! String
        self.image = aDecoder.decodeObjectForKey("image") as! String
        self.like = aDecoder.decodeObjectForKey("likes") as! Int
        self.info = aDecoder.decodeObjectForKey("info") as! String
        self.tags = aDecoder.decodeObjectForKey("tag") as! [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder!){
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(image, forKey: "image")
        aCoder.encodeObject(like, forKey: "like")
        aCoder.encodeObject(info, forKey: "info")
        aCoder.encodeObject(tags, forKey: "tag")
    }
}

