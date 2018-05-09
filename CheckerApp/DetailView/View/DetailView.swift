//
//  DetailView.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit
protocol DetailViewProtocol{
    func backActionDelegate()
}
class DetailView: UIView {
    var customCell : HeaderView?
    var delegate : DetailViewProtocol?
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tableDetail : UITableView!
    override func awakeFromNib() {
    }
    
    func addCustomCell(){
        self.addSubview(customCell!)
    }
    @IBAction func btnBackAction(_ sender: Any) {
            delegate?.backActionDelegate()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
