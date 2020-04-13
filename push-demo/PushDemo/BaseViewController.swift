//
//  BaseViewController.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 08/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var disabledView: UIView?

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationWillEnterForegroundNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleWillEnterForegroundNotification:", name: UIApplicationWillEnterForegroundNotification, object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        print("viewWillAppear")

        showOrHideNotificationsDisabledIfNecessary()
    }

    func handleWillEnterForegroundNotification(notification _: NSNotification) {
        print("handleWillEnterForegroundNotification")

        showOrHideNotificationsDisabledIfNecessary()
    }
}
