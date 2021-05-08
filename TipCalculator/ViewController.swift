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
        billAmountTextField.placeholder = "Bill Amount"
        tipPercentageTextField.placeholder = "Tip Percentage"
        
        registerForKeyboardNotifications()
    }

    @IBOutlet var tipAmountLabel: UILabel!
    
    @IBOutlet var billAmountTextField: UITextField!
    
    let tipRate: Double = 15
    
    @IBAction func calculateTipTapped(_ sender: UIButton) {
        guard billAmountTextField.hasText else { return }
        let text: String = billAmountTextField.text!
        if let inputAmount = Int(text) {
            
            let percentage = Double(tipPercentageTextField.text ?? "0")!
            
            let amount = Double(inputAmount) * ( 1.0 + percentage / 100.0 )
            tipAmountLabel.text = String(Int(amount))
            
        }
    }
    
    
    @IBOutlet var tipPercentageTextField: UITextField!
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notification: Notification){
        print(#function)
    }
    
    @objc func keyboardWillBeHidden(_ notification: Notification){
        print(#function)
    }
}

