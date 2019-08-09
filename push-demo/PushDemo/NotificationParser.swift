//
//  NotificationParser.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 05/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import Foundation


class NotificationParser {

    class func objectFromResponse(response: AnyObject?) -> Notification? {

        var notification: Notification?

        if let notificationDictionary = response as? [String: AnyObject] {

            if let applePushServiceDictionary = notificationDictionary["aps"] as? [String: AnyObject] {

                var notificationAlert: NotificationAlert?

                if let alertDictionary = applePushServiceDictionary["alert"] as? [String: AnyObject] {

                    notificationAlert = NotificationAlertParser.objectFromResponse(alertDictionary)
                }

                var notificationDestination: NotificationDestination?

                if let destinationDictionary = applePushServiceDictionary["destination"] as? [String: AnyObject] {

                    notificationDestination = NotificationDestinationParser.objectFromResponse(destinationDictionary)
                }

                var notificationMessage: String?

                if let message = applePushServiceDictionary["message"] as? String {

                    notificationMessage = message
                }
                
                if let destination = notificationDestination {

                    notification = Notification(alert: notificationAlert, destination: destination, message: notificationMessage)
                }
            }
        }

        return notification
    }
}
