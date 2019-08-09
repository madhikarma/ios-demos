//
//  AppDelegate.swift
//  AutoLayoutRecipes
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let viewController = CompressionViewController()
        let window: UIWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window = window
        self.window?.makeKeyAndVisible()

        return true
    }
}

