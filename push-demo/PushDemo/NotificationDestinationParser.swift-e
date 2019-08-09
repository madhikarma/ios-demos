//
//  NotificationDestinationParser.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 05/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import Foundation

class NotificationDestinationParser {

    class func objectFromResponse(response: AnyObject?) -> NotificationDestination? {

        var notificationDestination: NotificationDestination?

        if let destinationDictionary = response as? [String: AnyObject] {

            var destinationPatientId: String?

            if let patientId = destinationDictionary["patient-id"] as? String {

                destinationPatientId = patientId
            }

            var destinationAlertId: String?

            if let alertId = destinationDictionary["alert-id"] as? String {

                destinationAlertId = alertId
            }

            var destinationMessage: String?

            if let message = destinationDictionary["message"] as? String {

                destinationMessage = message
            }

            if destinationPatientId != nil && destinationAlertId != nil {

                notificationDestination = NotificationDestination(patientId: destinationPatientId!, alertId: destinationAlertId!, message: destinationMessage)
            }
        }
        
        return notificationDestination
    }
}
