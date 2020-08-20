//
//  TranslateService.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 05/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation


enum WeatherNetworkError: Error {
    case noData, incorrectResponse, undecodableData
}

class WeatherService {
    private var task: URLSessionDataTask?
    
    private var weatherSession: URLSession
    
    init(weatherSession: URLSession = URLSession(configuration: .default)) {
        self.weatherSession = weatherSession
        
    }
    func getWeather(callback: @escaping (Result<WeatherData, WeatherNetworkError>) -> Void) {
       
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/group?id=5128581,6452019&units=metric&appid=fd14af8a57ca38e062012f6fc2a2d587") else {return}
        
        task?.cancel()
    
        task = weatherSession.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.incorrectResponse))
                return
            }
            guard let responseJSON = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                
                callback(.failure(.undecodableData))
                return
            }
            callback(.success(responseJSON))
            print(responseJSON)

        }
        task?.resume()
    }
}
