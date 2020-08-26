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
    static var currencyCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static let quoteIncorrectData = "erreur".data(using: .utf8)!

    //static let imageData = "image".data(using: .utf8)!

    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=218e80355485a2d12beb99bfb1a1489c&symbols=USD")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=218e80355485a2d12beb99bfb1a1489c&symbols=USD")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!


    // MARK: - Error
    class CurrencyError: Error {}
    static let error = CurrencyError()
}
