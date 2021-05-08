//
//  ViewController.swift
//  TipCalculator
//
//  Created by shunnamiki on 2021/05/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var tipAmountLabel: UILabel!
    
    @IBOutlet var billAmountTextField: UITextField!
    
    let tipRate: Double = 15
    
    @IBAction func calculateTipTapped(_ sender: UIButton) {
        guard billAmountTextField.hasText else { return }
        let text: String = billAmountTextField.text!
        if let num = Int(text) {
            let amount = Double(num) * ( 1.0 + tipRate / 100.0 )
            tipAmountLabel.text = String(Int(amount))
        }
    }
    
    
   
    
}

