//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

final class CurrencyViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private let currencyService = CurrencyService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        euroTextField.resignFirstResponder()
        return true
    }
    
    private func adjustCorner() {
        convertButton.layer.cornerRadius = 10
    }
    ///enable to show activiy controler while loading
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        convertButton.isHidden = shown
    }
    
    // MARK: - Actions
    
    @IBAction private func dismissKeyboard(_ sender: UITapGestureRecognizer) { // enable to leave keuboard
        euroTextField.resignFirstResponder()
    }
    @IBAction private func convertTapedButton(_ sender: Any) {
        toggleActivityIndicator(shown: true)
        currencyService.getCurrency { [unowned self] result in
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
