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

        view = UIView()
    }

    override func viewWillAppear(animated: Bool) {
        if !isLoggedIn {
            navigationController?.presentViewController(LoginViewController(), animated: true, completion: nil)
        }

        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Main"
        view.backgroundColor = UIColor.whiteColor()

        let button = UIButton()
        button.setTitle("Go to detail", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: "didPressButton:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCenterXConstraint(toView: view)
        button.addBottomConstraint(toView: view)
    }

    func didPressButton(sender _: UIButton) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
