//
//  NetworkError.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 25/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation
/// error case 
enum NetworkError: Error, CustomStringConvertible {
    case noData
    case noResponse
    case undecodableData

    var description: String {
        switch self {
        case .noData:
            return "There is no data !"
        case .noResponse:
            return "Response status is incorrect !"
        case .undecodableData:
            return "Data can't be decoded !"
        }
    }
}
