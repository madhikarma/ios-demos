//
//  CompressionItemView.swift
//  AutoLayoutRecipes
//
//  Created by Shagun Madhikarmi on 24/04/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

private let kMargin: CGFloat = 0.0

class ItemView: BaseView {
    private(set) var titleLabel: UILabel!
    private(set) var keyValueView: KeyValueView!
    private(set) var rightImageView: UIImageView!

    // MARK: - Setup

    override func setup() {
        super.setup()

        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)

        keyValueView = KeyValueView()
        addSubview(keyValueView)

        titleLabel.backgroundColor = UIColor.greenColor()
        keyValueView.backgroundColor = UIColor.redColor()

        backgroundColor = UIColor.redColor()
    }

    // MARK: - Constraints

    override func setupConstraints() {
        super.setupConstraints()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.addTopConstraint(toView: titleLabel.superview, relation: .Equal, constant: 0.0)
        titleLabel.addLeftConstraint(toView: titleLabel.superview, attribute: .Left, relation: .Equal, constant: kMargin)
        titleLabel.addBottomConstraint(toView: titleLabel.superview, relation: .LessThanOrEqual, constant: 0.0)

        keyValueView.translatesAutoresizingMaskIntoConstraints = false

        keyValueView.addTopConstraint(toView: keyValueView.superview, relation: .Equal, constant: 0.0)
        keyValueView.addLeftConstraint(toView: titleLabel, attribute: .Right, relation: .GreaterThanOrEqual, constant: 0.0)
        keyValueView.addRightConstraint(toView: keyValueView.superview, attribute: .Right, relation: .Equal, constant: 0.0)
        keyValueView.addBottomConstraint(toView: keyValueView.superview, relation: .LessThanOrEqual, constant: 0.0)
    }

    // MARK: - Layout subviews

    override func layoutSubviews() {
        super.layoutSubviews()

        let width: CGFloat = frame.size.width
        let detailViewWidth: CGFloat = keyValueView.frame.size.width
        let maxLayoutWidth: CGFloat = width - detailViewWidth

        titleLabel.preferredMaxLayoutWidth = maxLayoutWidth

        super.layoutSubviews()

        print("width \(width)")
        print("detailViewWidth \(detailViewWidth)")
        print("maxLayoutWidth \(maxLayoutWidth)")
    }
}
