//
//  ViewController.swift
//  TipCalculator
//
//  Created by shunnamiki on 2021/05/07.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.placeholder = "Bill Amount"
        registerForKeyboardNotifications()
    }


    @IBOutlet var tipAmountLabel: UILabel!
    
    @IBOutlet var billAmountTextField: UITextField!
    
    let tipRate: Double = 15
    
    @IBOutlet var subview: UIScrollView!
    
    @IBAction func calculateTipTapped(_ sender: UIButton) {
        guard billAmountTextField.hasText else { return }
        let text: String = billAmountTextField.text!
        if let inputAmount = Int(text) {
            
            let percentage = Double(adjustTipPercentage.value)
            
            let amount = Double(inputAmount) * ( 1.0 + percentage / 100.0 )
            tipAmountLabel.text = String(Int(amount))
            
        }
    }
    
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notification: Notification){
        print(#function)
        print("____")
        
        guard let info = notification.userInfo,
              let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as?  NSValue else { return }

        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        let contentInsents = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height
                                          , right: 0.0)
        

        print(keyboardSize.height)
        subview.contentInset = contentInsents
        subview.scrollIndicatorInsets = contentInsents
    }
    
    @objc func keyboardWillBeHidden(_ notification: Notification){
        let contentInset = UIEdgeInsets.zero
        subview.contentInset = contentInset
        subview.scrollIndicatorInsets = contentInset
        print(#function)
    }
    
    @IBOutlet var adjustTipPercentage: UISlider!
}

