//
//  FooterView.swift
//  CheckerApp
//
//  Created by Jayavelu on 08/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class FooterView: UIView {

    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var btnDropBox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnMessage.layer.cornerRadius = self.btnMessage.frame.size.width/2
            self.btnDropBox.layer.cornerRadius = self.btnMessage.frame.size.width/2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
