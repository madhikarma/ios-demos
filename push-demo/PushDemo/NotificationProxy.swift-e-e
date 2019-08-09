//
//  NotificationProxy.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 02/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import Foundation
import Google

class NotificationProxy: NSObject, GGLInstanceIDDelegate {

    private var senderId: String?
    private var deviceToken: NSData?
    private var authorizationTokenString: NSString?
    private var registrationOptions: [String: AnyObject] = [String: AnyObject]()
    private var registrationCompletionBlock: ((String?, NSError?) -> ())?


    // Singleton

    static let sharedInstance = NotificationProxy()


    // MARK: - Initialisers

    override init() {

        super.init()

        self.setup()
    }

    func setup() {

        var error: NSError?

        GGLContext.sharedInstance().configureWithError(&error)
        self.senderId = GGLContext.sharedInstance().configuration.gcmSenderID

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAppDidRegisterForRemoteNotificationSuccess:", name: kAppDidRegisterForRemoteNotificationSuccess, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAppDidRegisterForRemoteNotificationFail:", name: kAppDidRegisterForRemoteNotificationFail, object: nil)
    }


    // MARK: - Registration

    func registerForPushNotifications(completion: ((authorizationTokenString: String?, error: NSError?) -> ())?) {

        // Store the closure

        self.registrationCompletionBlock = completion

        // Note. will wait for notification to trigger

        // 1. Register with Apple push notifications

        if !UIDevice.isRunningSimulator {

            self.authorizePushNotificationAccess()

        } else {

            if let completionBlock = completion {

                completionBlock(authorizationTokenString: nil, error: nil)
            }
        }
    }

    private func authorizePushNotificationAccess() {

        print("authorizePushNotificationAccess")

        // Setup Apple Push Notifications

        let allNotificationTypes: UIUserNotificationType = [.Sound, .Alert, .Badge]
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: allNotificationTypes, categories: nil)

        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }

    private func authorizePushNotificationProviderAccess(deviceToken: NSData, completion: ((authorizationTokenString: String?, error: NSError?) -> ())?) {

        print("authorizePushNotificationProviderAccess")

        // Store Apple's Push Notification token (in case we need to refresh Google's token)

        self.deviceToken = deviceToken

        // Create a config and set a delegate that implements the GGLInstanceIDDelegate protocol.

        let instanceIDConfig: GGLInstanceIDConfig = GGLInstanceIDConfig.defaultConfig()
        instanceIDConfig.delegate = self

        // Start the GGLInstanceID shared instance with the that config and request a registration
        // token to enable reception of notifications

        GGLInstanceID.sharedInstance().startWithConfig(instanceIDConfig)

        // Create / Store registration options for Google Cloud Messaging (in case we need to refresh Google's token)

        #if SANDBOX
            self.registrationOptions = [kGGLInstanceIDRegisterAPNSOption: deviceToken, kGGLInstanceIDAPNSServerTypeSandboxOption: true]
        #else
            self.registrationOptions = [kGGLInstanceIDRegisterAPNSOption: deviceToken, kGGLInstanceIDAPNSServerTypeSandboxOption: false]
        #endif

        // Get the sender id for this app (from the configured context but originally from the info plist)

        let senderId: String = GGLContext.sharedInstance().configuration.gcmSenderID

        // Get token string from Google for this app

        GGLInstanceID.sharedInstance().tokenWithAuthorizedEntity(senderId, scope: kGGLInstanceIDScopeGCM, options: self.registrationOptions, handler: { (authorizationTokenString, error) -> Void in

            print("\(authorizationTokenString)")

            if let tokenString = authorizationTokenString {

                // Store token string e.g. for Login requests

                self.authorizationTokenString = tokenString
            }

            // Trigger completion block

            if let completionBlock = completion {

                completionBlock(authorizationTokenString: authorizationTokenString, error: error)
            }
        })
    }


    // MARK: - Notification actions

    func handleAppDidRegisterForRemoteNotificationSuccess(notification: NSNotification) {

        print("handleAppDidRegisterForRemoteNotificationSuccess")

        if let deviceToken: NSData = notification.object as? NSData {

            // 1. Register with Push notification provider

            self.authorizePushNotificationProviderAccess(deviceToken, completion: self.registrationCompletionBlock)
        }
    }

    func handleAppDidRegisterForRemoteNotificationFail(notification: NSNotification) {

      print("handleAppDidRegisterForRemoteNotificationFail")

        if let registrationCompletion = self.registrationCompletionBlock {

            // Send failure

            // TODO: error

            let error: NSError = NSError(domain: "AppErrorDomain", code: 101, userInfo: nil)

            registrationCompletion(nil, error)
        }
    }


    // MARK: - Cancellation

    func cancelRequests() {

      self.registrationCompletionBlock = nil
    }


    // MARK: - GGLInstanceIDDelegate

    func onTokenRefresh() {

      print("onTokenRefresh")

        if let deviceTokenData = self.deviceToken {

            self.authorizePushNotificationProviderAccess(deviceTokenData, completion: nil)
        }
    }

    func notificationsSupported() -> Bool {

        var notificationsSupported: Bool = false

        if let currentUserNotificationSettings = UIApplication.sharedApplication().currentUserNotificationSettings() {

            if currentUserNotificationSettings.types.rawValue & UIUserNotificationType.Alert.rawValue != 0 {

                notificationsSupported = true

            }
        }
        
        return notificationsSupported
    }
}
