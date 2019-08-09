//
//  NetworkClient.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 07/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import Foundation
import PromiseKit

protocol NetworkClientProtocol {
    
    func sendRequest(url: URL, method: String) -> Promise<Data>
    func sendJSONRequest(url: URL, method: String) -> Promise<Any>
}

final class NetworkClient: NetworkClientProtocol {
    
    static let shared = NetworkClient()
    
    func sendRequest(url: URL, method: String) -> Promise<Data> {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        return firstly { _ in
            Alamofire.request(url, method: getHTTPMethod(method)).responseData()
            }.always {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    func sendJSONRequest(url: URL, method: String) -> Promise<Any> {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        return firstly { _ in
            Alamofire.request(url, method: getHTTPMethod(method)).responseJSON()
            }.always {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    
    // MARK: - Private
    
    private func getHTTPMethod(_ string: String) -> HTTPMethod {
        
        guard let method = HTTPMethod(rawValue: string) else {
            
            return .get
        }
        
        return method
    }
}
