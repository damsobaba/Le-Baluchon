//
//  TranslateViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

final class TranslateViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var frenchTranslateTextView: UITextView!
    @IBOutlet private weak var englishTranslateTexView: UITextView!
    @IBOutlet private weak var translateButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
     // MARK: - Parameters
    
     private let translateService = TranslateService()
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()
       
        adjustCorner()
    }
  
    private func refreshView(data: Translate) {
        englishTranslateTexView.text = data.data.translations[0].translatedText
    }
    ///enable to show activiy controler while loading
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        translateButton.isHidden = shown
    }
    private func adjustCorner() {
        frenchTranslateTextView.layer.cornerRadius = 10
        englishTranslateTexView.layer.cornerRadius = 10
        translateButton.layer.cornerRadius = 10
    }
    
    // MARK: - Actions
    
    @IBAction private func DismissKeyboard(_ sender: UITapGestureRecognizer) { // enable to leave the keyboard
        frenchTranslateTextView.resignFirstResponder()
        englishTranslateTexView.resignFirstResponder()
    }
    /// translate text input when buton pressed
    @IBAction private func translateTappedButton(_ sender: Any) {
        toggleActivityIndicator(shown: true)
        guard let text = frenchTranslateTextView.text else { return }
        self.translateService.getTranslation(text: text){ [unowned self] result in
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
}



