//
//  Weather.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 26/07/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

class TranslateService {
    
    private let httpClient: HTTPClient

    
    init(httpClient: HTTPClient = HTTPClient()){
        self.httpClient = httpClient
    }
    
    func getTranslation(text: String, callback: @escaping (Result<Translate, NetworkError>) -> Void) {
        //        guard let q = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let q = text
        guard let url = URL(string:"https://translation.googleapis.com/language/translate/v2") else {return}
        
        httpClient.request(baseUrl: url, parameters: [("q","\(q)"), ("detect","detect"), ("target","en"), ("format","text"),("key","AIzaSyBk9G3qddm8WppQ815uPdIz-i7taQ238B8"),("model", "base")]) { (result: Result<Translate, NetworkError>) in
            switch result {
            case .success(let data):
                callback(.success(data))
                 
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}


