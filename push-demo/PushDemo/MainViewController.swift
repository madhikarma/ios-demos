//
//  MainViewController.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 08/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func loadView() {

        super.loadView()

        self.view = UIView()
    }

    override func viewWillAppear(animated: Bool) {

        if !isLoggedIn {

            self.navigationController?.presentViewController(LoginViewController(), animated: true, completion: nil)
        }

        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "Main"
        self.view.backgroundColor = UIColor.whiteColor()

        let button = UIButton()
        button.setTitle("Go to detail", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: "didPressButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: self.view)
        button.addBottomConstraint(toView: self.view)
    }

    func didPressButton(sender: UIButton) {

        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
