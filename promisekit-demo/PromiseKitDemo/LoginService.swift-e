//
//  ModelService.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 06/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import Foundation
import PromiseKit

protocol LoginServiceProtocol {
    
    func login(username: String, password: String) -> Promise<LoginToken>
}

final class LoginService: LoginServiceProtocol {
    
    let store: LoginStoreProtocol
    
    init(store: LoginStoreProtocol = LoginAPIStore()) {
        
        self.store = store
    }
    
    func login(username: String, password: String) -> Promise<LoginToken> {
        
        return store.login(username: username, password: password)
    }
}

