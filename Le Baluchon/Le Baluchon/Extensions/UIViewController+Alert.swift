//
//  UIViewController+Alert.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 30/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit
extension UIViewController {
    ///present allert
   func presentAlert() {
          let alertVC = UIAlertController(title: "Error", message: "An error as occured", preferredStyle: .alert)
          alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
          present(alertVC, animated: true, completion: nil)
      }
    func presentAlertWrongNumber() {
           let alertVC = UIAlertController(title: "Error", message: "Please enter a correct ammount", preferredStyle: .alert)
           alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
           present(alertVC, animated: true, completion: nil)
       }
}
