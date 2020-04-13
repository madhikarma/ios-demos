//
//  ViewController.swift
//  CenterTest
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

import UIKit

class CenterDemoViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Populate content
        let centerDemoView: CenterDemoView = view as! CenterDemoView
        centerDemoView.customView?.titleLabel?.text = "Title"
        centerDemoView.customView?.subtitleLabel?.text = "Subtitle"
    }
}
