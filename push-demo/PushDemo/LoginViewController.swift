//
//  ViewController.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 07/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    override func loadView() {
        super.loadView()

        view = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Login"
        titleLabel.addCenterXConstraint(toView: view)
        titleLabel.addCenterYConstraint(toView: view)
        view.addSubview(titleLabel)

        let button = UIButton()
        button.setTitle("Register", forState: .Normal)

        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: "didPressButton:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: view)
        button.addBottomConstraint(toView: view)
    }

    // MARK: - Actions

    func didPressButton(sender _: UIButton) {
        NotificationProxy.sharedInstance.registerForPushNotifications { (authorizationTokenString, error) -> Void in

            print("\(authorizationTokenString)")

            if error != nil {
                print(error!.localizedDescription)
            }

            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
