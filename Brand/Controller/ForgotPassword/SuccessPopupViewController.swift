    //
//  SuccessPopupViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
    
    class SuccessPopupViewController:UIViewController,ButtonActionDelegate {
        var popupView = SuccessPopupView()
        let reachability =  Reachability()
        
        //MARK:- View Life Cycle
        override func loadView() {
            super.loadView()
            view = popupView
        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        }
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            self.popupView.actionDelegate = self
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {

                self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
            
                   self.presentViewController(controller: LoginViewController(), transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)

   
            }
   
        }
        override func viewWillAppear(_ animated: Bool) {
            handelReachability(reachability: reachability)
        }
        override func viewWillDisappear(_ animated: Bool) {
            stopNotifier(reachability: reachability)
        }
    }
