//
//  ListView.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class ListView: UITableView {
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            var newFrame = view.frame;
            newFrame.size.width = newFrame.size.width/2
            view.frame = newFrame;
        }) { (success) in
            
        }
    }
    
//    override func reloadData() {
//        super.reloadData()
//
//        for var cell in self.visibleCells {
//
//            UIView.animate(withDuration: 2.0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//                let customCell : CustomListCell = cell as! CustomListCell
//                var newFrame = customCell.viewContent.frame
//                newFrame.size.width = newFrame.size.width / 2
//                customCell.viewContent.frame = newFrame
//            }, completion: nil)
//        }
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
