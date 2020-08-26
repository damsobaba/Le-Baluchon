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
    let translateService = TranslateService()
    
    
    @IBOutlet weak var frenchTranslateTextView: UITextView!
    @IBOutlet weak var englishTranslateTexView: UITextView!
    
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func translateTappedButton(_ sender: Any) {
        toggleActivityIndicator(shown: true)
        guard let text = frenchTranslateTextView.text else { return }
        self.translateService.getTranslation(text: text){ result in
            switch result {
            case .success(let translates):
                DispatchQueue.main.async {
                    self.toggleActivityIndicator(shown: false)
                    self.refreshView(data: translates) 
                }
            case .failure(let error):
                self.presentAlert()
                print(error)
            }
        }
    }
    
    
   private func refreshView(data: Translate) {
          englishTranslateTexView.text = data.data.translations[0].translatedText
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
