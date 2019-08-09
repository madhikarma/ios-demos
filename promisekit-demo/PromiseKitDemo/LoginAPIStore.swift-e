//
//  LoginStore.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 07/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import Foundation
import PromiseKit

protocol LoginStoreProtocol {
    
    func login(username: String, password: String) -> Promise<LoginToken>
}

protocol LoginAPIStoreProtocol: LoginStoreProtocol {
    
    init(networkClient: NetworkClientProtocol)
}

final class LoginAPIStore: LoginAPIStoreProtocol {
    
    let networkClient: NetworkClientProtocol
    let queue = DispatchQueue.global(qos: .background)
    
    init(networkClient: NetworkClientProtocol = NetworkClient.shared) {
        
        self.networkClient = networkClient
    }
    
    func login(username: String, password: String) -> Promise<LoginToken> {
        
        // TODO: move out into an endpoint enum
        
        let urlString = "https://gist.githubusercontent.com/madhikarma/592964088fa202819f738a2efa87ca9c/raw/7d741b8603588847fbf87466cd480d0fb12b18ef/sample_login_api_response.json"
        let url = URL(string: urlString)!
        
        return networkClient.sendJSONRequest(url: url, method: "GET").then(on: queue) { json in
            
            // TODO: move out into a parser class (in case we want to inject as dependency)
            
            return self.parseLogin(json: json)
        }
    }
    
    
    // MARK: - Private
    
    private func parseLogin(json: Any) -> Promise<LoginToken> {
        
        let promise: Promise<LoginToken>
        let parseError = NSError(domain: "InvalidJSON", code: 0, userInfo: nil)
        
        if let loginJSON = json as? [String: Any] {
            
            if let tokenString = loginJSON["token"] as? String {
                
                let token = LoginToken(value: tokenString)
                promise = Promise(value: token)
                
            } else {
                
                promise = Promise(error: parseError)
            }
        } else {
            
            promise = Promise(error: parseError)
        }
        
        return promise
    }
}
