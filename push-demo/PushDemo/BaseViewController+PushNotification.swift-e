//
//  BaseViewController+Notifications.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 08/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

extension BaseViewController {

    func showOrHideNotificationsDisabledIfNecessary() {

        if !NotificationProxy.sharedInstance.notificationsSupported() {

            self.showNotificationsDisabledView()

        } else {

            self.hideNotificationsDisabledView()
        }
    }
    
    func showNotificationsDisabledView() {

        self.navigationController?.setNavigationBarHidden(true, animated: true)

        self.disabledView = UIView()
        self.disabledView?.backgroundColor = UIColor.redColor()
        self.view.addSubview(disabledView!)
        self.disabledView?.translatesAutoresizingMaskIntoConstraints = false
        self.disabledView?.fillSuperView()

        let button: UIButton = UIButton()
        button.setTitle("Settings", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.disabledView!.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: disabledView)
        button.addBottomConstraint(toView: disabledView)
    }

    func hideNotificationsDisabledView() {

        self.navigationController?.setNavigationBarHidden(false, animated: true)

        self.disabledView?.removeFromSuperview()
    }

    func showNotificationsDisabledAlert() {

        let alertController = UIAlertController(title: "Notifications disabled", message: "\(UIApplication.sharedApplication().currentUserNotificationSettings()!.types)", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(okAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    }

    func showNotificationsEnabledAlert() {

        let alertController = UIAlertController(title: "Notifications enabled", message: "\(UIApplication.sharedApplication().currentUserNotificationSettings()!.types)", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(okAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
