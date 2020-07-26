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
    
    
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    @IBAction func convertTapedButton(_ sender: Any) {
    }
    
    @IBAction func  dismissKeyboard(_ sender: UITapGestureRecognizer) {
        dollarTextField.resignFirstResponder()
        euroTextField.resignFirstResponder()
    }
    func searchWeither() {
        toggleActivityIndicator(shown: true)
        //LogoService.shared.getLogo(domain: domain) { (success, data) in
        self.toggleActivityIndicator(shown: false)
        // if  success, let data = data {
        //          self.updateImage(with: data)
        //   } else {
        //      self.presentAlert()
    }
    
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        convertButton.isHidden = shown
    }
    
    
    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "Could not convert currency.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
