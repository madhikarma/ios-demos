//
//  ToDoDetailView.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import SwiftUI

struct ToDoDetailView: View {
    @State var item: ToDo

    var body: some View {
        Text(item.description)
            .navigationBarTitle("Detail")
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailView(item: ToDo(id: 0, title: "preview", isFavourite: true))
    }
}
