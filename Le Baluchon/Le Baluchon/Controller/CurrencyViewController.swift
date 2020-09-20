//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UITextFieldDelegate {
    
     // MARK: - Outlets
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    let currencyService = CurrencyService()
    
    override func viewDidLoad() {
       // textFieldShouldReturn(euroTextField)
    super.viewDidLoad()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    euroTextField.resignFirstResponder()
        return true
    }
    func adjustCorner() {
        convertButton.layer.cornerRadius = 10
    }
    ///enable to show activiy controler while loading
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        convertButton.isHidden = shown
    }
    
    // MARK: - Actions
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) { // enable to leave keuboard
        euroTextField.resignFirstResponder()
    }
    @IBAction func convertTapedButton(_ sender: Any) {
        self.toggleActivityIndicator(shown: true)
        self.currencyService.getCurrency { result in
            switch result {
            case .success(let rate):
                DispatchQueue.main.async {
                    self.toggleActivityIndicator(shown: false)
                    guard let euroAmountText = self.euroTextField.text else { return }
                    guard let euroAmount = Double(euroAmountText) else { return self.presentAlertWrongNumber() }
                    self.dollarTextField.text = String(euroAmount*rate)
                }
            case .failure(let error):
                self.presentAlert()
                print(error)
            }
        }
    }
}
