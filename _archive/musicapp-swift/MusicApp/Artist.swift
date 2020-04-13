//
//  Artist.swift
//  ArtistApp
//
//  Created by Shagun Madhikarmi on 21/08/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import Foundation

class Artist {
    // Swift. implicity public
    var id: Int?
    var name: String
    var genre: String
    var imagePath: String
    var website = "http://"

    init(name: String, genre: String, imagePath: String) {
        self.name = name
        self.genre = genre
        self.imagePath = imagePath

        println(website)
        var newWebsite = website
    }
}
