//
//  CustomView.swift
//  CenterTest
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

import UIKit


private let kSpacing: CGFloat = 20

class CustomView: BaseView {
    
    var titleLabel: UILabel?
    var spacingView: UIView?
    var subtitleLabel: UILabel?

    
    override func setup() {
        
        super.setup()
        
        self.titleLabel = UILabel(frame: CGRectZero)
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.systemFontOfSize(20)
        self.titleLabel?.backgroundColor = UIColor.redColor()
        self.addSubview(self.titleLabel!)
        
        self.spacingView = UIView(frame: CGRectZero)
        self.spacingView?.translatesAutoresizingMaskIntoConstraints = false
        self.spacingView?.backgroundColor = UIColor.greenColor()
        self.addSubview(self.spacingView!)
        
        self.subtitleLabel = UILabel(frame: CGRectZero)
        self.subtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel?.font = UIFont.systemFontOfSize(14)
        self.subtitleLabel?.backgroundColor = UIColor.redColor()
        self.addSubview(self.subtitleLabel!)
    }
    
    override func setupConstraints() {
        
        self.titleLabel?.addTopConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: 0)
        self.titleLabel?.addBottomConstraint(toView: self.titleLabel?.superview, relation: .LessThanOrEqual, constant: 0)
        self.titleLabel?.addLeftConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: 0)
        self.titleLabel?.addRightConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: 0)
        
        self.spacingView?.addTopConstraint(toView: self.titleLabel, attribute: .Bottom, relation: .Equal, constant: 0)
        self.spacingView?.addHeightConstraint(toView: nil, relation: .Equal, constant: kSpacing)
        self.spacingView?.addLeftConstraint(toView: self.spacingView?.superview, relation: .Equal, constant: 0)
        self.spacingView?.addRightConstraint(toView: self.spacingView?.superview, relation: .Equal, constant: 0)
        
        self.subtitleLabel?.addTopConstraint(toView: self.spacingView, attribute: .Bottom, relation: .Equal, constant: 0)
        self.subtitleLabel?.addBottomConstraint(toView: self.subtitleLabel?.superview, relation: .LessThanOrEqual, constant: 0)
        self.subtitleLabel?.addLeftConstraint(toView: self.subtitleLabel?.superview, relation: .Equal, constant: 0)
        self.subtitleLabel?.addRightConstraint(toView: self.subtitleLabel?.superview, relation: .Equal, constant: 0)
    }
}
