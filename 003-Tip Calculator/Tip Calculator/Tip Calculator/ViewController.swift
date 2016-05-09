//
//  ViewController.swift
//  Tip Calculator
//
//  Created by MungYu-Lin on 16/5/8.
//  Copyright © 2016年 MY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var moneyValueText: UITextField!
    @IBOutlet weak var tipSliderValueLable: UILabel!
    @IBOutlet weak var tipMoneyLable: UILabel!
    @IBOutlet weak var totleMoneyLable: UILabel!
    
    var repository = CalculatorModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToolBar(moneyValueText)
        
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 15
        
        moneyValueText.placeholder = "$0.00"
        moneyValueText.keyboardType = UIKeyboardType.DecimalPad
        moneyValueText.clearButtonMode = UITextFieldViewMode.WhileEditing
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        repository.currentValue = Int(sender.value)
        tipSliderValueLable.text = repository.getCurrentValue()
        
        repository.tipMoney = Double(repository.currentValue) / 100 * repository.money
        tipMoneyLable.text = repository.getTipMoney()
        totleMoneyLable.text = repository.getTotleMoney()
    }
    
    @IBAction func textFieldDidBeginEditing(sender: UITextField) {
        if(repository.importValue.isEmpty) {
            sender.text = ""
        } else {
            sender.text = repository.importValue
        }
    }
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        if(sender.text!.isEmpty) {
            repository.importValue = ""
            repository.money = 0.0
        } else {
            repository.importValue = sender.text!
            repository.money = Double(repository.importValue)!
        }
        
        slider.value = 15
        repository.currentValue = 15
        tipSliderValueLable.text = repository.getCurrentValue()
        
        repository.tipMoney = Double(repository.currentValue) / 100 * repository.money
        tipMoneyLable.text = repository.getTipMoney()
        totleMoneyLable.text = repository.getTotleMoney()
        
        if(repository.importValue.isEmpty) {
            sender.text = ""
        } else {
            sender.text = repository.getMoney()
        }
    }
    
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewController.donePressed))
        toolBar.setItems([doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func donePressed(){
        view.endEditing(true)
    }
    
    func cancelPressed(){
        view.endEditing(true)
    }
}

