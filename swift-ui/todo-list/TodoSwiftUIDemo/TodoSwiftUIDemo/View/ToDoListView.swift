//
//  ContentView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct ToDoListView: View {
    // TODO: (SM) share this state
    @State var items: [ToDo] = []

    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: ToDoDetailView(item: item)) {
                    Text(item.title)
                }
            }
            .navigationBarTitle(
                Text("Todos")
            ).navigationBarItems(trailing:
                Button("Add", action: {
                    print("do it")
                    let todo = ToDo(id: self.items.count + 1, title: "something")
                    self.items.append(todo)
                })
            )
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
