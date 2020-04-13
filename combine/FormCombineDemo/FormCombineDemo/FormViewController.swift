//
//  FormViewController.swift
//  FormCombineDemo
//
//  Created by Shagun Madhikarmi on 26/12/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

// https://www.avanderlee.com/swift/combine/

import Combine
import UIKit

class FormViewModel {
    @Published var isSubmitAllowed: String = "on"
}

class FormViewController: UIViewController {
    private var switchSubscriber: AnyCancellable?
    private var viewModel = FormViewModel()

    @IBOutlet private var acceptTermsSwitch: UISwitch!
    @IBOutlet private var submitButton: UIButton!
    @IBOutlet private var label: UILabel!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // $ to access the wrapped publisher
        switchSubscriber = viewModel.$isSubmitAllowed.receive(on: DispatchQueue.main).assign(to: \.text!, on: label)
    }

    // MARK: - Actions

    @IBAction func didSwitch(_ sender: UISwitch) {
        viewModel.isSubmitAllowed = sender.isOn ? "on" : "off"
        print(viewModel.isSubmitAllowed)
        print(String(describing: label.text))
    }
}
