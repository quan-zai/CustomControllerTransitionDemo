//
//  CustomDismissAnimationController.swift
//  CustomControllerTransitionDemo
//
//  Created by 权仔 on 16/9/23.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromeViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let finalFrameForVC = transitionContext.finalFrame(for: toViewController!)
        let containerView = transitionContext.containerView
        toViewController?.view.frame = finalFrameForVC.insetBy(dx: 40, dy: 40)
        toViewController?.view.alpha = 0
        
        let snapshotView = fromeViewController?.view.snapshotView(afterScreenUpdates: false)
        
        snapshotView?.frame = (fromeViewController?.view.frame)!
        snapshotView?.alpha = 1.0
        containerView.addSubview(toViewController!.view)
        containerView.sendSubview(toBack: toViewController!.view)
        
        fromeViewController?.view.removeFromSuperview()
        containerView.addSubview(snapshotView!)
        
        UIView.animate(withDuration:  transitionDuration(using: transitionContext), delay: 1, options: .curveEaseIn, animations: {
            snapshotView?.frame = (fromeViewController?.view.frame.insetBy(dx: (fromeViewController?.view.frame.size.width)! / 2,
                                                                           dy: (fromeViewController?.view.frame.size.height)! / 2))!
            toViewController?.view.alpha = 1.0
            toViewController?.view.frame = finalFrameForVC
        }) { (finish) in
            snapshotView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}
