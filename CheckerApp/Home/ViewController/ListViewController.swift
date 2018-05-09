//
//  ListViewController.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UINavigationControllerDelegate {
    var selectedIndex : IndexPath?
    @IBOutlet var listView: ListView!
    var footerView : CustomFooter?
    var isItemSelected : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.delegate = self
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]

//        self.footerView  = Bundle.main.loadNibNamed("CustomFooter", owner: self, options: nil)?.first as? CustomFooter
//        self.footerView?.frame = CGRect(x: 0, y: self.listView.bounds.height, width: self.listView.bounds.width, height: 49)
//        self.listView.addSubview(footerView!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
        self.beginAnimation()
        self.listView.reloadData()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let range = NSMakeRange(0, self.tableView.numberOfSections)
//        let sections = NSIndexSet(indexesIn: range)
//        self.listView.reloadSections(sections as IndexSet, with: .bottom)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomListCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomListCell
        cell.viewContent.layer.cornerRadius = 10;
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 1
//        cell.viewContent.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        cell.layer.shadowOffset = CGSize.init(width: cell.frame.size.width, height: 5)
        cell.layer.shadowRadius = 10
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if(!self.isSelected)
//        {
//            if(indexPath.row != selectedIndex)
//            {
 /*               let customCell = cell as! CustomListCell
                
                customCell.viewContent.alpha = 0.6;
//                customCell.viewContent.transform=CGAffineTransform.init(scaleX: 0.93, y: 0.93);
                UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                    customCell.viewContent.alpha = 0.8;
                    customCell.viewContent.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
                    
                    
                }, completion: { (success) in
                    UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                        customCell.viewContent.alpha = 1.0;
                        customCell.viewContent.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
                    }, completion: { (success) in
                        
                    })

                })*/
//               let customCell = cell as! CustomListCell
//
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
//                customCell.viewContent.alpha = 0.8;
//                var t = CGAffineTransform.identity
//                t = t.translatedBy(x: 100, y: 30)
//                t = t.rotated(by: CGFloat.pi / 4)
//                t = t.scaledBy(x: -1, y: 2)
//                customCell.transform = t
//        }, completion: { (success) in
//            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
//                customCell.viewContent.alpha = 1.0;
////                customCell.viewContent.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
//            }, completion: { (success) in
//                
//            })
//            
//        })
        

//                let customCell = cell as! CustomListCell
//                var newFrame = customCell.frame;
//                newFrame.origin.x += 40
//                newFrame.origin.y -= 40
//                newFrame.size.width -= 160
//                newFrame.size.height -= 160
//                customCell.alpha = 0.0
//                customCell.frame = newFrame
//                UIView.animate(withDuration:2.0, animations: { () -> Void in
//                    newFrame.origin.x -= 40
//                    newFrame.origin.y += 40
//                    newFrame.size.width += 160
//                    newFrame.size.height += 160
//                    customCell.alpha = 1.0
//                customCell.frame = newFrame
//                        }) { (finished: Bool) -> Void in
//                            UIView.animate(withDuration: 1, animations: { () -> Void in
//                //                cell.transform = .identity
//                            })}
//        }
//    }else
//        {
//
//        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.beginAnimation()
    }
    
    
    func beginAnimation(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            var newRect  = self.footerView?.frame
            if(!self.isItemSelected){
                newRect?.origin.y -= (self.footerView?.bounds.height)!
            }else{
                newRect?.origin.y = (self.listView?.bounds.height)!
            }
            self.isItemSelected = !self.isItemSelected
            self.footerView?.frame = newRect!
        }) { (succssful) in
            if(!self.isItemSelected){
            self.performSegue(withIdentifier: "detailSegueidentifier", sender: self)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegueidentifier" {
            if segue.destination is DetailViewController {
                
                let cell : CustomListCell = (self.listView .cellForRow(at:self.listView.indexPathForSelectedRow!))! as! CustomListCell
                if let destinationVC = segue.destination as? DetailViewController {
                                       let point = (cell.superview?.convert(cell.frame.origin, to: nil))!
                    (destinationVC as DetailViewController).originalFrame = CGRect(x: point.x, y: point.y, width: cell.bounds.width, height: cell.bounds.height)
                }

            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CheckerAnimator()
    }
}
