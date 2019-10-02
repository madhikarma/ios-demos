//
//  GithubSearchResultStore.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 02/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import Foundation

final class GitHubSearchResultStore: ObservableObject {
    @Published var results: [GitHubSearchResult] = []

    func fetchWithCompletion(_ completion: (([GitHubSearchResult]) -> Void)?) {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                do {
                    let searchResponse = try JSONDecoder().decode(GitHubSearchResponse.self, from: data!)
                    self.results = searchResponse.items
                } catch let jsonError {
                   print(jsonError)
                }

                completion?(self.results)
            }
        }
        task.resume()
    }
}

