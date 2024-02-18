//
//  ViewController.swift
//  UIKitTest6
//
//  Created by M K on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {
    let squareView = UIView()
    
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    func setupViews() {
        squareView.backgroundColor = .systemBlue
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.center = view.center
        squareView.layer.cornerRadius = 10

        view.addSubview(squareView)
        squareView.translatesAutoresizingMaskIntoConstraints = false
        
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator.removeAllBehaviors()
        let touch = touches.first!
        let location = touch.location(in: self.view)
        
        snapBehavior = UISnapBehavior(item: squareView, snapTo: location)
        snapBehavior?.damping = 0.8
        animator.addBehavior(snapBehavior!)
    }

}

