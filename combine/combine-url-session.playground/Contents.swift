import Combine
import Foundation
import UIKit

struct GitHubSearchResponse: Codable {
    let total_ount: UInt
}

enum NetworkError: Error {
    case unknown(Error)
}

final class Network {
    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchData(url: URL) -> AnyPublisher<Data, NetworkError> {
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError { (urlError) -> NetworkError in
                NetworkError.unknown(urlError)
            }
            .eraseToAnyPublisher()
        return publisher
    }
}

final class GitHubAPI {
    private let network: Network

    init(_ network: Network = Network()) {
        self.network = network
    }

    func getSearchResults(_ term: String) -> AnyPublisher<GitHubSearchResponse, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(term)")!
        let publisher = network.fetchData(url: url)
            .tryMap { (data) -> GitHubSearchResponse in
                try JSONDecoder().decode(GitHubSearchResponse.self, from: data)
            }.eraseToAnyPublisher()
        return publisher
    }
}

let publisher = GitHubAPI().getSearchResults("swift").sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("finished")
    case let .failure(error):
        print("received the error: ", error)
    }
}, receiveValue: { someValue in
    print(".sink() received \(someValue)")
})
