//
//  NotificationAlertParser.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 05/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import Foundation


class NotificationAlertParser {

    class func objectFromResponse(response: AnyObject?) -> NotificationAlert? {

        var notificationAlert: NotificationAlert?

        if let notificationAlertDictionary = response as? [String: AnyObject] {

            var alertBody: String?

            if let body = notificationAlertDictionary["body"] as? String {

                alertBody = body
            }

            var alertBadge: Int?

            if let badge = notificationAlertDictionary["badge"] as? Int {

                alertBadge = badge
            }

            var alertSound: String?

            if let sound = notificationAlertDictionary["sound"] as? String {

                alertSound = sound
            }

            var alertTitle: String?

            if let title = notificationAlertDictionary["title"] as? String {

                alertTitle = title
            }

            notificationAlert = NotificationAlert(title: alertTitle, badge: alertBadge, body: alertBody, sound: alertSound)
        }
        
        return notificationAlert
    }
}
