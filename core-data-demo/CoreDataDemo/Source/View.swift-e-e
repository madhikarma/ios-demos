//
//  View.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 12/05/2018.
//  Copyright © 2018 ustwo. All rights reserved.
//

import UIKit

final class View: UIView {

    let tableView = UITableView()


    // MARK: - Init

    override init(frame: CGRect) {

        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Setup

    private func setup() {

        setupTableView()
    }

    private func setupTableView() {

        addSubview(tableView)
        tableView.rowHeight = 60
    }


    // MARK: - Constraints

    private func setupConstraints() {

        setupTableViewConstraints()
    }

    private func setupTableViewConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
