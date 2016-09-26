//
//  ResultViewController.swift
//  CustomControllerTransitionDemo
//
//  Created by 权仔 on 16/9/22.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    weak var dismissButton = UIButton()
    
    let customNavigationAnimationController = CustomNavigationAnimationController()
    
    let customPresentAnimationController = CustomPresentAnimationController()
    
    let customDismissAnimationController = CustomDismissAnimationController()
    
    var imageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: 50, y: 20, width: UIScreen.main.bounds.width - 100, height: 300))
        imageView?.image = UIImage(named: "image.jpg")
        
        view.addSubview(imageView!)
        
        view.backgroundColor = UIColor.white
        self.transitioningDelegate = self
        self.navigationController?.delegate = self;
        
        let button = UIButton(type: .system)
        button.setTitle("dismiss", for: .normal)
        button.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        button.addTarget(self, action: #selector(dismissAction(button:)), for: .touchUpInside)
        view.addSubview(button)
        self.dismissButton = button
    }
    
    func dismissAction(button : UIButton) {
        self.dismiss(animated: true, completion: nil);
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
     
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            customNavigationAnimationController.reverse = true
        } else {
            customNavigationAnimationController.reverse = false
        }
        return customNavigationAnimationController
    }
}
