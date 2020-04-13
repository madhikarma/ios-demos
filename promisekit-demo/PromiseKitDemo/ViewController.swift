//
//  ViewController.swift
//  PromiseKitDemo
//
//  Created by Shagun Madhikarmi on 06/05/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let store = LoginAPIStore()
        let service = LoginService(store: store)
        _ = service.login(username: "abc", password: "123").then { token in

            print("token: \(token.value)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
