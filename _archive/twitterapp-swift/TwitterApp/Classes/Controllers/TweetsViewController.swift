//
//  TweetsViewController.swift
//  TwitterApp
//
//  Created by Shagun Madhikarmi on 30/09/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import Accounts
import Social
import UIKit

let kTweetcellIdentifier = "TweetCellIdentifier"

class TweetsViewController: UITableViewController {
    // Data
    var tweets: [Tweet]?
    let tweetProxy: TweetProxy = TweetProxy()

    // MARK: - View lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI
        setupTableView()
        loadDataAndUpdateUserInterface()
    }

    // MARK: - User Interface

    func updateUserInterface() {
        tableView.reloadData()
        hideLoading()
    }

    func showLoading() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }

    func hideLoading() {
        if refreshControl?.refreshing == true {
            refreshControl?.endRefreshing()
        }

        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    func showInfoAlertWithMessage(message: String) {
        var alertView: UIAlertView = UIAlertView(title: "", message: message, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: NSLocalizedString("OK", comment: ""))
        alertView.show()
    }

    func setupTableView() {
        var refreshControl: UIRefreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.grayColor()
        refreshControl.addTarget(self, action: "didPullToRefresh:", forControlEvents: UIControlEvents.ValueChanged)

        self.refreshControl = refreshControl
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLineEtched
    }

    // MARK: - Data

    func loadDataAndUpdateUserInterface() {
        showLoading()

        tweetProxy.loadTweetsWithCompletion({ (tweets) -> Void in

            self.tweets = tweets
            self.updateUserInterface()

        }, failure: { (_) -> Void in

            self.updateUserInterface()
            self.showInfoAlertWithMessage(NSLocalizedString("ERROR_LOAD_TWEETS", comment: ""))
        })
    }

    func getTextFromTweetAtIndex(index: Int) -> String {
        var text = ""

        if tweets?.count > 0 {
            var index: Int = index
            var tweet: Tweet = tweets![index]
            text = tweet.text
        }

        return text
    }

    // MARK: - UITableViewDataSource methods

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(kTweetcellIdentifier) as? UITableViewCell

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kTweetcellIdentifier)
        }

        cell!.textLabel!.text = getTextFromTweetAtIndex(indexPath.row)
        cell!.detailTextLabel?.text = getTextFromTweetAtIndex(indexPath.row)

        return cell!
    }

    override func tableView(tableView _: UITableView, numberOfRowsInSection _: Int) -> Int {
        var numberOfRows: Int = 0

        if tweets?.count > 0 {
            numberOfRows = tweets!.count
        }

        return numberOfRows
    }

    // MARK: - UITableViewDelegate methods

    override func tableView(tableView _: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var text = getTextFromTweetAtIndex(indexPath.row)
        showInfoAlertWithMessage(text)
    }

    // MARK: - UI Action Handlers

    func didPullToRefresh(sender _: UIRefreshControl) {
        loadDataAndUpdateUserInterface()
    }
}
