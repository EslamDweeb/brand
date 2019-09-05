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
    var loginDismiss:Bool?
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
    func checkNormalLoginFields()->Bool{
        
        if loginView.email.text != "" && loginView.password.text != ""{
            if self.loginView.email.isValidEmail(self.loginView.email.text) != true &&  self.loginView.email.isValidPhone(self.loginView.email.text) != true{
                createAlert(erroMessage: YString.validEmailOrPassword)
                self.loginView.activityStopAnimating()
            }else if self.loginView.password.isValidPassword(self.loginView.password.text) != true {
                createAlert(erroMessage: YString.passwordMustBeGreaterThan5Char)
                self.loginView.activityStopAnimating()
            }else{
                return true
            }
        }else{
            self.loginView.activityStopAnimating()
            createAlert(erroMessage: YString.allFieldsReq)
        }
        return false
    }
    func normalLoginRequset(){
        APIClient.Login(userName: loginView.email.text ?? "", password: loginView.password.text ?? "", FCMToken: FCMToken ) { (result) in
            switch result {
            case .success(let data) :
                if data.errors == nil {
                    self.loginView.activityStopAnimating()
                    UserDefaults.standard.set(data.accessToken, forKey: Constants.Defaults.authToken)
                    UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                    if self.loginDismiss !=  true{
                        self.presentViewControllerFromStoryBoard(identifier: self.indetifier)
                    }else{
                        self.dismiss(animated: true, completion: nil)
                    }
                }else{
                    self.loginView.activityStopAnimating()
                    for (_,val) in data.errors! {
                        self.createAlert(erroMessage: val[0])
                    }
                }
            case .failure(let error) :
                print(error)
                self.loginView.activityStopAnimating()
                //self.createAlert(erroMessage: "Please enter valid mail or password")
            }
        }
    }
    func normalLogin() {
        handelReachability(reachability: reachability)
        loginView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        if checkNormalLoginFields() {
            normalLoginRequset()
        }else{
            return
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
                    if let user = user {
                        self.requestEmail(user: user )
                    }
                    
                    
                })
            }else{
                print("error")
            }
        }
    }
    
    
    private func requestEmail (user : TWTRUser) {
        
        let client = TWTRAPIClient.withCurrentUser()
        print("ID \(String(describing: client.userID))")
        client.requestEmail { email, error in
            if (email != nil) {
                print("signed in as email :  \(String(describing: email))");
                
                let arr = user.name.split() {$0 == " "}
                var fName = ""
                var lName = ""
                if arr.count > 1 {
                    fName = String(arr[0])
                    lName = String(arr[1])
                }else if arr.count > 0 {
                    fName = String(arr[0])
                }
                
                self.loginSocial(socailID: user.userID , email: email ?? ""  , firstName: fName , lastName: lName , provider: Constants.providerTwitter )
                
                //    self.loginSocial(socailID: "6764835234" , email: "yusefTWT1@email.com"  , firstName: "yusef" , lastName: "naser" , provider: Constants.providerTwitter )
                
            } else {
                print("error request email : \(String(describing: error?.localizedDescription))");
            }
        }
    }
    
    func faceBookLogin() {
        
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
                    
                    //  modalController.userid = String(describing: result?.token?.userID)
                    let req2 = GraphRequest(graphPath: "me", parameters: ["fields":"email,first_name,last_name"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))
                    
                    req2.start(completionHandler: { (connection, result, error : Error!) -> Void in
                        if(error == nil) {
                            print("result \(String(describing: result))")
                            guard let Info = result as? [String: Any] else { return }
                            //  let Info : [String : Any] = ["first_name" : "yusef" , "last_name" : "naser" ,
                            // "email" : "yusef2@email.com" , "id" : "264578276565" ]
                            //                                modalController.firstname = Info["first_name"] as? String
                            //                                modalController.lastname = Info["last_name"] as? String
                            //                                modalController.email = Info["email"] as? String
                            
                            print(self.userid!)
                            self.loginSocial(socailID: Info["id"] as? String ?? "" , email: Info["email"] as? String ?? "" , firstName: Info["first_name"] as? String ?? "" , lastName: Info["last_name"] as? String ?? "" , provider: Constants.providerFacebook )
                        } else {
                            print("error \(String(describing: error))")
                        }
                    })
                }else{
                    self.createAlert(erroMessage: "error")
                }
            }
        }
    }
    
    private func loginSocial (socailID : String , email : String , firstName : String , lastName : String , provider : Int  ) {
        APIClient.SocialLogin(usersocialid: socailID, FCMToken: FCMToken  , complition: { (result) in
            switch result {
            case .success(let user) :
                print("Logged in BEFORE ")
                print(user)
                UserDefaults.standard.set(user.accessToken, forKey: Constants.Defaults.authToken)
                UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                let dest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabVC")
                if self.loginDismiss != true{
                    self.present(dest, animated: true, completion: nil)
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
                
                
            case .failure(let error) :
                print(error)
                let modalController = SocialSignUPVC()
                modalController.provid = provider
                modalController.userid = socailID
                modalController.email = email
                modalController.firstname = firstName
                modalController.lastname = lastName
                //print("dhfvwdhjbfhdjsbfhjdsbfjhdhbfjkd")
                self.present(modalController, animated: true, completion: nil)
            }
        })
    }
    
}

