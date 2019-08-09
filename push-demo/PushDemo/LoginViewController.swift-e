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

        self.view = UIView()
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Login"
        titleLabel.addCenterXConstraint(toView: self.view)
        titleLabel.addCenterYConstraint(toView: self.view)
        self.view.addSubview(titleLabel)

        let button = UIButton()
        button.setTitle("Register", forState: .Normal)

        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: "didPressButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: self.view)
        button.addBottomConstraint(toView: self.view)
    }


    // MARK: - Actions

    func didPressButton(sender: UIButton) {

        NotificationProxy.sharedInstance.registerForPushNotifications { (authorizationTokenString, error) -> () in

            print("\(authorizationTokenString)")

            if error != nil {

                print(error!.localizedDescription)
            }

            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
