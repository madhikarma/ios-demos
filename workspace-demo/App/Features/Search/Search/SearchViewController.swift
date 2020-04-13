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
    private let button = UIButton()
    private let searchService: SearchServiceProtocol
    
    public init(service: SearchServiceProtocol = SearchService()) {
        self.searchService = service
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        let publisher = searchService.getSearchResults("swift").sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished:
                print("finished")
                let alert = UIAlertController(title: "Finished", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(okAction)
                break
            case .failure(let error):
                print("received the error: ", error)
                
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(okAction)
                break
            }
        }, receiveValue: { (someValue) in
            print(".sink() received \(someValue)")
            
            let alert = UIAlertController(title: "received value", message: "\(someValue)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)

        })

    }
    
    @objc private func didPressDone() {
        delegate?.searchViewControllerDidComplete(self)
    }
}
