//
//  Network.swift
//  Network
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case unknown(Error)
}

public final class Network {
  
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func fetchData(url: URL) -> AnyPublisher<Data, NetworkError> {
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError({ (urlError) -> NetworkError in
                return NetworkError.unknown(urlError)
            })
            .eraseToAnyPublisher()
        return publisher
    }
}
