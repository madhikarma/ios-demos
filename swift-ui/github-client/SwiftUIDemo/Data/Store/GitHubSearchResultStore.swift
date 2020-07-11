//
//  GithubSearchResultStore.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 02/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import Combine
import Foundation
import GitHubAPI

final class GitHubSearchResultStore: ObservableObject {
    // TODO: can property wrappers be in a protocol?

    @Published var results: [GitHubSearchResult] = []
    @Published var isLoading: Bool = false
    private let gitHubAPI = GitHubAPI()
    private var cancellableSet: Set<AnyCancellable> = []

    deinit {
        cancellableSet.forEach { cancellable in
            cancellable.cancel()
        }
    }

    func getSearchResults(term _: String) {
        isLoading = true
        gitHubAPI.getSearchResults("swift")
            .map { $0.items }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                print("receiveCompletion")
                self.isLoading = false
            }, receiveValue: { someValue in
                print("receiveValue")
                self.results = someValue
            }).store(in: &cancellableSet)
    }
}
