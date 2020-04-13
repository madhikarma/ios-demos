//
//  ViewController.swift
//  CompileDemo
//
//  Created by Shagun Madhikarmi on 31/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        doSomething()
    }

    private func doSomething() {
        let x = 6

        // Uncomment below to test how a change in a private method affects incremental compilation

        print(x)
    }
}
