//
//  FavouriteToDoListView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct FavouriteToDoListView: View {
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
                Text("Favourites")
            )
        }
    }
}

struct FavouriteToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteToDoListView()
    }
}
