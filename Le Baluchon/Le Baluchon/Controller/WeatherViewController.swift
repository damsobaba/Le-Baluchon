//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var searchWeatherButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    @IBAction func tappedSearchButton(_ sender: Any) {
    }
    
    
    @IBAction func  dismissKeyboard(_ sender: UITapGestureRecognizer) {
        
        locationTextField.resignFirstResponder()
        destinationTextField.resignFirstResponder()
           
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
         searchWeatherButton.isHidden = shown
     }

  
     private func presentAlert() {
         let alertVC = UIAlertController(title: "Error", message: "Could not find a weather.", preferredStyle: .alert)
         alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
         present(alertVC, animated: true, completion: nil)
     }
}
