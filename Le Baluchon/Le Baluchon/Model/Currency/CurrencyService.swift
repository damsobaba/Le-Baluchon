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
    
    func getCurrency( callback: @escaping (Result<Double, NetworkError>) -> Void) {
        //        let request = CurrencyService.currencyUrl
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=218e80355485a2d12beb99bfb1a1489c&symbols=USD") else {return}
        
//        task?.cancel()
//        
//        task = currencySession.dataTask(with: url) { (data, response, error) in
//            guard let data = data, error == nil else {
//                callback(.failure(.noData))
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                callback(.failure(.incorrectResponse))
//                return
//            }
//            guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
//                
//                callback(.failure(.undecodableData))
//                return
//            }
//            callback(.success(responseJSON.rates.usd))
//            print(responseJSON)
//        }
//        task?.resume()
        
        
        httpClient.request(baseUrl: url, parameters: [("access_key", "218e80355485a2d12beb99bfb1a1489"),("symbols","USD")])  { (result: Result<Currency, NetworkError>) in
                       switch result {
                       case .success(let data):
                        callback(.success(data.rates.usd))
                           
                       case .failure(let error):
                           callback(.failure(error))
                       }
                   }
               }
           
        
    }

