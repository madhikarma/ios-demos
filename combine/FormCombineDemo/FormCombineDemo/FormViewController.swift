//
//  FormViewController.swift
//  FormCombineDemo
//
//  Created by Shagun Madhikarmi on 26/12/2019.
//  Copyright © 2019 Shagun Madhikarmi. All rights reserved.
//

import UIKit
import Combine

class FormViewController: UIViewController {

    @Published var isSubmitAllowed: String = "off"
    private var switchSubscriber: AnyCancellable?

    @IBOutlet weak var acceptTermsSwitch: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // $ to access the wrapped publisher
        switchSubscriber = $isSubmitAllowed.receive(on: DispatchQueue.main).assign(to: \.text!, on: label)
    }
    
    @IBAction func didSwitch(_ sender: UISwitch) {
        isSubmitAllowed = sender.isOn ? "on" : "off"
        print(isSubmitAllowed)
        print(label.text)
    }
}
