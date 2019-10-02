//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 01/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var store: PersonStore

    let items: [Message] = [Message(value: "Hello"),
                            Message(value: "World")]

    var body: some View {
        NavigationView {
            List(store.persons) { person in
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                    Text("Age: \(person.age)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear(perform: {
            self.store.fetchWithCompletion(nil)
        })
        .navigationBarTitle(Text("Persons"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: PersonStore())
    }
}
 

