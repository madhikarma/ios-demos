//
//  ViewController.swift
//  ATTDemo
//
//  Created by Shagun Madhikarmi on 14/02/2021.
//

import AdSupport
import AppTrackingTransparency
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            ATTrackingManager.requestTrackingAuthorization { status in
                let statusMessage: String
                switch status {
                case .authorized:
                    print("Status: authorised")
                    statusMessage = "authorised"
                case .denied:
                    print("Status: denied")
                    statusMessage = "denied"
                case .notDetermined:
                    print("Status: not determined")
                    statusMessage = "not determined"
                case .restricted:
                    print("Status: restricted")
                    statusMessage = "restricted"
                @unknown default:
                    print("Status: unknown")
                    statusMessage = "unknown"
                }

                DispatchQueue.main.async {
                    let message: String = "status: \(statusMessage), id: \(ASIdentifierManager.shared().advertisingIdentifier)"
                    let alertController = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
