//
//  DetailViewController.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet var detailView: DetailView!
    @IBOutlet weak var viewBGHeader: UIView!
    @IBOutlet weak var viewBGFooter: UIView!
    var footer : FooterView!
    var originalFrame : CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor  = UIColor.blue;
        
        detailView.delegate = self
        detailView.tableDetail.delegate = self
        detailView.tableDetail.dataSource = self
        self.navigationController?.delegate = self

                self.navigationItem.hidesBackButton = true
                let newBackButton : UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(barButtonItemClicked))
                self.navigationItem.leftBarButtonItem = newBackButton

        self.detailView.customCell  = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as? HeaderView
        self.detailView.customCell?.backgroundColor = UIColor.clear
        self.detailView.customCell?.frame = self.originalFrame!
        UIApplication.shared.keyWindow?.addSubview(self.detailView.customCell!)
        
        
        footer  = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)?.first as? FooterView
        footer.frame = CGRect(x: 0, y: self.detailView.bounds.height, width: self.detailView.bounds.width, height: 130)
        UIApplication.shared.keyWindow?.addSubview(self.footer!)
        self.detailView?.bringSubview(toFront: self.footer)
        detailView.tableDetail.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.beginAnimations(isAnimationReverse: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func barButtonItemClicked(){
          self.beginAnimations(isAnimationReverse: true)
    }

    //Helper Methods
    func beginAnimations(isAnimationReverse : Bool){
        if(isAnimationReverse){
            UIView.animate(withDuration: 0.2, animations: {
                var newFrame = self.detailView.tableDetail.frame;
                newFrame.size.height = 0
                self.detailView.tableDetail.frame = newFrame
                self.detailView.tableDetail.alpha = 0.0
            }, completion: { (success : Bool) in
                self.animationFadeIn(isAnimationReverse:isAnimationReverse)
            })
        }else
        {
            self.animationFadeIn(isAnimationReverse:isAnimationReverse)
        }
    }
    
    func animationFadeIn(isAnimationReverse : Bool){
        
        UIView.animate(withDuration: 0.3, delay: 0.09, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            if(!isAnimationReverse){
                var newFooterFrame = self.footer.frame;
                self.originalFrame = self.detailView.customCell?.frame
                self.detailView.customCell?.frame = CGRect.init(x: (self.originalFrame?.origin.x)!, y: 70, width: (self.originalFrame?.size.width)!, height: (self.originalFrame?.size.height)!);
                newFooterFrame.origin.y = self.detailView.frame.size.height - newFooterFrame.size.height
                self.footer.frame = newFooterFrame
            }else
            {
                self.detailView.customCell?.frame = self.originalFrame!;
                var newFooterFrame = self.detailView.frame
                newFooterFrame.origin.y =  self.detailView.frame.size.height
                self.footer.frame = newFooterFrame;
                (self.navigationController as! CustomNavigationController).popNavigationBar()

               var newFrame = self.detailView.tableDetail.frame;
                newFrame.size.height  = 0;
                self.detailView.tableDetail.frame = (newFrame)
            }
        }) { (success) in
            var newFrame : CGRect?
            if(!isAnimationReverse){
                self.detailView.tableDetail.isHidden = false
                newFrame = self.detailView.tableDetail.frame;
                newFrame?.origin = CGPoint(x: 0, y: 70 + self.detailView.customCell!.frame.size.height)
                newFrame?.size.height  = 0;
                self.detailView.tableDetail.frame = (newFrame)!
            UIView.animate(withDuration: 0.3, animations: {
                if(!isAnimationReverse){
                    newFrame?.size.height = self.detailView.frame.size.height - (160 + self.footer.bounds.height)
                    self.detailView.tableDetail.frame = (newFrame)!
                    self.detailView.tableDetail.alpha = 1.0
                }
            })
            }else
            {
                self.detailView.customCell?.removeFromSuperview()
                self.footer.removeFromSuperview()
                self.navigationController?.popViewController(animated: true)
            }
            
        }

    }
    
    @objc func popViewCtrl(){
    }
    
    func addCustomCell(){
//        self.addSubview(customCell!)
        UIApplication.shared.keyWindow?.addSubview(self.detailView.customCell!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CheckerAnimator()
    }
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            //"Back pressed"
        }
    }
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil{
        }
    }
    
//    override func beginAppearanceTransition(_ isAppearing: Bool, animated: Bool) {
//        
//        if(isAppearing){
//            super.beginAppearanceTransition(isAppearing, animated: animated)
//            return
//        }
//        UIView.animate(withDuration: 0.1, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
//                self.beginAnimations(isAnimationReverse: true)
//        }) { (success) in
//            super.beginAppearanceTransition(isAppearing, animated: animated)
//        }
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//    override func viewWillDisappear(_ animated: Bool) {
//
//        if self.isMovingFromParentViewController {
//            self.beginAnimations(isAnimationReverse: true)
//        }
//        UIView.animate(withDuration: 0.1, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
//
//            super.viewWillDisappear(animated)
//
//
//        }) { (success) in
//        }
//
//    }
 }
extension DetailViewController : DetailViewProtocol{
    func backActionDelegate() {
    }
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DetailRow = tableView.dequeueReusableCell(withIdentifier: "itemDetails", for: indexPath) as! DetailRow
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header : CustomHeader = Bundle.main.loadNibNamed("Custom", owner: self, options: nil)?.first as! CustomHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

