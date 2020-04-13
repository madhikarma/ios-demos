//
//  SearchService.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Combine
import Foundation
import NetworkClient

public struct SearchResponse: Codable {
    public let total_count: UInt
}

public protocol SearchServiceProtocol {
    func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error>
}

public final class SearchService: SearchServiceProtocol {
    private let network: NetworkClientProtocol

    public init(_ network: NetworkClientProtocol = NetworkClient()) {
        self.network = network
    }

    public func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(term)")!
        let publisher = network.sendRequest(url: url)
            .tryMap { (data) -> SearchResponse in
                try JSONDecoder().decode(SearchResponse.self, from: data)
            }.eraseToAnyPublisher()
        return publisher
    }
}
