//
//  Weather.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 26/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation
enum TranslateNetworkError: Error {
    case noData, incorrectResponse, undecodableData
}

class TranslateService {
    private var task: URLSessionDataTask?
    
    private var translateSession: URLSession
    
    init(translateSession: URLSession = URLSession(configuration: .default)) {
        self.translateSession = translateSession
        
    }
    func getTranslation(text: String, callback: @escaping (Result<Translate, TranslateNetworkError>) -> Void) {
       let q = text
        guard let url = URL(string:"https://translation.googleapis.com/language/translate/v2?q=\(q)&source=fr&target=en&format=text&key=AIzaSyBk9G3qddm8WppQ815uPdIz-i7taQ238B8&model=base") else {return}
        
        task?.cancel()
    
        task = translateSession.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                callback(.failure(.noData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.incorrectResponse))
                return
            }
            guard let responseJSON = try? JSONDecoder().decode(Translate.self, from: data) else {
                
                callback(.failure(.undecodableData))
                return
            }
            callback(.success(responseJSON))
            print(responseJSON)

        }
        task?.resume()
    }
}
