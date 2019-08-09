//
//  ArtistViewController.swift
//  MusicApp
//
//  Created by Shagun Madhikarmi on 20/08/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var artists: [Artist] = []

    let recipeCellIdentifier = "recipeCell"

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Artists"
        
//        self.artists = ArtistProxy.loadArtists()
        
        let artistProxy = ArtistProxy()
        
        artistProxy.loadArtistsWithCompletion({ (artists) -> () in

            self.artists = artists
        } );
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // - Table methods
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:Int) -> Int {

        // Number of table cells
        return artists.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        // Dequeue a table cell
        var cell = tableView.dequeueReusableCellWithIdentifier(recipeCellIdentifier) as? UITableViewCell

        // create a table cell if necessary
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: recipeCellIdentifier)
        }

        // Get the model
        var artist = artists[indexPath.row]
        
        // Swift - we know that cell is not empty now so we use ! to force unwrapping of the optional
        cell!.textLabel.text = artist.name
        cell!.detailTextLabel.text = artist.genre
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

        // Get the model
        var artist: Artist = artists[indexPath.row]

        // Swift - Boom
//        var detailViewController: DetailViewController = DetailViewController.detailViewController(nil);
        
        var detailViewController: DetailViewController
        
        if (indexPath.row == artists.count-1) {
            
            detailViewController = DetailViewController.detailViewController(nil);
        }
        else {
            detailViewController = DetailViewController.detailViewController(artist);
        }
        
        self.navigationController.pushViewController(detailViewController, animated: true)
            
    }
}
