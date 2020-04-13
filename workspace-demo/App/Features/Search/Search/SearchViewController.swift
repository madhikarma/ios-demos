//
//  SearchViewController.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import UIKit

public protocol SearchViewControllerDelegate: class {
    func searchViewControllerDidComplete(_ searchViewController: SearchViewController)
}

public final class SearchViewController: UIViewController {

    public weak var delegate: SearchViewControllerDelegate?
    public let button = UIButton()
    
    init(service: )
    public override func loadView() {
        view = UIView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        
        view.backgroundColor = .red
        
        button.setTitle("Next", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
        button.addTarget(self, action: #selector(didPressDone), for: .touchUpInside)
    }
    
    @objc private func didPressDone() {
        delegate?.searchViewControllerDidComplete(self)
    }
}
