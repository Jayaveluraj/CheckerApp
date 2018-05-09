//
//  DetailRow.swift
//  CheckerApp
//
//  Created by Jayavelu on 06/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class DetailRow: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
