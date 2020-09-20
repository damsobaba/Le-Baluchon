//
//  FackResponseData.swift
//  Le BaluchonTests
//
//  Created by Adam Mabrouki on 23/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation
class FakeResponseData {
    // MARK: - Data
    static var correctData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: ".json")!
        return try! Data(contentsOf: url)
    }
    static var correctDataWeather: Data? {
           let bundle = Bundle(for: FakeResponseData.self)
           let url = bundle.url(forResource: "Weather", withExtension: ".json")!
           return try! Data(contentsOf: url)
       }
    static var correctDataTranslate: Data? {
           let bundle = Bundle(for: FakeResponseData.self)
           let url = bundle.url(forResource: "Translation", withExtension: ".json")!
           return try! Data(contentsOf: url)
       }
    static let incorrectData = "erreur".data(using: .utf8)!

    
    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!


    // MARK: - Error
    class HttpEngineError: Error {}
    static let error = HttpEngineError()
}
