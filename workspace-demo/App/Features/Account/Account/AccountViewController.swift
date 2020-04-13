//
//  AccountViewController.swift
//  Account
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import UIKit

public final class AccountViewController: UIViewController {

    public override func loadView() {
        view = UIView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        view.backgroundColor = .green
    }
}
