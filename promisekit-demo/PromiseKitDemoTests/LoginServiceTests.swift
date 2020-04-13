//
//  LoginServiceTests.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 06/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import PromiseKit
@testable import PromiseKitDemo
import XCTest

final class LoginServiceTests: XCTestCase {
    func testLoginShouldCallStoreLogin() {
        // Given

        // Uncomment for old way below but both ways work in iOS 9 and 10 Simulators as XCTest ships with the SDK rather than iOS (I think)
//        let loginExpectation = expectation(description: "Login expectation")

        let loginExpectation = XCTestExpectation(description: "Login expectation")

        // When

        let store = MockLoginStore()
        let service = LoginService(store: store)

        _ = service.login(username: "bob", password: "123").then { _ in

            loginExpectation.fulfill()
        }

        // Uncomment for old way below but both ways work in iOS 9 and 10 Simulators as XCTest ships with the SDK rather than iOS (I think)
//        waitForExpectations(timeout: 1.0, handler: nil)

        XCTWaiter().wait(for: [loginExpectation], timeout: 1.0)

        // Then

        XCTAssertTrue(store.stubIsLoggedCalled)
        XCTAssertEqual(store.spyUsername, "bob")
        XCTAssertEqual(store.spyPassword, "123")
    }
}
