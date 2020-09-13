//
//  Currency.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 26/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation



class CurrencyService {

 private let httpClient: HTTPClient
 private var task: URLSessionDataTask?

 init(httpClient: HTTPClient = HTTPClient()){
        self.httpClient = httpClient
    }

//    private var task: URLSessionDataTask?
//
//      private var currencySession: URLSession
//
//      init(currencySession: URLSession = URLSession(configuration: .default)) {
//         self.currencySession = currencySession
//
//      }
    
    func getCurrency( callback: @escaping (Result<Double, NetworkError>) -> Void) {
        //        let request = CurrencyService.currencyUrl
        guard let url = URL(string: "http://data.fixer.io/api/latest") else {return}

        httpClient.request(baseUrl: url, parameters: [("access_key", "218e80355485a2d12beb99bfb1a1489c"),("symbols","USD")])  { (result: Result<Currency, NetworkError>) in
                       switch result {
                       case .success(let data):
                        callback(.success(data.rates.usd))
                       case .failure(let error):
                           callback(.failure(error))
                       }
            
                   }
        }
    }

