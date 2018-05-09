//
//  HeaderView.swift
//  CheckerApp
//
//  Created by Jayavelu on 08/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDateValue: UILabel!
    @IBOutlet weak var lblAmountValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewContent.layer.cornerRadius = 10
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewContent.layer.masksToBounds =  false
        viewContent.layer.shadowColor = UIColor.darkGray.cgColor
        viewContent.layer.shadowOffset = CGSize.init(width: 0.1, height: 5.0)
        viewContent.layer.shadowOpacity = 0.3
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
