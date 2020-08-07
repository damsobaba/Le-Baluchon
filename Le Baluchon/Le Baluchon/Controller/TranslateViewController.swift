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
        adjustCorner()
}
    
    
    @IBOutlet weak var frenchTranslateTextView: UITextView!
    @IBOutlet weak var englishTranslateTexView: UITextView!
    
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func translateTappedButton(_ sender: Any) {
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


    func adjustCorner() {
        frenchTranslateTextView.layer.cornerRadius = 10
        englishTranslateTexView.layer.cornerRadius = 10
    }

}
