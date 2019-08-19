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
        let rightswipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(sender:)))
        rightswipe.direction = .right
        view.addGestureRecognizer(rightswipe)
        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(sender:)))
        leftswipe.direction = .left
        view.addGestureRecognizer(leftswipe)
     
        signupView.ActionDelegate = self
    }
    @objc func handleswipe(sender : UISwipeGestureRecognizer){
        if sender.state == .ended {
            switch sender.direction {
            case .right :
                
                let transition: CATransition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.reveal
                transition.subtype = CATransitionSubtype.fromLeft
                self.view.window!.layer.add(transition, forKey: nil)
                self.dismiss(animated: false, completion: nil)
            case .left :
                let transition: CATransition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.reveal
                transition.subtype = CATransitionSubtype.fromRight
                self.view.window!.layer.add(transition, forKey: nil)
                self.dismiss(animated: false, completion: nil)
            default : break
            }
        }
    }
    func dissmisController() {
         self.dismiss(animated: false, completion: nil)
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
                createAlert(title: nil, erroMessage: "firstName_Validation".localized)
            }else if  signupView.LastTextFeild.text != "" && signupView.LastTextFeild.isValidLastName(signupView.FirstTextFeild.text) == false {
                self.signupView.activityStopAnimating()
                createAlert(title: nil, erroMessage:  "lastName_Validation".localized)
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
                APIClient.SignUp(firstName: signupView.FirstTextFeild.text ?? "", lastName: signupView.LastTextFeild.text ?? "", email: signupView.EmailTextFeild.text ?? "", phone: signupView.phoneTextFeild.text ?? "", password: signupView.PasswordTextFeild.text ?? "", FCMToken: FCMToken ) { ( result) in
                    switch result {
                    case .success(let user) :
                        self.signupView.activityStopAnimating()
                        UserDefaults.standard.set(user.accessToken, forKey: Constants.Defaults.authToken)
                        print(UserDefaults.standard.string(forKey: Constants.Defaults.authToken))
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
