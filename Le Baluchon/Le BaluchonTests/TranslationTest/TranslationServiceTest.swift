////
////  TranslationServiceTestCase.swift
////  Le BaluchonTests
////
////  Created by Adam Mabrouki on 12/09/2020.
////  Copyright © 2020 Adam Mabrouki. All rights reserved.
////
//
import XCTest
@testable import Le_Baluchon

class TranslationServiceTestCase: XCTestCase {
    
     // MARK: - Properties
    ///succes error
    func testRequestMethod_WhenErrorIsGiven_ThenShouldReturnAnError() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let translateService = TranslateService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslation(text:"") { result  in
            guard case .failure(let error) = result else {return}
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    /// succes case
    func testRequestMethod_WhenResponseIsGiven_ThenShouldReturnData() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: FakeResponseData.correctDataTranslate, response: FakeResponseData.responseOK, error: nil))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let translateService = TranslateService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslation(text: "oui") { result  in
            guard case .success(let data) = result else {return}
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

