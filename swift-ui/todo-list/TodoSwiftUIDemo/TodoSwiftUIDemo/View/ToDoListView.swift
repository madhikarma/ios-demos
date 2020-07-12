//
//  ContentView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI
    
struct ToDoListView: View {
    @EnvironmentObject var store: ToDoStore

    var body: some View {
        NavigationView {
            List(store.items) { item in
                NavigationLink(destination: ToDoDetailView(item: item)) {
                    Text(item.description)
                }
            }
            .navigationBarTitle(
                Text("Todos")
            ).navigationBarItems(trailing:
                Button("Add", action: {
                    print("do it")
                    let id = self.store.items.count + 1
                    let shouldFavourite = (id%2==0) ? true : false
                    let todo = ToDo(id: id, title: "something", isFavourite: shouldFavourite)
                    self.store.items.append(todo)
                })
            )
        }
    }
}
//
//struct ToDoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListView(store: ToDoStore())
//    }
//}
