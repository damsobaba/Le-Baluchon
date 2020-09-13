//
//  HttpEngineTest.swift
//  Le BaluchonTests
//
//  Created by Adam Mabrouki on 13/09/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

//
import XCTest
@testable import Le_Baluchon 
class ClassHttpEngineTests: XCTestCase {
    

    func testGetQuoteShouldPostFailedCallback() {
        // Given
        let HttpEngine = HTTPEngine(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error),
          // When
    let expectation = XCTestExpectation(description: "Wait for queue change.")
        HttpEngine.request(
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
