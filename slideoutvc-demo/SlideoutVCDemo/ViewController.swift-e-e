//
//  ViewController.swift
//  SlideoutVCDemo
//
//  Created by Shagun Madhikarmi on 05/08/2019.
//  Copyright © 2019 madhikarma. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {

    func didPressFilterButton(_ viewController: ViewController)
}
class ViewController: UIViewController {

    @IBOutlet weak var filterButton: UIButton!

    weak var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didPressFilter(_ sender: Any) {

        print("MenuViewController::didPressFilter")
        delegate?.didPressFilterButton(self)
    }
}

