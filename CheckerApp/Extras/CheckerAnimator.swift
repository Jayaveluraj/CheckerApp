//
//  CheckerAnimator.swift
//  CheckerApp
//
//  Created by Jayavelu on 06/05/18.
//  Copyright © 2018 Jayavelu. All rights reserved.
//

import UIKit

class CheckerAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let isPush = ((toViewController?.navigationController?.viewControllers.index(of: toViewController!)) as! Int > (fromViewController?.navigationController?.viewControllers.index(of: fromViewController!)) as! Int);
        let fromView = transitionContext .view(forKey: .from)
        let toView  = transitionContext .view(forKey: .to)
        transitionContext.containerView.addSubview(toView!)
        if(isPush)
        {
            toView?.alpha  = 0.7;
            UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                toView?.alpha  = 1.0;
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            }) { (success : Bool) in
            }

        }else
        {
            fromView?.alpha  = 1.0;
            UIView.animate(withDuration:0.3, animations: {
                fromView?.alpha  = 1.0;
            }, completion: { (success : Bool) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        let isPush = ((transitionContext?.viewController(forKey: .to)?.navigationController?.viewControllers.index(of: (transitionContext?.viewController(forKey: .to)!)!)) as! Int > (transitionContext?.viewController(forKey: .from)?.navigationController?.viewControllers.index(of: (transitionContext?.viewController(forKey: .from)!)!)) as! Int);
        if(isPush)
        {
            return 0.0
        }else{
            return 0.0
        }
    }
}

