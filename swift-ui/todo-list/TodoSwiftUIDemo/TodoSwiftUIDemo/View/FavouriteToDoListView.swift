//
//  FavouriteToDoListView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct FavouriteToDoListView: View {
    @EnvironmentObject var store: ToDoStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.items) { item in
                    if item.isFavourite {
                        NavigationLink(destination: ToDoDetailView(item: item)) {
                            Text(item.description)
                        }
                    }
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
