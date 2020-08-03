//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   // http://data.fixer.io/api/latest?access_key=218e80355485a2d12beb99bfb1a1489c
    
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let currencyService = CurrencyService()
    
    @IBAction func convertTapedButton(_ sender: Any) {
        DispatchQueue.main.async {
            self.toggleActivityIndicator(shown: true)
            self.currencyService.getCurrency { result in
                switch result {
                case .success(let currency):
                    self.update(currency: currency)
                case .failure(let error):
                    self.presentAlert()
                   print(error)
                }
            }
        }
     
//               currencyService.getCurrency { (success, currency) in
//                   self.toggleActivityIndicator(shown: false)
//                       if success, let currency = currency {
//                        self.update(currency: currency) }
//                       }else {
//                           self.presentAlert()
//                       }
//                   }
    }
    
    @IBAction func  dismissKeyboard(_ sender: UITapGestureRecognizer) {
        dollarTextField.resignFirstResponder()
        euroTextField.resignFirstResponder()
    }
    
   private func update(currency: Currency) {
//       euroTextField.text = currency.base
    dollarTextField.text = "\(currency.rates) "
   
   }

    
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        convertButton.isHidden = shown
    }
    
    
   
    
    
    
    
    
    
}
