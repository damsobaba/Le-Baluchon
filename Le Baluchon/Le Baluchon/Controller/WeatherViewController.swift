//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var NEWyORKLabel: UILabel!
    
    @IBOutlet weak var newYorkSkyLabel: UILabel!
    
    
    @IBOutlet weak var newYorkWindSpeedLabel: UILabel!
    
    
    @IBOutlet weak var newYorkSkyImage: UIImageView!
    
    let weatherService = WeatherService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        
        self.newYorkWindSpeedLabel.text = String(Int(weatherData.list[0].main["temp"]!)) + "°"
        self.newYorkWindSpeedLabel.text = String(Int(weatherData.list[0].main["temp_min"]!)) + "° / " + String(Int(weatherData.list[0].main["temp_max"]!)) + "°"
        self.NEWyORKLabel.text = "humidité: " + String(Int(weatherData.list[0].main["humidity"]!)) + " %"
        self.newYorkWindSpeedLabel.text = "vent: " + String(Int(weatherData.list[0].wind["speed"]!)) + " km/h"
           self.newYorkSkyImage.image = UIImage(named: weatherData.list[0].weather[0].icon)
        self.newYorkSkyLabel.text = weatherData.list[0].weather[0].description
    }
}

