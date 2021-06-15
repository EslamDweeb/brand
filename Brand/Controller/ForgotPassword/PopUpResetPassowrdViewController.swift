//
//  PopUpResetPassowrdViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/27/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class PopUpResetPassowrdViewController: UIViewController,ButtonActionDelegate {
    var popupView = PopupResetPasswordView()
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
        popupView.actionDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
              self.dismissPressentededControllers()
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    //MARK:- Button Action
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func continuePressed() {
        if popupView.textField.isValidEmail(popupView.textField.text) {
                  self.dismissPressentededControllers()
            self.present(EnterNewPasswordViewController(), animated: true, completion: nil)
        
         //   self.presentViewController(controller: EnterNewPasswordViewController(), transitionModal: nil, presentationStyle: nil)
        }else{
                  self.dismissPressentededControllers()
             self.presentViewController(controller: ResetCodeViewController(), transitionModal: nil, presentationStyle: nil)
        }
    }
}
