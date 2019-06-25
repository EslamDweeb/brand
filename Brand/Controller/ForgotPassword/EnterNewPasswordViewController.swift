//
//  EnterNewPasswordViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class EnterNewPasswordViewController: UIViewController, ButtonActionDelegate {
    var resetView = EnterNewPasswordView()
    let reachability =  Reachability()
       var toggled = true
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK:- View Life Cycle
    override func loadView() {
        super.loadView()
        view = resetView
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView.actionDelegate = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    //MARK:- Button Action
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    //confirmBtnAction
    func continuePressed() {
             self.dismissPressentededControllers()
        self.presentViewController(controller: SuccessPopupViewController(), transitionModal: .crossDissolve, presentationStyle: nil)
        
    }
    func changeBtn() {
        if resetView.textField.text == ""{
            resetView.confirmBtn.isEnabled = false
            resetView.confirmBtn.backgroundColor = .lightgray
            resetView.confirmBtn.setShadow(shadowColor: UIColor.lightgray.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 0, shadowRaduis: 0)
        }else{
            resetView.confirmBtn.isEnabled = true
            resetView.confirmBtn.backgroundColor = .pink
            resetView.confirmBtn.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 1, shadowRaduis: 4)
        }
    }
    func togglePassword(_ sender: UIButton) {
        if toggled {
            resetView.eyeBtn.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
            resetView.textField.isSecureTextEntry = false
        }else{
            resetView.eyeBtn.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
            resetView.textField.isSecureTextEntry = true
        }
        toggled = !toggled
    }
}
