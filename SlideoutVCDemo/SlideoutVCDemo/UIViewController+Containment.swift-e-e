//
//  UIViewController+Containment.swift
//
//
//  Created by Shagun Madhikarmi on 09/08/2019.
//  Copyright © 2019 madhikarma. All rights reserved.
//

import UIKit

// https://www.swiftbysundell.com/basics/child-view-controllers

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
