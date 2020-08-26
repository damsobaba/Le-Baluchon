//
//  TranslateService.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 05/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation



class WeatherService {
    
    private let httpClient: HTTPClient
    private var task: URLSessionDataTask?
    
    init(httpClient: HTTPClient = HTTPClient()){
           self.httpClient = httpClient
       }
    
    
    
    func getWeather(callback: @escaping (Result<WeatherData, NetworkError>) -> Void) {
       
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/group?") else {return}
        
        httpClient.request(baseUrl: url, parameters: [("id", "5128581,2968815"), ("appid","fd14af8a57ca38e062012f6fc2a2d587"), ("units", "metric")])  { (result: Result<WeatherData, NetworkError>) in
                   switch result {
                   case .success(let data):
                       callback(.success(data))
                       
                   case .failure(let error):
                       callback(.failure(error))
                   }
               }
           }
       
      
}

