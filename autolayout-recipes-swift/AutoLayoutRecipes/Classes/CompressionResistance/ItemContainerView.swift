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

        self.itemView = ItemView()
        self.addSubview(self.itemView)
    }


    // MARK: - Constraints

    override func setupConstraints() {

        super.setupConstraints()

        self.itemView.translatesAutoresizingMaskIntoConstraints = false

        self.itemView.fillSuperView(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
