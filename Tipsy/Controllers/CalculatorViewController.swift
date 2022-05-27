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
    var result = 0.0
    var finalResult = "0.0"
    
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
        
        let billAmount = billTextField.text!
        
        let doubleBill = Double(billAmount) ?? 0.0
        let tipAmount = doubleBill * (tip) // 25
        let total = doubleBill + tipAmount // 150 = 125 + 25
        result = total / Double(numberOfPeople)
        finalResult = String(format: "%.0f",result)

        self.performSegue(withIdentifier: "goToResult", sender: self)
   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let desinationVC = segue.destination as! ResultsViewController //as means force Downcasting
            desinationVC.totaltitle = finalResult
            desinationVC.tip = Int(tip*100)
            desinationVC.split = numberOfPeople

        }
    }
}

