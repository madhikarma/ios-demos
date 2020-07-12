//
//  ContentView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ToDoListView().tabItem {
                Image(systemName: "checkmark.rectangle")
                Text("Todos")
            }.tag(0)
            FavouriteToDoListView().tabItem {
                Image(systemName: "heart")
                Text("Favourites")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
