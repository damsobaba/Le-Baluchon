//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var temperatureLabel: [UILabel]!
    @IBOutlet var skyConditionLabel: [UILabel]!
    @IBOutlet var windConditionLabel: [UILabel]!
    @IBOutlet weak var newYorkSkyImage: UIImageView!
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
        for i in 0...1 {
            self.newYorkSkyImage.image = UIImage(named: weatherData.list[0].weather[0].icon)
            self.fontenaySkyImage.image = UIImage(named: weatherData.list[1].weather[0].icon)
            self.temperatureLabel[i].text = String(Int(weatherData.list[i+0].main["temp"]!)) + "°"
            self.windConditionLabel[i].text = "wind: " + String(Int(weatherData.list[i+0].wind["speed"]!)) + " km/h"
            self.skyConditionLabel[i].text = weatherData.list[i+0].weather[0].description
        }
    }
    
    func adjustCorner() {
        temperatureLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
        skyConditionLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
        windConditionLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
    }
    
}
