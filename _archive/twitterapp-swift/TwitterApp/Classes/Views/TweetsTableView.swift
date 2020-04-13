//
//  TweetsTableView.swift
//  TwitterApp
//
//  Created by Shagun Madhikarmi on 01/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit

class TweetsTableView: UITableView {
    override func awakeFromNib() {
        super.awakeFromNib()

        separatorStyle = UITableViewCellSeparatorStyle.SingleLineEtched
    }
}
