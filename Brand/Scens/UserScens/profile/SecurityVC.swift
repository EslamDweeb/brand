//
//  SecurityVC.swift
//  Al_Ula
//
//  Created by nada dyaa on 4/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
class SecurityinfoController :UIViewController ,ButtonActionDelegate{
    
    lazy var securityinfo: securityinfoView = {
        let view = securityinfoView(delegate: self)
        return view
    }()
    var ShowCurrent = true
    var ShowNew = true
    override func loadView() {
        super.loadView()
        view = securityinfo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        securityinfo.actionDelegate = self
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func togglePassword(_ sender : UIButton) {
        if sender == securityinfo.eyeBtnCurrent {
            if ShowCurrent {
                securityinfo.eyeBtnCurrent.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
                securityinfo.CurrentPassTextFeild.isSecureTextEntry = false
            }else{
                securityinfo.eyeBtnCurrent.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
                securityinfo.CurrentPassTextFeild.isSecureTextEntry = true
            }
            ShowCurrent = !ShowCurrent
        }else{
            if ShowNew {
                securityinfo.eyeBtnNew.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
                securityinfo.NewPassTextFeild.isSecureTextEntry = false
            }else{
                securityinfo.eyeBtnNew.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
                securityinfo.NewPassTextFeild.isSecureTextEntry = true
            }
            ShowNew = !ShowNew
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func saveButtonTapped() {
        if(securityinfo.NewPassTextFeild.text == "")
        {
             self.createAlert(erroMessage: NSLocalizedString( "newPasswordReq", comment: ""))
        }
        else if securityinfo.NewPassTextFeild.isValidPassword(securityinfo.NewPassTextFeild.text)
        {
        APIClient.ChangePassword(oldPassword: securityinfo.CurrentPassTextFeild.text ?? "", newPassword: securityinfo.NewPassTextFeild.text ?? "") { (result) in
            switch result {
            case .success(let data):
                if(data.message! == "Your password updated successfully")
                {
                self.createAlert(title:NSLocalizedString("Success", comment: ""), erroMessage: "\(data.message ?? "")")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)){
                    self.dismissPressentededControllers()
                    self.dismiss(animated: true, completion: nil)
                  }
                }
                else{
                    self.createAlert(title:NSLocalizedString("error", comment: ""), erroMessage: "\(data.message ?? "")")
                }

            case .failure(let error):
                print(error)
            }
        }
        }else{
            self.createAlert(title:NSLocalizedString("error", comment: ""), erroMessage: NSLocalizedString("password_validation", comment: ""))
        }
    }
}
