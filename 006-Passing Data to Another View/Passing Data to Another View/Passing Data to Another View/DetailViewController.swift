//
//  DetailViewController.swift
//  Passing Data to Another View
//
//  Created by MungYu-Lin on 16/5/14.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    var textField: UITextView!
    var oldInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First View"
        self.view.backgroundColor = UIColor.whiteColor()
        showDetailView()
        
        let btn = UIBarButtonItem(title:"Done", style: .Plain, target: self, action: #selector(DetailViewController.doneClicked))
        navigationItem.rightBarButtonItem = btn
    }
    
    func showDetailView() {
        textField = UITextView(
            frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 60))
        textField.text = oldInfo
        self.view.addSubview(textField)
    }
    
    func doneClicked() {
        let viewController = ViewController()
        for (index, value) in viewController.list.enumerate() {
            if(value == oldInfo) {
                viewController.list[index] = textField.text!
                break
            }
        }
        viewController.tableView!.reloadData()
        navigationController!.popToRootViewControllerAnimated(true)
    }
}