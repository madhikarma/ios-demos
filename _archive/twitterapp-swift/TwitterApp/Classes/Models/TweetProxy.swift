//
//  TweetProxy.swift
//  TwitterApp
//
//  Created by Shagun Madhikarmi on 01/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import Accounts
import Social

// Constants
let kTwitterUserTimelineURLString: String = "https://api.twitter.com/1.1/statuses/user_timeline.json"
let kTwitterScreenNameKey: String = "screen_name"
let kTwitterTextKey: String = "text"
let kTwitterCountKey: String = "count"
let kTwitterCountLimit: String = "50"

class TweetProxy {
    // Swift - completion block
    func loadTweetsWithCompletion(completion: (tweets: [Tweet]) -> Void, failure: (error: NSError) -> Void) {
        let account: ACAccountStore = ACAccountStore()
        let accountType: ACAccountType = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)

        account.requestAccessToAccountsWithType(accountType, options: nil) { (granted, error) -> Void in

            if granted == true {
                var accounts: [ACAccount] = account.accountsWithAccountType(accountType) as [ACAccount]

                if accounts.count > 0 {
                    let twitterAccount: ACAccount! = accounts.last as ACAccount!

                    let requestURL: NSURL = NSURL.URLWithString(kTwitterUserTimelineURLString)

                    var parameters = [String: AnyObject]()
                    parameters[kTwitterScreenNameKey] = twitterAccount.username
                    parameters[kTwitterCountKey] = kTwitterCountLimit

                    var postRequest: SLRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: requestURL, parameters: parameters)

                    postRequest.account = twitterAccount
                    postRequest.performRequestWithHandler { (responseData, _, error) -> Void in

                        // Parse
                        if responseData != nil, error == nil {
                            var jsonError: NSError?

                            let jsonResponse: AnyObject! = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError)

                            var tweets: [Tweet] = [Tweet]()

                            if jsonResponse != nil, jsonError == nil {
                                if let tweetsJSONArray = jsonResponse! as? [[String: AnyObject]] {
                                    for tweetJSONDictionary in tweetsJSONArray {
                                        let text = tweetJSONDictionary[kTwitterTextKey]! as String

                                        var tweet = Tweet(text: text, dateCreated: nil)
                                        tweet.text = text

                                        tweets.append(tweet)
                                    }
                                }

                                // Success
                                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                                    completion(tweets: tweets)
                                }
                            } else {
                                // No JSON data (error parsing)

                                // Failure
                                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                                    failure(error: error)
                                }
                            }
                        } else {
                            // No data (error downloading)

                            // Failure
                            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                                failure(error: error)
                            }
                        }
                    }
                } else {
                    // No accounts

                    // Failure
                    dispatch_async(dispatch_get_main_queue()) { () -> Void in
                        failure(error: error)
                    }
                }
            } else {
                // No access granted

                // Failure
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    failure(error: error)
                }
            }
        }
    }
}
