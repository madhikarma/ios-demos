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
    
    @ObservedObject var store: GitHubSearchResultStore

    var body: some View {
        NavigationView {
            List(store.results) { result in
                VStack(alignment: .leading) {
                    Text(result.full_name)
                        .font(.headline)
                    Text("Description: \(result.description)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear(perform: {
            self.store.fetchWithCompletion(nil)
        })
        .navigationBarTitle(Text("Repositories"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: GitHubSearchResultStore())
    }
}
 

