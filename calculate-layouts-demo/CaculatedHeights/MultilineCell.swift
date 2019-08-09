//
//  MultilineCell.swift
//  CaculatedHeights
//
//  Created by Shagun Madhikarmi on 02/04/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import UIKit

class MultilineCell: UITableViewCell {

    let middleLabel = UILabel()


    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }


    // MARK: - Setup

    private func setup() {

        setupLabel()
    }

    private func setupLabel() {

        middleLabel.numberOfLines = 0
        contentView.addSubview(middleLabel)
    }


    // MARK: - Constraints

    private func setupConstraints() {

        setupLabelConstraints()
    }

    private func setupLabelConstraints() {

        middleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            middleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            middleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            middleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            middleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
    }

    override func layoutSubviews() {

        super.layoutSubviews()
        middleLabel.preferredMaxLayoutWidth = self.bounds.size.width
        super.layoutSubviews()
    }

    class var reuseIdentifier: String {

        return "MultilineCell"
    }

    override func prepareForReuse() {

        super.prepareForReuse()
        middleLabel.text = nil
    }
}
