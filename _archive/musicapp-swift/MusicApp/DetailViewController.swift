//
//  DetailViewController.swift
//  ArtistApp
//
//  Created by Shagun Madhikarmi on 21/08/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // Swift. initialiser would be required unless this is marked as optional. Also cant assign nil unless its optional

    var artist: Artist?

    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    // Swift - factory method
    class func detailViewController(artist: Artist?) -> DetailViewController {
        let mainStoryboardIdentifier = "Main"
        let viewControllerIdentifier = "DetailViewController"

        let storyboard: UIStoryboard = UIStoryboard(name: mainStoryboardIdentifier, bundle: nil)

        // Swift - casting
        var detailViewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier) as DetailViewController
        detailViewController.artist = artist

        return detailViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateArtistImage()
        updateArtistLabel()
    }

    private func updateArtistImage() {
        var imagePath = artist?.imagePath

        var image: UIImage = UIImage(named: imagePath)

        imageView.image = image

        imageView.sizeToFit()
    }

    private func updateArtistLabel() {
        // Swift - forced unwrapping
//        self.detailLabel.text = self.artist!.name

        // Swift - optional chaining
        detailLabel.text = artist?.name
    }
}
