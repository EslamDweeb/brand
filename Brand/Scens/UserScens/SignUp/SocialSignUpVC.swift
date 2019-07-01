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
            
            if self.mainView.EmailTextFeild.isValidEmail(self.mainView.EmailTextFeild.text) && self.mainView.PassworfTextFeild.isValidPassword(self.mainView.PassworfTextFeild.text) {
                APIClient.SocialSignUp(usersocialid: self.userid, socialproviderid: self.provid, firstName: self.mainView.FirstTextFeild.text ?? "", lastName: self.mainView.LastTextFeild.text ?? "", email: self.mainView.EmailTextFeild.text ?? "", phone: self.mainView.phoneTextFeild.text ?? "",password: self.mainView.PassworfTextFeild.text ?? "") { ( result) in
                    switch result {
                    case .success(let user) :
                        print(user)
                        if(user.user == nil )
                        {
                            if(user.errors?["phone"]! != nil)
                            {
                                self.createAlert(title: nil, erroMessage: "\(user.errors!["phone"]!)")
                            }
                            else if (user.errors?["email"]! != nil)
                            {
                                self.createAlert(title: nil, erroMessage: "\(user.errors!["email"]!)")
                            }
                            else if (user.errors?["firstname"]! != nil)
                            {
                                self.createAlert(title: nil, erroMessage: "\(user.errors!["firstname"]!)")
                            }
                            else if (user.errors?["lastname"]! != nil)
                            {
                                self.createAlert(title: nil, erroMessage: "\(user.errors!["lastname"]!)")
                            }
                            else if (user.errors?["password"]! != nil)
                            {
                                self.createAlert(title: nil, erroMessage: "\(user.errors!["password"]!)")
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
            }else{
                self.createAlert(erroMessage: "Please enter valid mail or password")
            }
            
        case .failure(_, let message):
            self.createAlert(title: nil, erroMessage: message.localized())
        }
    }
    
}
