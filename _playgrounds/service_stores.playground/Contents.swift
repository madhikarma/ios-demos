//: Playground - noun: a place where people can play

import UIKit

// LIBRARY CODE
protocol Store {}

protocol Service {
    associatedtype T: Store
    init(stores: [T])
}

// SUB LIBRARY CODE

protocol APIStore: Store {
    init(networkClient: NetworkClient)
}

protocol NetworkClient {
    init(urlSession: URLSession)
    func send(request: URLRequest, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) -> URLSessionTask
}

extension NetworkClient {
    func send(request: URLRequest, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}

final class DefaultNetworkClient: NetworkClient {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

// APP CODE

// TODO: (SM) can this be a protocol too?
class LoginStore: Store {
    func performLogin(username _: String, password _: String, completion _: @escaping ((String, Error) -> Void)) {}
}

final class LoginAPIStore: LoginStore, APIStore {
    private let networkClient: NetworkClient

    required init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    override func performLogin(username _: String, password _: String, completion _: @escaping ((String, Error) -> Void)) {
        // TODO:
    }
}

final class LoginService: LoginStore, Service {
    typealias T = LoginStore
    private let stores: [LoginStore]

    required init(stores: [LoginStore]) {
        self.stores = stores
    }

    override func performLogin(username: String, password: String, completion: @escaping ((String, Error) -> Void)) {
        stores.first?.performLogin(username: username, password: password, completion: completion)
    }
}

let networkClient = DefaultNetworkClient()
let apiStore = LoginAPIStore(networkClient: networkClient)
let stores = [apiStore]
let service = LoginService(stores: stores)
