//
//  ViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var MainScrollView: UIScrollView!
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currencyView = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyViewController")as! CurrencyViewController
        let translateView =  self.storyboard?.instantiateViewController(withIdentifier: "TranslateViewController")as! TranslateViewController
        let weatherView =  self.storyboard?.instantiateViewController(identifier: "WeatherViewController")as! WeatherViewController
        
        
        // First View
        self.addChild(currencyView)
        self.MainScrollView.addSubview(currencyView.view)
        currencyView.didMove(toParent: self)
        
        // Second view
        self.addChild(translateView)
        self.MainScrollView.addSubview(translateView.view)
        translateView.didMove(toParent: self)
        
        // Third view
        self.addChild(weatherView)
        self.MainScrollView.addSubview(weatherView.view)
        weatherView.didMove(toParent: self)
        
        //Frame
        
        var secondFrame: CGRect = translateView.view.frame
        secondFrame.origin.x = self.view.frame.width
        translateView.view.frame = secondFrame
        
        
        var thirdFrame: CGRect = weatherView.view.frame
        thirdFrame.origin.x = 2 * self.view.frame.width
        weatherView.view.frame = thirdFrame
        
        self.MainScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        self.MainScrollView.contentOffset.x += view.frame.width
        
        
    }
    
    
}

