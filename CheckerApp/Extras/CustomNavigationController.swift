//
//  CustomNavigationController.swift
//  CheckerApp
//
//  Created by Jayavelu on 05/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
  
            return super.popViewController(animated: false)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        var newRect = self.navigationBar.frame;
        newRect.origin.y -= newRect.size.height + 20
        self.navigationBar.frame  = newRect
        UIView .animate(withDuration: 0.3) {
            newRect.origin.y += newRect.size.height + 20
            self.navigationBar.frame = newRect
        }
    }
    
    func popNavigationBar(){
        UIView.animate(withDuration: 0.3, animations: {
            var newRect = self.navigationBar.frame
            newRect.origin.y -= self.navigationBar.frame.size.height + 20
            self.navigationBar.frame = newRect
            
        }) { (success) in
        }
    }
    
    
//
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CheckerAnimator()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


