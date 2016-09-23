//
//  ResultViewController.swift
//  CustomControllerTransitionDemo
//
//  Created by 权仔 on 16/9/22.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIViewControllerTransitioningDelegate {

    weak var dismissButton = UIButton()
    
    let customPresentAnimationController = CustomPresentAnimationController()
    
    let customDismissAnimationController = CustomDismissAnimationController()
    
    let imageView:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        imageView.image = UIImage(named: "image.jpg")
        
        view.addSubview(imageView)
        
        view.backgroundColor = UIColor.white
        self.transitioningDelegate = self
        
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
}
