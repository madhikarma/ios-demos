//
//  CompressionKeyValueView.swift
//  AutoLayoutRecipes
//
//  Created by Shagun Madhikarmi on 26/04/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

private let kMargin: CGFloat = 0.0

class KeyValueView: BaseView {
    private(set) var keyLabel: UILabel!
    private(set) var valueLabel: UILabel!

    // MARK: - Setup

    override func setup() {
        super.setup()

        keyLabel = UILabel()
        keyLabel.numberOfLines = 0
        addSubview(keyLabel)

        valueLabel = UILabel()
        addSubview(valueLabel)

        keyLabel.backgroundColor = UIColor.blueColor()
        valueLabel.backgroundColor = UIColor.yellowColor()
    }

    // MARK: - Constraints

    override func setupConstraints() {
        super.setupConstraints()

        keyLabel.translatesAutoresizingMaskIntoConstraints = false

        keyLabel.addTopConstraint(toView: keyLabel.superview, relation: .Equal, constant: 0.0)
        keyLabel.addLeftConstraint(toView: keyLabel.superview, attribute: .Left, relation: .Equal, constant: 0.0)
        keyLabel.addBottomConstraint(toView: keyLabel.superview)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        valueLabel.addTopConstraint(toView: valueLabel.superview, relation: .Equal, constant: 0.0)
        valueLabel.addLeftConstraint(toView: keyLabel, attribute: .Right, relation: .Equal, constant: 0.0)
        valueLabel.addRightConstraint(toView: valueLabel.superview, attribute: .Right, relation: .Equal, constant: 0.0)
        valueLabel.addBottomConstraint(toView: valueLabel.superview)
        valueLabel.setContentCompressionResistancePriority(UILayoutPriorityFittingSizeLevel, forAxis: .Horizontal)
    }

    // MARK: - Layout subviews

    override func layoutSubviews() {
        super.layoutSubviews()

        let width: CGFloat = frame.size.width
        let detailViewWidth: CGFloat = valueLabel.frame.size.width
        let maxLayoutWidth: CGFloat = width - detailViewWidth

        keyLabel.preferredMaxLayoutWidth = 100.0

        super.layoutSubviews()

        print("width \(width)")
        print("detailViewWidth \(detailViewWidth)")
        print("maxLayoutWidth \(maxLayoutWidth)")
    }
}
