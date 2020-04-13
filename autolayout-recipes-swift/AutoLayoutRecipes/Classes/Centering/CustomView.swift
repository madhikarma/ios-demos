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

        titleLabel = UILabel(frame: CGRect.zero)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFontOfSize(20)
        titleLabel?.backgroundColor = UIColor.redColor()
        addSubview(titleLabel!)

        spacingView = UIView(frame: CGRect.zero)
        spacingView?.translatesAutoresizingMaskIntoConstraints = false
        spacingView?.backgroundColor = UIColor.greenColor()
        addSubview(spacingView!)

        subtitleLabel = UILabel(frame: CGRect.zero)
        subtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel?.font = UIFont.systemFontOfSize(14)
        subtitleLabel?.backgroundColor = UIColor.redColor()
        addSubview(subtitleLabel!)
    }

    override func setupConstraints() {
        titleLabel?.addTopConstraint(toView: titleLabel?.superview, relation: .Equal, constant: 0)
        titleLabel?.addBottomConstraint(toView: titleLabel?.superview, relation: .LessThanOrEqual, constant: 0)
        titleLabel?.addLeftConstraint(toView: titleLabel?.superview, relation: .Equal, constant: 0)
        titleLabel?.addRightConstraint(toView: titleLabel?.superview, relation: .Equal, constant: 0)

        spacingView?.addTopConstraint(toView: titleLabel, attribute: .Bottom, relation: .Equal, constant: 0)
        spacingView?.addHeightConstraint(toView: nil, relation: .Equal, constant: kSpacing)
        spacingView?.addLeftConstraint(toView: spacingView?.superview, relation: .Equal, constant: 0)
        spacingView?.addRightConstraint(toView: spacingView?.superview, relation: .Equal, constant: 0)

        subtitleLabel?.addTopConstraint(toView: spacingView, attribute: .Bottom, relation: .Equal, constant: 0)
        subtitleLabel?.addBottomConstraint(toView: subtitleLabel?.superview, relation: .LessThanOrEqual, constant: 0)
        subtitleLabel?.addLeftConstraint(toView: subtitleLabel?.superview, relation: .Equal, constant: 0)
        subtitleLabel?.addRightConstraint(toView: subtitleLabel?.superview, relation: .Equal, constant: 0)
    }
}
