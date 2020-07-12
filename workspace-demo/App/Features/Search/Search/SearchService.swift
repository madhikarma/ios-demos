//
//  SearchService.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Combine
import Foundation
import GitHubAPI

public struct SearchResponse: Codable {
    public let total_count: UInt
}

public protocol SearchServiceProtocol {
    func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error>
}

public final class SearchService: SearchServiceProtocol {
    private let gitHubAPI: GitHubAPI

    public init(gitHubAPI: GitHubAPI = GitHubAPI()) {
        self.gitHubAPI = gitHubAPI
    }

    public func getSearchResults(_ term: String) -> AnyPublisher<SearchResponse, Error> {
        return gitHubAPI.getSearchResults(term)
            .map { (response) -> SearchResponse in
                SearchResponse(total_count: response.total_count)
            }.eraseToAnyPublisher()
    }
}
