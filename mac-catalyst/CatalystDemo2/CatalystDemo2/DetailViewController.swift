//
//  DetailViewController.swift
//  CatalystDemo2
//
//  Created by Shagun Beta on 05/11/2019.
//  Copyright © 2019 madhikarma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    let red = UIView()

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            updateUI()
        }
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
      red.backgroundColor = .red
      view.addSubview(red)
      red.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          red.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
          red.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor),
          red.widthAnchor.constraint(equalToConstant: 200),
          red.heightAnchor.constraint(equalToConstant: 200)
      ])
      
      let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
      red.addGestureRecognizer(hover)
    }

    func updateUI() {
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    
    // MARK: - Actions
    
    @objc
    func hovering(_ recognizer: UIHoverGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            red.backgroundColor = .green
        case .ended:
            red.backgroundColor = .red
        default:
            break
        }
    }

}

