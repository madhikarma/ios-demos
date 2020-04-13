//
//  AppDelegate+PushNotification.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 07/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import Foundation
import UIKit

let kAppDidRegisterForRemoteNotificationSuccess: String = "AppDidRegisterForRemoteNotificationSuccess"
let kAppDidRegisterForRemoteNotificationFail: String = "AppDidRegisterForRemoteNotificationFail"
let kAppDidDenyPushNotificationAccess: String = "AppDidDenyPushNotificationAccess"

extension AppDelegate {
    func application(application _: UIApplication, didRegisterUserNotificationSettings _: UIUserNotificationSettings) {
        print("didRegisterUserNotificationSettings")

        if NotificationProxy.sharedInstance.notificationsSupported() {
            UIApplication.sharedApplication().registerForRemoteNotifications()

        } else {
            NSNotificationCenter.defaultCenter().postNotificationName(kAppDidDenyPushNotificationAccess, object: nil, userInfo: nil)
        }
    }

    func application(application _: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("didRegisterForRemoteNotificationsWithDeviceToken")

        NSNotificationCenter.defaultCenter().postNotificationName(kAppDidRegisterForRemoteNotificationSuccess, object: deviceToken, userInfo: nil)
    }

    func application(application _: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("didFailToRegisterForRemoteNotificationsWithError")

        NSNotificationCenter.defaultCenter().postNotificationName(kAppDidRegisterForRemoteNotificationFail, object: error, userInfo: nil)
    }

    func application(application _: UIApplication, didReceiveRemoteNotification _: [NSObject: AnyObject]) {
        print("didReceiveRemoteNotification")

        let alertController = UIAlertController(title: "Push notification received", message: "TODO", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(okAction)

        window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
}
