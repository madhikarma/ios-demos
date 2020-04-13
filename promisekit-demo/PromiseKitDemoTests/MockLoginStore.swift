//
//  MockLoginStore.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 06/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import Foundation
import PromiseKit
@testable import PromiseKitDemo

final class MockLoginStore: LoginStoreProtocol {
    var stubIsLoggedCalled = false
    var spyUsername: String?
    var spyPassword: String?

    func login(username: String, password: String) -> Promise<LoginToken> {
        stubIsLoggedCalled = true
        spyUsername = username
        spyPassword = password

        return Promise(value: LoginToken(value: "abc"))
    }
}
