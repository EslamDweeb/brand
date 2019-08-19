//
//  SocialSignUpVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SocialSignUPVC: UIViewController , ButtonActionDelegate {
    
    var firstname : String!
    var lastname : String!
    var email : String!
    var userid : String!
    var provid : Int!
    lazy var mainView:SocialSignUPView = {
        let v = SocialSignUPView(buttonAction: self)
        return v
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
        view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if(firstname != nil)
        {
            mainView.FirstTextFeild.text = firstname!
        }
        else
        {
            mainView.FirstTextFeild.text = ""
        }
        if( email != nil )
        {
            mainView.EmailTextFeild.text = email!
        }
        else
        {
            mainView.EmailTextFeild.text = ""
        }
        if(lastname !=  nil )
        {
            mainView.LastTextFeild.text = lastname!
        }
        else
        {
            mainView.LastTextFeild.text = ""
        }
    }
    
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    var value : String!
    func signupBtnTapped() {
        let response = Validation.shared.validate(values: (ValidationType.PersonName ,self.mainView.FirstTextFeild.text!),(ValidationType.phone ,self.mainView.phoneTextFeild.text!))
        switch response {
        case .success:
            
            if !self.mainView.EmailTextFeild.isValidEmail(self.mainView.EmailTextFeild.text) {
                self.createAlert(erroMessage: YString.pleaseEnterValidEmail )
                return
            }
            
            if !self.mainView.PassworfTextFeild.isValidPassword(self.mainView.PassworfTextFeild.text) {
                self.createAlert(erroMessage: YString.passwordMustBeGreaterThan5Char )
                return
            }
            
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
            APIClient.SocialSignUp(usersocialid: self.userid, socialproviderid: self.provid, firstName: self.mainView.FirstTextFeild.text ?? "", lastName: self.mainView.LastTextFeild.text ?? "", email: self.mainView.EmailTextFeild.text ?? "", phone: self.mainView.phoneTextFeild.text ?? "",password: self.mainView.PassworfTextFeild.text ?? "" , FCMToken : FCMToken ) { ( result) in
                self.mainView.activityStopAnimating()
                switch result {
                case .success(let user) :
                    print(user)
                    if(user.accessToken == nil )
                    {
                        if let phone = user.errors?["phone"] , phone.count > 0
                        {
                            self.createAlert(title: nil, erroMessage: "\(phone[0])")
                        }
                        else if let email = user.errors?["email"] , email.count > 0
                        {
                            self.createAlert(title: nil, erroMessage: "\(email[0])")
                        }
                        else if let firstname = user.errors?["firstname"] , firstname.count > 0
                        {
                            self.createAlert(title: nil, erroMessage: "\(firstname[0])")
                        }
                        else if let lastname = user.errors?["lastname"] , lastname.count > 0
                        {
                            self.createAlert(title: nil, erroMessage: "\(lastname[0])")
                        }
                        else if let password = user.errors?["password"] , password.count > 0
                        {
                            self.createAlert(title: nil, erroMessage: "\(password[0])")
                        }
                    }
                    else
                    {
                        UserDefaults.standard.set(user.accessToken, forKey: Constants.Defaults.authToken)
                        UserDefaults.standard.set(true, forKey: Constants.Defaults.isLogin)
                        let dest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabVC")
                        self.present(dest, animated: true, completion: nil)
                    }
                    
                case .failure(let error) :
                    self.createAlert(erroMessage: "Server Not Respond")
                    print(error)
                }
            }
            
        case .failure(_, let message):
            self.createAlert(title: nil, erroMessage: message.localized())
        }
    }
    
}
