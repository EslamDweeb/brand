//
//  LoginViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import TwitterKit
import FBSDKLoginKit

class LoginViewController: UIViewController,ButtonActionDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    var userid : String!
    var loginView = LoginView()
    var toggled = true
    let reachability =  Reachability()
    let indetifier = "mainTabVC"
    //MARK:- View Life Cycle
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.actionDelegate = self
        let rightswipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(sender:)))
        rightswipe.direction = .right
        view.addGestureRecognizer(rightswipe)
        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(sender:)))
        leftswipe.direction = .left
        view.addGestureRecognizer(leftswipe)
        
        //           TWTRTwitter.sharedInstance().start(withConsumerKey: "KUkghIKbyb7SsRULpDfjCmK30", consumerSecret: "mgpVgM29xQLZhg37Z7cKkhQ6FLaYhWOdJdp5MKVQEtfUpN9HgK")
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
              self.dismissPressentededControllers()
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    //MARK:- Button Action
    func normalLogin() {
        handelReachability(reachability: reachability)
        loginView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        if loginView.email.text != "" && loginView.password.text != ""{
            if self.loginView.email.isValidEmail(self.loginView.email.text) != true{
                self.loginView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "email_validation", comment: ""))
            } else if self.loginView.password.isValidPassword(self.loginView.password.text) != true {
                self.loginView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "password_validation", comment: ""))
            }else{
                APIClient.Login(userName: loginView.email.text ?? "", password: loginView.password.text ?? "", FCMToken: FCMToken ) { (result) in
                    switch result {
                    case .success(let data) :
                        self.loginView.activityStopAnimating()
                        UserDefaults.standard.set(data.accessToken, forKey: Constants.Defaults.authToken)
                        UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                        self.presentViewControllerFromStoryBoard(identifier: self.indetifier)
                       // self.present(ConnectPageConntroler(), animated: true, completion: nil)
                    case .failure(let error) :
                        print(error)
                        self.loginView.activityStopAnimating()
                        self.createAlert(erroMessage: "Please enter valid mail or password")
                    }
                }
              }
            }else{
                self.loginView.activityStopAnimating()
                createAlert(title: nil, erroMessage: NSLocalizedString( "allFieldsreq", comment: ""))
            }
    }
    func togglePassword(_ sender: UIButton) {
        if toggled {
            loginView.eyeBtn.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
            loginView.password.isSecureTextEntry = false
        }else{
            loginView.eyeBtn.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
            loginView.password.isSecureTextEntry = true
        }
        toggled = !toggled
    }
    func forgotPassword() {
     
        self.presentViewController(controller: PopUpResetPassowrdViewController(), transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    func signupBtnTapped() {
        dismissPressentededControllers()
        
        presentViewController(controller: SignUpViewController(), transitionModal: .crossDissolve, presentationStyle: nil)
    }
    func twitterLogin() {
        TWTRTwitter.sharedInstance().logIn{(session, error) in
            if let UnSession = session{
                let client = TWTRAPIClient()
                client.loadUser(withID: (UnSession.userID), completion: { (user, error) in
                    print("signed in as \(String(describing: user?.name))");
                    print("signed in as \(String(describing: user?.userID))");
                    print("signed in as \(String(describing: session?.authToken))");
                    
                    
                })
            }else{
                print("error")
            }
        }
    }
    func faceBookLogin() {
            let modalController = SocialSignUPVC()
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) -> Void in
                if (error == nil){
                    let fbloginresult : LoginManagerLoginResult = result!
                    // if user cancel the login
                    if (result?.isCancelled)!{
                        return
                    }
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        print("permissions: \(String(describing: result?.grantedPermissions))")
                        print("token: \(String(describing: result?.token?.tokenString))")
                        self.userid = String(describing: result?.token?.userID)
                        print("user_id: \(self.userid!)")
                        
                        modalController.userid = String(describing: result?.token?.userID)
                        let req2 = GraphRequest(graphPath: "me", parameters: ["fields":"email,first_name,last_name"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))
                        
                        req2.start(completionHandler: { (connection, result, error : Error!) -> Void in
                            if(error == nil) {
                                print("result \(String(describing: result))")
                                guard let Info = result as? [String: Any] else { return }
                                modalController.firstname = Info["first_name"] as? String
                                modalController.lastname = Info["last_name"] as? String
                                modalController.email = Info["email"] as? String
                                print(self.userid!)
                                APIClient.SocialLogin(usersocialid: Info["id"] as? String ?? "" , complition: { (result) in
                                    switch result {
                                    case .success(let user) :
                                        print("Logged in BEFORE ")
                                        print(user)
                                        UserDefaults.standard.set(user.accessToken, forKey: Constants.Defaults.authToken)
                                        UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                                        let dest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabVC")
                                        self.present(dest, animated: true, completion: nil)
                                        
                                    case .failure(let error) :
                                        print(error)
                                        modalController.provid = 1
                                        modalController.userid = Info["id"] as? String
                                        modalController.email = Info["email"] as? String
                                        modalController.firstname = Info["first_name"] as? String
                                        modalController.lastname = Info["last_name"] as? String
                                        print("dhfvwdhjbfhdjsbfhjdsbfjhdhbfjkd")
                                        self.present(modalController, animated: true, completion: nil)
                                    }
                                })
                            } else {
                                print("error \(String(describing: error))")
                            }
                        })
                    }else{
                    self.createAlert(erroMessage: "gjhvgjv")
                }
            }
        }
    }
}

