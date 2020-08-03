//
//  Currency.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 26/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noData, incorrectResponse, undecodableData
}

class CurrencyService {
    
    
    
    private var task: URLSessionDataTask?
    
    private var currencySession: URLSession
    
    
    init(currencySession: URLSession = URLSession(configuration: .default)) {
        self.currencySession = currencySession
        
    }
    func getCurrency(callback: @escaping (Result<Currency, NetworkError>) -> Void) {
//        let request = CurrencyService.currencyUrl
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=218e80355485a2d12beb99bfb1a1489c&symbols=USD") else {return}
        
        
        task?.cancel()
        task = currencySession.dataTask(with: url) { (data, response, error) in
       
                guard let data = data, error == nil else {
                    callback(.failure(.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(.incorrectResponse))
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
                    
                    callback(.failure(.undecodableData))
                    return
                }
                
                callback(.success(responseJSON))
                print(responseJSON)
                
            
        }
        task?.resume()
        
        
    }
}
