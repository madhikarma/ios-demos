//
//  TweetsViewController.swift
//  TwitterApp
//
//  Created by Shagun Madhikarmi on 30/09/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit
import Accounts
import Social

let kTweetcellIdentifier = "TweetCellIdentifier"

class TweetsViewController: UITableViewController {
    
    // Data
    var tweets: [Tweet]?
    let tweetProxy: TweetProxy = TweetProxy()

    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // UI
        self.setupTableView()
        self.loadDataAndUpdateUserInterface()
    }
    
    
    // MARK: - User Interface
    
    func updateUserInterface() {
        
        self.tableView.reloadData()
        self.hideLoading()
    }

    func showLoading() {

        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func hideLoading() {

        if (self.refreshControl?.refreshing == true) {
         
            self.refreshControl?.endRefreshing()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func showInfoAlertWithMessage(message: String) {
        
        var alertView: UIAlertView = UIAlertView(title: "", message: message, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: NSLocalizedString("OK", comment: ""))
        alertView.show()
    }
    
    func setupTableView() {
        
        var refreshControl: UIRefreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.grayColor();
        refreshControl.addTarget(self, action: "didPullToRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.refreshControl = refreshControl
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLineEtched
    }
    

    // MARK: - Data
    
    func loadDataAndUpdateUserInterface() {
        
        self.showLoading()
        
        self.tweetProxy.loadTweetsWithCompletion({ (tweets) -> () in
            
            self.tweets = tweets
            self.updateUserInterface()
            
            }, failure: { (error) -> () in
                
                self.updateUserInterface()
                self.showInfoAlertWithMessage(NSLocalizedString("ERROR_LOAD_TWEETS", comment: ""))
        })
    }
    
    func getTextFromTweetAtIndex(index: Int) -> String {
        
        var text = ""
        
        if (self.tweets?.count > 0) {
            
            var index: Int = index
            var tweet: Tweet = self.tweets![index]
            text = tweet.text
        }
        
        return text
    }

    
    // MARK: - UITableViewDataSource methods
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(kTweetcellIdentifier) as? UITableViewCell

        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kTweetcellIdentifier)
        }

        cell!.textLabel!.text = self.getTextFromTweetAtIndex(indexPath.row)
        cell!.detailTextLabel?.text = self.getTextFromTweetAtIndex(indexPath.row)
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows: Int = 0
        
        if (self.tweets?.count > 0) {
            
            numberOfRows = self.tweets!.count
        }
        
        return numberOfRows
    }
    

    // MARK: - UITableViewDelegate methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var text = self.getTextFromTweetAtIndex(indexPath.row)
        self.showInfoAlertWithMessage(text)
    }
    

    // MARK - UI Action Handlers
    
    func didPullToRefresh(sender: UIRefreshControl) {
        
        self.loadDataAndUpdateUserInterface()
    }
}

