//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Shagun Madhikarmi on 01/10/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import SwiftUI

struct Message: Hashable {
    let value: String
}

struct ContentView: View {
    
    let items: [Message] = [Message(value: "Hello"),
                            Message(value: "World")]

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Group {
                ForEach(items, id: \.value) { item in
                    Text(item.value).foregroundColor(Color.blue)
                }
            }.background(Color.red)
        }.background(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 

