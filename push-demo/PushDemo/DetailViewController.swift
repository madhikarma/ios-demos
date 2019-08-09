//
//  DetailViewController.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 08/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    override func loadView() {

        super.loadView()

        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "Detail"

    }

}
