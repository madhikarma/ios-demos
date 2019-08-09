//
//  ViewController.swift
//  CaculatedHeights
//
//  Created by Shagun Madhikarmi on 02/04/2017.
//  Copyright © 2017 madhikarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mainView: View {

        return view as! View
    }

    override func loadView() {

        view = View()
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MultilineCell.self, forCellReuseIdentifier: MultilineCell.reuseIdentifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        mainView.addSubview(tableView)

        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: mainView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            ])

        tableView.reloadData()

        tableView.backgroundColor = .red

        let totalHeight = calculateHeight()
        print("totalHeight: \(totalHeight)")
    }


    // MARK: - Calculate Height

    private func calculateHeight() -> CGFloat {

        let multilineCell = MultilineCell()

        var accumulatedHeight: CGFloat = 0

        for index in 0..<100 {

            let calculatedSize = calculateCellSize(cell: multilineCell, indexPath: IndexPath(row: index, section: 0))
            accumulatedHeight += calculatedSize.height
        }

        print("accumulatedHeight: \(accumulatedHeight)")

        return accumulatedHeight
    }

    private func calculateCellSize(cell: MultilineCell, indexPath: IndexPath) -> CGSize {

        configureMultilineCell(cell: cell, indexPath: indexPath)

        cell.layoutSubviews()
        cell.layoutIfNeeded()

        let calculatedSize = cell.systemLayoutSizeFitting(UILayoutFittingCompressedSize)

        print("calculatedSize: \(calculatedSize)")

        // calculatedSize: (2729.5, 21.0) if calling systemLayoutSizeFitting on multilineCell.contentView with no preferedMaxLayoutWidth set
        // calculatedSize: (320.0, 203.5) if calling systemLayoutSizeFitting on multilineCell with preferedMaxLayoutWidth set
        // calculatedSize: (320.0, 203.0) if calling systemLayoutSizeFitting on multilineCell.contentView with preferedMaxLayoutWidth set

        return calculatedSize
    }

    fileprivate func configureMultilineCell(cell: MultilineCell, indexPath: IndexPath) {

        cell.middleLabel.text = "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts."
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 100
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let multilineCell = tableView.dequeueReusableCell(withIdentifier: MultilineCell.reuseIdentifier, for: indexPath) as? MultilineCell else {
            assertionFailure("Error: could not load MultilineCell")
            return UITableViewCell()
        }

        configureMultilineCell(cell: multilineCell, indexPath: indexPath)

        multilineCell.backgroundColor = .red
        multilineCell.contentView.backgroundColor = .blue
        multilineCell.middleLabel.backgroundColor = .green

        return multilineCell
    }
}
