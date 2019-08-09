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

        self.titleLabel = UILabel()
        self.titleLabel.numberOfLines = 0
        self.addSubview(self.titleLabel)

        self.keyValueView = KeyValueView()
        self.addSubview(self.keyValueView)

        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.keyValueView.backgroundColor = UIColor.redColor()

        self.backgroundColor = UIColor.redColor()
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.addTopConstraint(toView: self.titleLabel.superview, relation: .Equal, constant: 0.0)
        self.titleLabel.addLeftConstraint(toView: self.titleLabel.superview, attribute: .Left, relation: .Equal, constant: kMargin)
        self.titleLabel.addBottomConstraint(toView: self.titleLabel.superview, relation: .LessThanOrEqual, constant: 0.0)

        self.keyValueView.translatesAutoresizingMaskIntoConstraints = false

        self.keyValueView.addTopConstraint(toView: self.keyValueView.superview, relation: .Equal, constant: 0.0)
        self.keyValueView.addLeftConstraint(toView: self.titleLabel, attribute: .Right, relation: .GreaterThanOrEqual, constant: 0.0)
        self.keyValueView.addRightConstraint(toView: self.keyValueView.superview, attribute: .Right, relation: .Equal, constant: 0.0)
        self.keyValueView.addBottomConstraint(toView: self.keyValueView.superview, relation: .LessThanOrEqual, constant: 0.0)
    }


    // MARK: - Layout subviews

    override func layoutSubviews() {

        super.layoutSubviews()

        let width: CGFloat = self.frame.size.width
        let detailViewWidth: CGFloat = self.keyValueView.frame.size.width
        let maxLayoutWidth: CGFloat = width - detailViewWidth

        self.titleLabel.preferredMaxLayoutWidth = maxLayoutWidth

        super.layoutSubviews()

        print("width \(width)")
        print("detailViewWidth \(detailViewWidth)")
        print("maxLayoutWidth \(maxLayoutWidth)")
    }
}
