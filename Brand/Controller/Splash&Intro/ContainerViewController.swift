//
//  RootViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let reachability =  Reachability()
    private var current: UIViewController?
    
    //initializer to the class and create the first ViewController we want to load
    init() {
        self.current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(current!)
        current?.view.frame = view.bounds
        view.addSubview((current?.view)!)
        current?.didMove(toParent: self)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        handelReachability(reachability: reachability)
//    }
//    deinit {
//        stopNotifier(reachability: reachability)
//    }
    func showLoginScreen() {
        let new =  LoginViewController()
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current?.willMove(toParent: nil)
        current?.view.removeFromSuperview()
        current?.removeFromParent()
        current = new
    }
}


