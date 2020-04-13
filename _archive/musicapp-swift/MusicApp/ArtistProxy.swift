//
//  ArtistProxy.swift
//  MusicApp
//
//  Created by Shagun Madhikarmi on 21/08/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import Foundation

class ArtistProxy {
    // Swift - synchronous
    func loadArtists() -> [Artist] {
        // TODO: load from plist or network
        let artist1 = Artist(name: "Foo Fighters", genre: "Rock", imagePath: "foo_fighters.jpg")
        let artist2 = Artist(name: "Bonobo", genre: "Electronic", imagePath: "bonobo.jpg")
        let artist3 = Artist(name: "Miles Davis", genre: "Jazz", imagePath: "miles_davis.jpg")
        let artist4 = Artist(name: "Banks", genre: "Alternative", imagePath: "banks.jpg")

        var artists: Array = [Artist]()

        artists.append(artist1)
        artists.append(artist2)
        artists.append(artist3)
        artists.append(artist4)

        return artists
    }

    // Swift - completion block
    func loadArtistsWithCompletion(completionClosure: (artists: [Artist]) -> Void) {
        // TODO: load from plist or network
        let artist1 = Artist(name: "Foo Fighters", genre: "Rock", imagePath: "foo_fighters.jpg")
        let artist2 = Artist(name: "Bonobo", genre: "Electronic", imagePath: "bonobo.jpg")
        let artist3 = Artist(name: "Miles Davis", genre: "Jazz", imagePath: "miles_davis.jpg")
        let artist4 = Artist(name: "Banks", genre: "Alternative", imagePath: "banks.jpg")

        var artists: Array = [Artist]()

        artists.append(artist1)
        artists.append(artist2)
        artists.append(artist3)
        artists.append(artist4)

        completionClosure(artists: artists)
    }
}
