import Combine
import Foundation
import UIKit

public enum NetworkError: Error {
    case missingData
    case unknown(Error?)
}

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.unknown, .unknown):
            return true
        case (.missingData, .missingData):
            return true
        default:
            return false
        }
    }
}

public typealias NetworkCompletion = ((Result<Data, Error>) -> Void)

public protocol NetworkProtocol {
    var session: URLSession { get }
    func sendRequest(request: URLRequest, completion: @escaping NetworkCompletion) -> URLSessionDataTask
}

public final class Network: NetworkProtocol {
    public let session: URLSession

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    // MARK: - Request - Closures

    public func sendRequest(request: URLRequest, completion: @escaping NetworkCompletion) {
        guard let url = request.url else { fatalError("Error: no url in the request: \(request)") }

        let task = session.dataTask(with: request) { data, _, error in
            let result: Result<Data, NetworkError>

            if let data = data {
                result = .success(data)
            } else if let error = error {
                result = .failure(NetworkError.unknown(error))
            } else {
                result = .failure(NetworkError.missingData)
            }
            DispatchQueue.main.async {
                completion(result)
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }

    public func sendRequest(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let request = URLRequest(url: url)
        return sendRequest(request: request, completion: completion)
    }

    // MARK: - Request - Publishers (Combine)

    public func sendRequest(request: URLRequest) -> AnyPublisher<Data, NetworkError> {
        let publisher = session.dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError { (urlError) -> NetworkError in
                NetworkError.unknown(urlError)
            }
            .eraseToAnyPublisher()
        return publisher
    }

    public func sendRequest(url: URL) -> AnyPublisher<Data, NetworkError> {
        let request = URLRequest(url: url)
        return sendRequest(request: request)
    }
}

public enum APIClientError: Error {
    case network(Error?)
    case parsing(Error?)
    case unknown(Error?)
}

public class APIClient<T: Codable> {
    private let network: NetworkProtocol

    // MARK: - Init

    public init(network: NetworkProtocol = Network()) {
        self.network = network
    }

    @discardableResult
    public func getObject(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
        let task = network.sendRequest(request: request) { networkResult in
            let result: Result<T, Error>
            switch networkResult {
            case let .success(value):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: value)
                    result = .success(response)
                } catch let parseError {
                    result = .failure(APIClientError.parsing(parseError))
                }
            case let .failure(networkError):
                result = .failure(APIClientError.network(networkError))
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }
        return task
    }
}
