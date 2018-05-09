//
//  CustomListCellTableViewCell.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class CustomListCell: UITableViewCell {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewContent.layer.masksToBounds =  false
        viewContent.layer.shadowColor = UIColor.darkGray.cgColor
        viewContent.layer.shadowOffset = CGSize.init(width: 0.1, height: 5.0)
        viewContent.layer.shadowOpacity = 0.3
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
