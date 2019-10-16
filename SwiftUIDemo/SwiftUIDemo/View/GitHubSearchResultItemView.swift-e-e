//
//  GitHubSearchResultItemView.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 02/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import SwiftUI

struct GitHubSearchResultItemView: View {
    
    @State var result: GitHubSearchResult
    
    var body: some View {
            Text(result.full_name)
                .navigationBarTitle("Repository detail")
    }
}

struct GitHubSearchResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubSearchResultItemView(result: GitHubSearchResult(id: 0,
                                                              full_name: "repo name",
                                                              description: "repo descripton",
                                                              html_url: URL(string: "https://github.com")!,
                                                              stargazers_count: 50,
                                                              watchers_count: 100))
    }
}
