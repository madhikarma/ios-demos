//
//  ContentView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct ToDo: Identifiable {
    let id: Int
    let title: String
}

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
