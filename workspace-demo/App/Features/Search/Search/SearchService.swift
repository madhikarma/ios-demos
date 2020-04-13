//
//  SearchService.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Foundation
import Network
import Combine

public struct SearchResponse: Codable {
    public let total_count: UInt
}

public protocol SearchServiceProtocol {
    func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error>
}
    
public final class SearchService: SearchServiceProtocol {
    private let network: Network
    
    public init(_ network: Network = Network()) {
        self.network = network
    }
    
    public func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(term)")!
        let publisher = network.fetchData(url: url)
            .tryMap { (data) -> SearchResponse in
                return try JSONDecoder().decode(SearchResponse.self, from: data)
            }.eraseToAnyPublisher()
        return publisher
    }
}
