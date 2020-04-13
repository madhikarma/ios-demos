//
//  CompressionViewController.swift
//  AutoLayoutRecipes
//
//  Created by Shagun Madhikarmi on 24/04/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

class CompressionViewController: UIViewController {
    // MARK: - View lifecycle

    override func loadView() {
        super.loadView()

        view = CompressionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.grayColor()

        let itemContainerView = ItemContainerView()
        itemContainerView.layer.cornerRadius = 2.5
        itemContainerView.backgroundColor = UIColor.whiteColor()
        itemContainerView.clipsToBounds = true

//        itemContainerView.itemView.titleLabel.text = "HV 1 & 2 Antibodies............"
//        itemContainerView.itemView.keyValueView.keyLabel.text = "180"
//        itemContainerView.itemView.keyValueView.valueLabel.text = "μmol"

        itemContainerView.itemView.titleLabel.text = "HV 1 & 2 Antibodies............"
        itemContainerView.itemView.keyValueView.keyLabel.text = "180"
        itemContainerView.itemView.keyValueView.valueLabel.text = nil

//        itemContainerView.itemView.titleLabel.text = "HV 1 & 2 Antibodies............"
//        itemContainerView.itemView.keyValueView.keyLabel.text = "180,000,000.00"
//        itemContainerView.itemView.keyValueView.valueLabel.text = "μmol"

//        itemContainerView.itemView.titleLabel.text = "HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............ HV  1 & 2 Antibodies............  HIV 1 & 2 Antibodies............  HV  1 & 2 Antibodies............"
//        itemContainerView.itemView.keyValueView.keyLabel.text = "Postive blood cultures were run and the patient was unsure of what they should Postive blood cultures were run and the patient was unsure of what they should"
//        itemContainerView.itemView.keyValueView.valueLabel.text = nil

        itemContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemContainerView)

        itemContainerView.addLeftConstraint(toView: view)
        itemContainerView.addRightConstraint(toView: view)
        itemContainerView.addCenterYConstraint(toView: view)
    }
}
