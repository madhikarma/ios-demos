//
//  PersonStore.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 02/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import Foundation

final class PersonStore: ObservableObject {
    @Published var persons: [Person] = []

    func fetchWithCompletion(_ completion: (([Person]) -> Void)?) {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
        let task = URLSession.shared.dataTask(with: url) { _, _, _ in
            DispatchQueue.main.async {
                self.persons = [
                    .init(id: .init(), name: "Majid", age: 27),
                    .init(id: .init(), name: "John", age: 31),
                    .init(id: .init(), name: "Fred", age: 25),
                ]
                completion?(self.persons)
            }
        }
        task.resume()
    }

    func fetch() {
        persons = [
            .init(id: .init(), name: "Majid", age: 27),
            .init(id: .init(), name: "John", age: 31),
            .init(id: .init(), name: "Fred", age: 25),
        ]
    }
}
