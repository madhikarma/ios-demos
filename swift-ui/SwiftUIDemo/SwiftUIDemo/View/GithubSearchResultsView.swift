//
//  GithubSearchResultsView.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 01/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import SwiftUI
import Combine

struct GithubSearchResultsView: View {
    
    @ObservedObject var store: GitHubSearchResultStore

    var body: some View {
        
        NavigationView {
            if self.store.isLoading {
                Text("Loading")
            }
            else if store.results.count > 0 {
                List(store.results) { result in
                    NavigationLink(destination: GitHubSearchResultItemView(result: result)) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(result.full_name)
                                .font(.headline)
                            Text(result.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }.navigationBarTitle(Text("Repositories"))
            } else {
                Text("no results")
            }
        }
        .onAppear(perform: {
            print("\(String(describing: self))::onAppear")
            self.store.fetchWithCompletion(nil)
        })
        
    }
}

struct GithubSearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        GithubSearchResultsView(store: GitHubSearchResultStore())
    }
}
 

