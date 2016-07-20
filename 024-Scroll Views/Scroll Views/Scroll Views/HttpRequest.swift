//
//  HttpRequest.swift
//  Scroll Views
//
//  Created by MungYu-Lin on 16/7/20.
//  Copyright © 2016年 MY. All rights reserved.
//

import Foundation

// 1.使用PHP连接数据库并获取数据，返回json；通过NSURL获取数据
// 2.使用SQLite.Swift库进行数据库操作
class HttpRequest {
    class func request(urlStr: String, complete: (responseData: [ModelImageInfos], errorText: String?) -> ()) {
        let url = NSURL(string: urlStr)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            var err: String?
            var list = [ModelImageInfos]()
            if (data?.length > 0 && error == nil) {
                let result = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments) as! NSArray
                for item in result {
                    list.append(ModelImageInfos(
                        id: item.objectForKey("id") as! String,
                        image: item.objectForKey("image") as! String,
                        like: item.objectForKey("likes") as! String,
                        info: item.objectForKey("info") as! String,
                        tag: item.objectForKey("tag") as! String
                        ))
                }
            } else if (data?.length > 0 && error == nil) {
                err = "數據爲空！"
            } else {
                err = "\(error?.localizedDescription)"
            }
            complete(responseData: list, errorText: err)
        }
        task.resume()
    }
}