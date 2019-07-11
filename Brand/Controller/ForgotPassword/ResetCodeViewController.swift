//
//  ResetCodeViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ResetCodeViewController: UIViewController,ButtonActionDelegate {
    var resetView = ResetCodeView()
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
       setupDelegate()
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
    //confirmBtnAction
    func continuePressed() {
        self.presentViewController(controller: SuccessPopupViewController(), transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    func setupDelegate(){
        resetView.textField1.becomeFirstResponder()
        resetView.actionDelegate = self
        resetView.textField1.delegate = self
        resetView.textField2.delegate = self
        resetView.textField3.delegate = self
        resetView.textField4.delegate = self
        resetView.textField5.delegate = self
        resetView.textField6.delegate = self
    }

}

