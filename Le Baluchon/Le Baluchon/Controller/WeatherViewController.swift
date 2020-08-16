//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var newYorkTempearatueLabel: UILabel!
    @IBOutlet weak var newYorkSkyLabel: UILabel!
    @IBOutlet weak var newYorkWindSpeedLabel: UILabel!
    @IBOutlet weak var newYorkSkyImage: UIImageView!
    
    @IBOutlet weak var fontenayTemparatureLabel: UILabel!
    @IBOutlet weak var fontenaySkyLabel: UILabel!
    @IBOutlet weak var fontenayWindSpeedLabel: UILabel!
    @IBOutlet weak var fontenaySkyImage: UIImageView!
    
    
    
    let weatherService = WeatherService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustCorner()
        weatherUpdate()
        
    }
    
    
    
    private func weatherUpdate () {
        self.weatherService.getWeather { result in
            switch result {
            case .success(let weatherDescription):
                DispatchQueue.main.async {
                    self.refreshViews(weatherData: weatherDescription)
                }
            case .failure(let error):
                self.presentAlert()
                print(error)
            }
        }
    }
    
    
    private func refreshViews(weatherData: WeatherData){
        
        
        self.newYorkTempearatueLabel.text = String(Int(weatherData.list[0].main["temp"]!)) + "°"
        self.newYorkWindSpeedLabel.text = "wind: " + String(Int(weatherData.list[0].wind["speed"]!)) + " km/h"
        self.newYorkSkyImage.image = UIImage(named: weatherData.list[0].weather[0].icon)
        self.newYorkSkyLabel.text = weatherData.list[0].weather[0].description
        
        self.fontenayTemparatureLabel.text = String(Int(weatherData.list[1].main["temp"]!)) + "°"
        self.fontenayWindSpeedLabel.text = "wind: " + String(Int(weatherData.list[1].wind["speed"]!)) + " km/h"
        self.fontenaySkyImage.image = UIImage(named: weatherData.list[1].weather[0].icon)
        self.fontenaySkyLabel.text = weatherData.list[1].weather[0].description
    }
    
    func adjustCorner() {
        newYorkTempearatueLabel.layer.masksToBounds = true
        newYorkTempearatueLabel.layer.cornerRadius = 5
        newYorkWindSpeedLabel.layer.masksToBounds = true
        newYorkWindSpeedLabel.layer.cornerRadius = 5
        newYorkSkyLabel.layer.masksToBounds = true
        newYorkSkyLabel.layer.cornerRadius = 5
        
        fontenayTemparatureLabel.layer.masksToBounds = true
        fontenayTemparatureLabel.layer.cornerRadius = 5
        fontenayWindSpeedLabel.layer.masksToBounds = true
        fontenayWindSpeedLabel.layer.cornerRadius = 5
        fontenaySkyLabel.layer.masksToBounds = true
        fontenaySkyLabel.layer.cornerRadius = 5
    }
}

