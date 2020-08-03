//
//  UIViewController+Alert.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 30/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit
extension UIViewController {
   func presentAlert() {
          let alertVC = UIAlertController(title: "Error", message: "they have been a error", preferredStyle: .alert)
          alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
          present(alertVC, animated: true, completion: nil)
      }
}
