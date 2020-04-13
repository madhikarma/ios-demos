//
//  CompressionItemView.swift
//  AutoLayoutRecipes
//
//  Created by Shagun Madhikarmi on 26/04/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

class ItemContainerView: BaseView {
    private(set) var itemView: ItemView!

    // MARK: - Setup

    override func setup() {
        super.setup()

        itemView = ItemView()
        addSubview(itemView)
    }

    // MARK: - Constraints

    override func setupConstraints() {
        super.setupConstraints()

        itemView.translatesAutoresizingMaskIntoConstraints = false

        itemView.fillSuperView(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
