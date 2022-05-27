//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twntyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        twntyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from title then turn it back to string
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        // Cast Number to String for text of label
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billAmount = Double(billTextField.text!) ?? 0.0
        let tipAmount = billAmount * tip // 25
        let total = billAmount + tipAmount // 150 = 125 + 25
        let result = total / Double(numberOfPeople)
        print(Float(result))

   }
}

