//
//  Network.swift
//  NetworkClient
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Foundation
import Combine

public enum NetworkClientError: Error {
    case unknown(Error)
}

public protocol NetworkClientProtocol {
    func sendRequest(url: URL) -> AnyPublisher<Data, NetworkClientError>
}
    
public final class NetworkClient: NetworkClientProtocol {
  
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func sendRequest(url: URL) -> AnyPublisher<Data, NetworkClientError> {
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError({ (urlError) -> NetworkClientError in
                return NetworkClientError.unknown(urlError)
            })
            .eraseToAnyPublisher()
        return publisher
    }
}
