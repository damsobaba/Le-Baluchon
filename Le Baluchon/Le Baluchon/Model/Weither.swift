//
//  Translate.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 26/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let list: [List]
}

struct List: Decodable {
    let main: [String: Double]
    let weather: [Weather]
    let wind: [String:Double]
    let name: String
}

struct Weather: Decodable{
    let main: String
    let description: String
    let icon: String
}

