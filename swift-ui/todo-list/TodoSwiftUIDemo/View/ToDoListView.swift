//
//  ContentView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

enum ToDoListViewState {
    case list
    case grid
}

struct ToDoListView: View {
    private var columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
    ]

    @EnvironmentObject var store: ToDoStore
    @State var state: ToDoListViewState = .list
    var body: some View {
        NavigationView {
            VStack {
                Button("Grid / List") {
                    print(" do it ")
                    if state == .list {
                        state = .grid
                    } else {
                        state = .list
                    }
                }
                switch state {
                case .list:
                    List(store.items) { item in
                        NavigationLink(destination: ToDoDetailView(item: item)) {
                            Text(item.description)
                        }
                    }
                case .grid:
                    LazyVGrid(columns: columns,
                              alignment: .center,
                              spacing: 16) {
                        ForEach(store.items) { item in
                            NavigationLink(destination: ToDoDetailView(item: item)) {
                                Text(item.description)
                            }
                        }
                    }.border(Color.gray)
                }
            }
            .navigationBarTitle(
                Text("Todos")
            ).navigationBarItems(trailing:
                Button("Add", action: {
                    print("do it")
                    let id = self.store.items.count + 1
                    let shouldFavourite = (id % 2 == 0) ? true : false
                    let todo = ToDo(id: id, title: "something", isFavourite: shouldFavourite)
                    self.store.items.append(todo)
                })
            )
        }
    }
}

// struct ToDoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListView(store: ToDoStore())
//    }
// }
