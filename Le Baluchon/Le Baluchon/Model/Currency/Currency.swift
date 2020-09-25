//
//  Currency.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 30/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

// MARK: - Currency
struct Currency: Decodable {
    let rates: Rates
}

// MARK: - Rates
struct Rates: Decodable {
    let usd: Double

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
