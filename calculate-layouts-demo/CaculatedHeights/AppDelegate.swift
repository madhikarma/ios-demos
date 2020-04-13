//
//  AppDelegate.swift
//  CaculatedHeights
//
//  Created by Shagun Madhikarmi on 02/04/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let screen = UIScreen.main
        window = UIWindow(frame: screen.bounds)
        window?.rootViewController = ViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        return true
    }
}
