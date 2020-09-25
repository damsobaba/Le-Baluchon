//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var temperatureLabel: [UILabel]!
    @IBOutlet private var skyConditionLabel: [UILabel]!
    @IBOutlet private var windConditionLabel: [UILabel]!
    @IBOutlet private weak var newYorkSkyImage: UIImageView!
    @IBOutlet private weak var fontenaySkyImage: UIImageView!
    
    // MARK: - Properties
    private let weatherService = WeatherService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustCorner()
        weatherUpdate()
    }
    
    private func weatherUpdate () { 
        self.weatherService.getWeather { [unowned self] result in
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
        for i in 0...1 { // loop to update all labels and images
            self.newYorkSkyImage.image = UIImage(named: weatherData.list[0].weather[0].icon)
            self.fontenaySkyImage.image = UIImage(named: weatherData.list[1].weather[0].icon)
            self.temperatureLabel[i].text = String(Int(weatherData.list[i+0].main["temp"]!)) + "°"
            self.windConditionLabel[i].text = "wind: " + String(Int(weatherData.list[i+0].wind["speed"]!)) + " km/h"
            self.skyConditionLabel[i].text = weatherData.list[i+0].weather[0].description
        }
    }
    
   private func adjustCorner() {
        temperatureLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
        skyConditionLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
        windConditionLabel.forEach { $0.layer.masksToBounds = true; $0.layer.cornerRadius = 5}
    }
    
}
