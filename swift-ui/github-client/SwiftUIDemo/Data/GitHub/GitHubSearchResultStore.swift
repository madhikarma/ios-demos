//
//  GithubSearchResultStore.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 02/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import Foundation

enum GitHubSearchResultError: Error {
    case parsingData(Error?)
    case emptyData
    case network(Error?)
    case unknown(Error?)
}

class BaseGitHubSearchResultStore: ObservableObject {
    // TODO: can property wrappers be in a protocol instead so we can avoid base class?
    @Published var results: [GitHubSearchResult] = []
    @Published var isLoading: Bool = false
    func fetchWithCompletion(_: (([GitHubSearchResult], Error?) -> Void)?) {}
}

final class GitHubSearchResultStore: BaseGitHubSearchResultStore {
    override func fetchWithCompletion(_ completion: (([GitHubSearchResult], Error?) -> Void)?) {
        isLoading = true

        let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
        let task = URLSession.shared.dataTask(with: url) { data, _, networkError in
            DispatchQueue.main.async {
                self.isLoading = false
                var error: Error?

                if let networkError = networkError {
                    error = GitHubSearchResultError.network(networkError)
                } else if let jsonData = data {
                    do {
                        let searchResponse = try JSONDecoder().decode(GitHubSearchResponse.self, from: jsonData)
                        self.results = searchResponse.items
                    } catch let jsonError {
                        error = GitHubSearchResultError.parsingData(jsonError)
                    }
                } else {
                    error = GitHubSearchResultError.emptyData
                }
                completion?(self.results, error)
            }
        }
        task.resume()
    }
}

final class MockGitHubSearchResultStore: BaseGitHubSearchResultStore {
    override func fetchWithCompletion(_ completion: (([GitHubSearchResult], Error?) -> Void)?) {
        results = [
            GitHubSearchResult(id: 0,
                               full_name: "result 1",
                               description: "description about result 1",
                               html_url: URL(string: "http://github.com")!,
                               stargazers_count: 100,
                               watchers_count: 500),
            GitHubSearchResult(id: 1,
                               full_name: "result 2",
                               description: "description about result 2",
                               html_url: URL(string: "http://github.com")!,
                               stargazers_count: 100,
                               watchers_count: 500),
        ]
        completion?(results, nil)
    }
}
