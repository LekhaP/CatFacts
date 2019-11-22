//
//  CatFactsCell.swift
//  CatFacts
//
//  Created by Preeti Lekha on 11/18/19.
//  Copyright © 2019 Preeti Lekha. All rights reserved.
//

import UIKit

class CatFactsCell: UITableViewCell {
    @IBOutlet weak var detailLabel : UILabel!

    func setFacts(fact: String) {
        detailLabel.text = fact
    }
}

