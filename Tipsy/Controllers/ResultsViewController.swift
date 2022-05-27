//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Elahe  Sharifi on 26/05/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totaltitle = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totaltitle
        settingsLabel.text = "Split between \(split) people with \(tip)% tip "
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
