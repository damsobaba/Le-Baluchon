//
//  TranslateViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var frenchTextField: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func translateTappedButton(_ sender: Any) {
    }
    
    
    @IBAction func  dismissKeyboard(_ sender: UITapGestureRecognizer) {
        englishTextField.resignFirstResponder()
        frenchTextField.resignFirstResponder()
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
            translateButton.isHidden = shown
        }

     
        private func presentAlert() {
            let alertVC = UIAlertController(title: "Error", message: "Could not translate the language.", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVC, animated: true, completion: nil)
        }
 

}
