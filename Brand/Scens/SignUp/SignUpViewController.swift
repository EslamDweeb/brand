//
//  SignUpViewController.swift
//  Brands
//
//  Created by Marwa Gamal on 1/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , ButtonActionDelegate{
    //MARK:- Variables&Constant
    var Show = true
    var signupView = SignUpView()
    let reachability =  Reachability()
     let indetifier = "mainTabVC"
    //MARK:- View life Cycle
    override func loadView() {
        super.loadView()
        view = signupView
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        signupView.ActionDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    //MARK:- Buttons Actions
    func togglePassword(_ sender: UIButton) {
        if Show {
            signupView.eyeBtn.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
            signupView.PasswordTextFeild.isSecureTextEntry = false
        }else{
            signupView.eyeBtn.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
            signupView.PasswordTextFeild.isSecureTextEntry = true
        }
        Show = !Show
    }
    func loginBtnTapped() {
        dismissPressentededControllers()
        self.presentViewController(controller: LoginViewController(), transitionModal: nil, presentationStyle: nil)
    }
    func signup() {
        signupView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        
        if signupView.FirstTextFeild.text != "" || signupView.EmailTextFeild.text != "" || signupView.phoneTextFeild.text != "" || signupView.PasswordTextFeild.text != "" {
            if signupView.FirstTextFeild.text != "" && signupView.FirstTextFeild.isValidLastName(signupView.FirstTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "firstName_Validation", comment: ""))
            }else if  signupView.LastTextFeild.text != "" && signupView.LastTextFeild.isValidLastName(signupView.FirstTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "lastName_Validation", comment: ""))
            }else if  signupView.EmailTextFeild.text != "" && signupView.EmailTextFeild.isValidEmail(signupView.EmailTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "email_validation", comment: ""))
            }else if  signupView.phoneTextFeild.text != "" && signupView.phoneTextFeild.isValidPhone(signupView.phoneTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "Invalid Phone", comment: ""))
            }else if  signupView.PasswordTextFeild.text != "" && signupView.PasswordTextFeild.isValidPassword(signupView.PasswordTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "password_validation", comment: ""))
            }else{
                APIClient.SignUp(firstName: signupView.FirstTextFeild.text ?? "", lastName: signupView.LastTextFeild.text ?? "", email: signupView.EmailTextFeild.text ?? "", phone: signupView.phoneTextFeild.text ?? "", password: signupView.PasswordTextFeild.text ?? "") { ( result) in
                    switch result {
                    case .success(let user) :
                        self.signupView.activityStopAnimating()
                        UserDefaults.standard.set(user.accessToken, forKey: Constants.Defaults.authToken)
                        UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                        self.presentViewControllerFromStoryBoard(identifier: self.indetifier)
                    case .failure(let error) :
                        self.signupView.activityStopAnimating()
                        self.createAlert(title: nil, erroMessage: NSLocalizedString("server_error", comment: ""))
                        print(error)
                    }
                }
            }
        }else{
            if signupView.EmailTextFeild.text == "" {
                self.signupView.activityStopAnimating()
                self.createAlert(title: nil, erroMessage: NSLocalizedString("server_error", comment: ""))
            }else if signupView.PasswordTextFeild.text == ""{
                self.signupView.activityStopAnimating()
                self.createAlert(title: nil, erroMessage: NSLocalizedString("server_error", comment: ""))
            }else{
                
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "allFieldsreq", comment: ""))
            }
        }
    }
}