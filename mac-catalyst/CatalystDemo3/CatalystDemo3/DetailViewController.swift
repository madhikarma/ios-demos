//
//  DetailViewController.swift
//  CatalystDemo3
//
//  Created by Beta on 07/11/2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // UI
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    private let red = UIView()
    
    // Model
    var detailItem: Breed? {
        didSet {
            updateUI()
        }
    }
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    
    // MARK: - User interface
    
    private func setupUI() {
        red.backgroundColor = .red
        view.addSubview(red)
        red.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            red.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            red.topAnchor.constraint(equalTo:  detailDescriptionLabel.bottomAnchor, constant: 10),
            red.widthAnchor.constraint(equalToConstant: 200),
            red.heightAnchor.constraint(equalToConstant: 200)
        ])
    
        let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
        red.addGestureRecognizer(hover)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panning(_:)))
        red.addGestureRecognizer(pan)
    }
    
    private func updateUI() {
        guard let detail = detailItem,
            let label = detailDescriptionLabel else {
                return
        }
        label.text = detail.name
    }
    
    
    // MARK: - Actions
    
    @objc private func hovering(_ recognizer: UIHoverGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            red.backgroundColor = .green
        case .ended:
            red.backgroundColor = .red
        default:
            break
        }
    }

    @objc private func panning(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self.view)
    }
}

