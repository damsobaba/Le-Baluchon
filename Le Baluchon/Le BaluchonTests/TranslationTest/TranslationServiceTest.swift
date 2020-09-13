//
//  TranslationServiceTestCase.swift
//  Le BaluchonTests
//
//  Created by Adam Mabrouki on 12/09/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import XCTest

class TranslationServiceTestCase: XCTestCase {

    import XCTest
    @testable import Le_Baluchon

    class ClassCurrencyTests: XCTestCase {
        func testGetQuoteShouldPostFailedCallback() {
            // Given
            let currencyService = CurrencyService(currencySession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error),
              // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
            currencyService.getCurrency { result  in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(currency)
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }

        func testGetQuoteShouldPostFailedCallbackIfNoData() {
            // Given
            let currencyService = CurrencyService(
                currencySession: URLSessionFake(data: nil, response: nil, error: nil),
               

            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")

            currencyService.getCurrency { (success, currency) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(currency)
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }

        func testGetQuoteShouldPostFailedCallbackIfIncorrectResponse() {
            // Given
            let quoteService = QuoteService(
                quoteSession: URLSessionFake(
                    data: FakeResponseData.quoteCorrectData,
                    response: FakeResponseData.responseKO,
                    error: nil),
                imageSession: URLSessionFake(data: nil, response: nil, error: nil))

            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            quoteService.getQuote { (success, quote) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(quote)
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }

        func testGetQuoteShouldPostFailedCallbackIfIncorrectData() {
            // Given
            let quoteService = QuoteService(
                quoteSession: URLSessionFake(
                    data: FakeResponseData.quoteIncorrectData,
                    response: FakeResponseData.responseOK,
                    error: nil),
                imageSession: URLSessionFake(data: nil, response: nil, error: nil))

            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            quoteService.getQuote { (success, quote) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(quote)
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }



        func testGetQuoteShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
            // Given
            let quoteService = QuoteService(
                quoteSession: URLSessionFake(
                    data: FakeResponseData.quoteCorrectData,
                    response: FakeResponseData.responseOK,
                    error: nil),
                imageSession: URLSessionFake(
                    data: FakeResponseData.imageData,
                    response: FakeResponseData.responseOK,
                    error: nil))

            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            quoteService.getQuote { (success, quote) in
                // Then
                XCTAssertTrue(success)
                XCTAssertNotNil(quote)

                let text = "Face your deficiencies and acknowledge them; but do not let them master you. Let them teach you patience, sweetness, insight."
                let author = "Helen Keller"
                let imageData = "image".data(using: .utf8)!

                XCTAssertEqual(text, quote!.text)
                XCTAssertEqual(author, quote!.author)
                XCTAssertEqual(imageData, quote!.imageData)

                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }
    }

}
