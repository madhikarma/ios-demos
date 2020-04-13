//
//  CenteringView.swift
//  CenterTest
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

import UIKit

/**
 CenterDemoView is the main view of CenterDemoViewController and centers its subview
 */
class CenterDemoView: BaseView {
    var customView: CustomView?

    override func setup() {
        super.setup()

        customView = CustomView(frame: CGRect.zero)
        customView?.clipsToBounds = true
        customView?.translatesAutoresizingMaskIntoConstraints = false
        customView?.backgroundColor = UIColor.blueColor()
        addSubview(customView!)
    }

    override func setupConstraints() {
        // Height and width is automatically inferred by the view's subview arrangement
        customView?.addHeightConstraint(toView: nil, relation: .GreaterThanOrEqual, constant: 0.0)
        customView?.addWidthConstraint(toView: nil, relation: .GreaterThanOrEqual, constant: 0.0)
        customView?.addCenterXConstraint(toView: customView?.superview)
        customView?.addCenterYConstraint(toView: customView?.superview)
    }
}
