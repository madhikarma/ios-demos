//
//  AppDelegate.swift
//  PushDemo
//
//  Created by Shagun Madhikarmi on 07/02/2016.
//  Copyright © 2016 madhikarma. All rights reserved.
//

import UIKit

let isLoggedIn: Bool = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // Create window and set root ViewController

        var firstViewController = MainViewController()

        let navigationController: UINavigationController = UINavigationController(rootViewController: firstViewController)

        let window: UIWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = navigationController
        self.window = window


        self.window?.makeKeyAndVisible()

        return true
    }
}

