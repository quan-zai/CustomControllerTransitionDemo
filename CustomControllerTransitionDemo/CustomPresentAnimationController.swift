//
//  CustomPresentAnimationController.swift
//  CustomControllerTransitionDemo
//
//  Created by 权仔 on 16/9/23.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let finalFrameForVC: CGRect = transitionContext.finalFrame(for: toViewController!)
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        toViewController?.view.frame = finalFrameForVC.offsetBy(dx: 0, dy: -bounds.size.height)
        containerView.addSubview(toViewController!.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: { 
                fromViewController?.view.alpha = 0.5
                toViewController?.view.frame = finalFrameForVC
            }) { (finish) in
                transitionContext.completeTransition(true)
                fromViewController?.view.alpha = 1.0
        }
    }
}
