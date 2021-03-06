//
//  ToDoStore.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import Combine
import Foundation

final class ToDoStore: ObservableObject {
    @Published var items: [ToDo] = []
}
