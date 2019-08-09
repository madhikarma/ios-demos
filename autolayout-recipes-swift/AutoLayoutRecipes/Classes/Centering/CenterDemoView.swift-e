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
        
        self.customView = CustomView(frame: CGRectZero)
        self.customView?.clipsToBounds = true
        self.customView?.translatesAutoresizingMaskIntoConstraints = false
        self.customView?.backgroundColor = UIColor.blueColor()
        self.addSubview(self.customView!)
    }
    
    override func setupConstraints() {
        
        // Height and width is automatically inferred by the view's subview arrangement
        self.customView?.addHeightConstraint(toView: nil, relation: .GreaterThanOrEqual, constant: 0.0)
        self.customView?.addWidthConstraint(toView: nil, relation: .GreaterThanOrEqual, constant: 0.0)
        self.customView?.addCenterXConstraint(toView: self.customView?.superview)
        self.customView?.addCenterYConstraint(toView: self.customView?.superview)
    }
}
