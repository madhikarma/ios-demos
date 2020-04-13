//
//  HostViewController.swift
//  SlideoutVCDemo
//
//  Created by Shagun Madhikarmi on 09/08/2019.
//  Copyright © 2019 madhikarma. All rights reserved.
//

import UIKit

class HostViewController: UIViewController {
    private var viewController: ViewController!
    let menuViewController = MenuViewController()

    var leadingConstraint: NSLayoutConstraint?
    var isOpen: Bool = false

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = UIView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Content
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            return
        }
        self.viewController = viewController
        self.viewController.view.backgroundColor = .blue
        self.viewController.filterButton.backgroundColor = .green
        self.viewController.delegate = self
        add(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                viewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            ])

        // Menu
        add(menuViewController)
        menuViewController.view.backgroundColor = .purple
        menuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        leadingConstraint = menuViewController.view.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        NSLayoutConstraint.activate(
            [
                menuViewController.view.topAnchor.constraint(equalTo: viewController.filterButton.bottomAnchor, constant: 0),
                leadingConstraint!,
                menuViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: 0),
                menuViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ])
    }
}

// MARK: - ViewControllerDelegate

extension HostViewController: ViewControllerDelegate {
    func didPressFilterButton(_: ViewController) {
        let damping: CGFloat
        let velocity: CGFloat
        if !isOpen {
            leadingConstraint?.isActive = false
            leadingConstraint =
                menuViewController.view.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            leadingConstraint?.isActive = true

            damping = 1
            velocity = 0.4
        } else {
            leadingConstraint?.isActive = false
            leadingConstraint =
                menuViewController.view.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            leadingConstraint?.isActive = true

            damping = 1
            velocity = 1
        }

        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: .curveEaseInOut,
                       animations: {
                           self.view.layoutIfNeeded()

        }) { _ in
            print("done")
            self.isOpen = !self.isOpen
        }
//
//        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
//
//        }, completion: { (flag) in
//
//
//
//        })
    }
}
