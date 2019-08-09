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

        self.keyLabel = UILabel()
        self.keyLabel.numberOfLines = 0
        self.addSubview(self.keyLabel)

        self.valueLabel = UILabel()
        self.addSubview(self.valueLabel)

        self.keyLabel.backgroundColor = UIColor.blueColor()
        self.valueLabel.backgroundColor = UIColor.yellowColor()
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        self.keyLabel.translatesAutoresizingMaskIntoConstraints = false

        self.keyLabel.addTopConstraint(toView: self.keyLabel.superview, relation: .Equal, constant: 0.0)
        self.keyLabel.addLeftConstraint(toView: self.keyLabel.superview, attribute: .Left, relation: .Equal, constant: 0.0)
        self.keyLabel.addBottomConstraint(toView: self.keyLabel.superview)

        self.valueLabel.translatesAutoresizingMaskIntoConstraints = false

        self.valueLabel.addTopConstraint(toView: self.valueLabel.superview, relation: .Equal, constant: 0.0)
        self.valueLabel.addLeftConstraint(toView: self.keyLabel, attribute: .Right, relation: .Equal, constant: 0.0)
        self.valueLabel.addRightConstraint(toView: self.valueLabel.superview, attribute: .Right, relation: .Equal, constant: 0.0)
        self.valueLabel.addBottomConstraint(toView: self.valueLabel.superview)
        self.valueLabel.setContentCompressionResistancePriority(UILayoutPriorityFittingSizeLevel, forAxis: .Horizontal)
    }

    // MARK: - Layout subviews

    override func layoutSubviews() {

        super.layoutSubviews()

        let width: CGFloat = self.frame.size.width
        let detailViewWidth: CGFloat = self.valueLabel.frame.size.width
        let maxLayoutWidth: CGFloat = width - detailViewWidth

        self.keyLabel.preferredMaxLayoutWidth = 100.0

        super.layoutSubviews()

        print("width \(width)")
        print("detailViewWidth \(detailViewWidth)")
        print("maxLayoutWidth \(maxLayoutWidth)")
    }
}

