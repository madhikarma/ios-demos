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
            showNotificationsDisabledView()

        } else {
            hideNotificationsDisabledView()
        }
    }

    func showNotificationsDisabledView() {
        navigationController?.setNavigationBarHidden(true, animated: true)

        disabledView = UIView()
        disabledView?.backgroundColor = UIColor.redColor()
        view.addSubview(disabledView!)
        disabledView?.translatesAutoresizingMaskIntoConstraints = false
        disabledView?.fillSuperView()

        let button: UIButton = UIButton()
        button.setTitle("Settings", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        disabledView!.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: disabledView)
        button.addBottomConstraint(toView: disabledView)
    }

    func hideNotificationsDisabledView() {
        navigationController?.setNavigationBarHidden(false, animated: true)

        disabledView?.removeFromSuperview()
    }

    func showNotificationsDisabledAlert() {
        let alertController = UIAlertController(title: "Notifications disabled", message: "\(UIApplication.sharedApplication().currentUserNotificationSettings()!.types)", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(okAction)

        presentViewController(alertController, animated: true, completion: nil)
    }

    func showNotificationsEnabledAlert() {
        let alertController = UIAlertController(title: "Notifications enabled", message: "\(UIApplication.sharedApplication().currentUserNotificationSettings()!.types)", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertController.addAction(okAction)

        presentViewController(alertController, animated: true, completion: nil)
    }
}
