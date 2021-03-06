//
//  MyprofileController.swift
//  Brands
//
//  Created by nada dyaa on 1/30/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Photos
class ProfileVC :UIViewController,ButtonActionDelegate {
    var toggle = true
    var user : User?
    var photoId:Int?
    let reachability =  Reachability()
    var imagepicker: customImagePicker?
    lazy var profileView: ProfileView = {
        let view = ProfileView(delegate: self)
        return view
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    let  imagePickerViewController = UIImagePickerController()
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        handelReachability(reachability: reachability)
        
        imagepicker =  customImagePicker(deleget: self, imagePicker: imagePickerViewController, viewController: self)
        imagePickerViewController.delegate = self
        print(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")
        if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != ""{
            self.getUserInfo()
        }else{
            self.present(LoginViewController(), animated: true, completion: nil)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        @unknown default:
            break
        }
    }
    func editeButtonTapped(_ sender: UIButton) {
        if sender == profileView.EditBtn {
            accessUserInfoFields()
        }else {
            self.presentViewController(controller: SecurityinfoController(), transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func accessUserInfoFields(){
        if toggle{
            self.change()
        }else{
            self.profileView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
            if self.profileView.EmailTextFeild.isValidEmail(self.profileView.EmailTextFeild.text){
                if (profileView.LastTextFeild.text == "" || profileView.LastTextFeild.text == nil ){
                    let response = Validation.shared.validate(values:
                                                              (ValidationType.Email ,profileView.EmailTextFeild.text!),(ValidationType.phone ,profileView.phoneTextFeild.text!) )
                    switch response {
                    case .success:

                        let date: [String] = user?.birthdate?.date.components(separatedBy: " ") ?? [""]
                        if self.user?.firstname == profileView.FirstTextFeild.text &&
                            self.user?.lastname == profileView.LastTextFeild.text &&
                            self.user?.email == profileView.EmailTextFeild.text &&
                            self.user?.phone == profileView.phoneTextFeild.text &&
                            date[0] == profileView.dateTextFeild.text &&
                            (self.user?.gender == 1 && profileView.Genderview.titleLabel?.text == YString.male) || (self.user?.gender == 0 && profileView.Genderview.titleLabel?.text == "" ) ||
                            ( self.user?.gender == 2 && profileView.Genderview.titleLabel?.text == YString.female){
                            self.profileView.activityStopAnimating()
                            self.change()
                   
                        }else {
                            editeInfoRequest()
                        }
                    case .failure(_, let message):
                        let alert = UIAlertController(title: "Validation Message".localized, message: message.localized(), preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "ok".localized, style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        self.profileView.activityStopAnimating()
                        print(message.localized())
                    }
                    
                }
                else if (profileView.LastTextFeild.text != "" || profileView.LastTextFeild.text != nil)
                {

                    if profileView.FirstTextFeild.text?.count ?? 0 < 3 {
                        createAlert(erroMessage: YString.firstNameMustBeGreaterThan3Char )
                        self.profileView.activityStopAnimating()
                        return
                    }else if profileView.LastTextFeild.text?.count ?? 0  < 3 {
                        createAlert(erroMessage: YString.lastNameMustBeGreaterThan3Char )
                        self.profileView.activityStopAnimating()
                        return
                    }
                    
                    
                    
                    let response = Validation.shared.validate(values: (ValidationType.Email ,profileView.EmailTextFeild.text!),
                                                              (ValidationType.phone ,profileView.phoneTextFeild.text!) )
                    switch response {
                    case .success:
                        let date: [String] = user?.birthdate?.date.components(separatedBy: " ") ?? [""]
                        if self.user?.firstname == profileView.FirstTextFeild.text &&
                            self.user?.lastname == profileView.LastTextFeild.text &&
                            self.user?.email == profileView.EmailTextFeild.text &&
                            self.user?.phone == profileView.phoneTextFeild.text &&
                            date[0] == profileView.dateTextFeild.text &&
                           ((self.user?.gender == 1 && profileView.Genderview.titleLabel?.text == YString.male) || (self.user?.gender == 0 && profileView.Genderview.titleLabel?.text == "select_gender".localized ) ||
                            ( self.user?.gender == 2 && profileView.Genderview.titleLabel?.text == YString.female )){
                            self.profileView.activityStopAnimating()
                            self.change()
                        }else {
                            editeInfoRequest()
                        }
                    case .failure(_, let message):
                        
                        let alert = UIAlertController(title: "Validation Message".localized, message: message.rawValue.localized, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "ok".localized, style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        self.profileView.activityStopAnimating()
                        print(message.localized())
                    }
                }
                
                
            }else{
                self.profileView.activityStopAnimating()
                self.createAlert(erroMessage: "enter_valid_email".localized)
            }
        }
    }
    var gen = -1
    fileprivate func editeInfoRequest() {
        if self.profileView.Genderview.dropView.indexPath?.row != nil
        {
            gen = (self.profileView.Genderview.dropView.indexPath?.row ?? -1 ) + 1
        }
        
        APIClient.editeUserInfo(firstName: profileView.FirstTextFeild.text ?? "", lastName:  profileView.LastTextFeild.text ?? "", email:  profileView.EmailTextFeild.text ?? "", phone:  profileView.phoneTextFeild.text ?? "", birthDate:  profileView.dateTextFeild.text ?? "", gender:  gen) { (result) in
            switch result {
            case.success( let data):
                self.user = data.user
                self.profileView.activityStopAnimating()
                self.profileView.Namelabel.text =  "\(self.profileView.FirstTextFeild.text ?? "") \(self.profileView.LastTextFeild.text ?? "")"
                if data.errors == nil {
                    self.change()
                    self.createAlert(title: nil, erroMessage: data.message ?? "")
                }else  {
                    self.createAlert(title: nil, erroMessage: getError(error: data.errors!) )
                }
            case .failure(let error):
                self.profileView.activityStopAnimating()
                print(error)
            }
        }
    }
    func getUserInfo() {
        self.profileView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        APIClient.UserInfo(complition: { (result) in
            switch result {
            case .success(let data):
                if data.message != "" && data.message != nil {
                    let dest = LoginViewController()
                    self.present(dest, animated: true, completion: nil)
                }else{
                    DispatchQueue.main.async {
                        if  UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != ""{
                            self.user = data.user
                            self.profileView.FirstTextFeild.text = data.user!.firstname
                            self.profileView.LastTextFeild.text = data.user!.lastname
                            self.profileView.Namelabel.text =  "\(self.profileView.FirstTextFeild.text ?? "") \(self.profileView.LastTextFeild.text ?? "")"
                            self.profileView.EmailTextFeild.text = data.user!.email
                            self.profileView.phoneTextFeild.text = data.user!.phone
                            if(data.user?.photo?.path == nil)
                            {
                                self.profileView.activityStopAnimating()
                                self.profileView.myprofileImage.image = #imageLiteral(resourceName: "defaultImage")
                                self.profileView.myprofileImage.isHidden = false
                                self.profileView.Namelabel.isHidden = false
                                self.profileView.lineView1.isHidden = false
                                self.profileView.accountView.isHidden = false
                                self.profileView.securityView.isHidden = false
                            }
                            else
                            {
                                self.profileView.activityStopAnimating()
                                let url = URL(string: (data.user?.photo?.path)!)
                                self.profileView.myprofileImage.kf.setImage(with: url)
                                self.profileView.myprofileImage.isHidden = false
                                self.profileView.Namelabel.isHidden = false
                                self.profileView.lineView1.isHidden = false
                                self.profileView.accountView.isHidden = false
                                self.profileView.securityView.isHidden = false
                                self.photoId = data.user?.photo?.id
                            }
                            let date: [String] = data.user?.birthdate?.date.components(separatedBy: " ") ?? [""]
                            self.profileView.dateTextFeild.text = date[0]
                            if data.user!.gender == 2 {
                                self.profileView.Genderview.setTitle(YString.female, for: .normal)
                                self.gen = 2
                            }else if data.user!.gender == 1  {
                                self.profileView.Genderview.setTitle(YString.male, for: .normal)
                                self.gen = 1
                            }
                        }else{
                            self.present(LoginViewController(), animated: true, completion: nil)
                        }
                    }
                }
            case .failure(let error):
                self.profileView.activityStopAnimating()
                print(error)
            }
        })
    }
    func change(){
        if self.toggle == false {
            self.profileView.FirstTextFeild.isUserInteractionEnabled = false
            self.profileView.LastTextFeild.isUserInteractionEnabled = false
            self.profileView.EmailTextFeild.isUserInteractionEnabled = false
            self.profileView.phoneTextFeild.isUserInteractionEnabled = false
            self.profileView.dateTextFeild.isUserInteractionEnabled = false
            self.profileView.Genderview.setTitleColor(.lightgray3, for: .normal)
            self.profileView.Genderview.isEnabled = false
            
            self.profileView.FirstTextFeild.textColor = .lightgray3
            self.profileView.LastTextFeild.textColor = .lightgray3
            self.profileView.EmailTextFeild.textColor = .lightgray3
            self.profileView.phoneTextFeild.textColor = .lightgray3
            self.profileView.dateTextFeild.textColor = .lightgray3
            self.toggle = !self.toggle
            self.profileView.EditBtn.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        }else{
            self.profileView.FirstTextFeild.isUserInteractionEnabled = true
            self.profileView.FirstTextFeild.becomeFirstResponder()
            self.profileView.LastTextFeild.isUserInteractionEnabled = true
            self.profileView.EmailTextFeild.isUserInteractionEnabled = true
            self.profileView.phoneTextFeild.isUserInteractionEnabled = true
            self.profileView.dateTextFeild.isUserInteractionEnabled = true
            
            self.profileView.FirstTextFeild.textColor = .black
            self.profileView.LastTextFeild.textColor = .black
            self.profileView.EmailTextFeild.textColor = .black
            self.profileView.phoneTextFeild.textColor = .black
            self.profileView.dateTextFeild.textColor = .black
            
            self.profileView.Genderview.isEnabled = true
            self.profileView.Genderview.setTitleColor(.black, for: .normal)
            self.profileView.EditBtn.setImage(#imageLiteral(resourceName: "save - material"), for: .normal)
            self.toggle = !self.toggle
        }
        
    }
//    func getError (error : [String : [String]]) -> String {
//        var   text = ""
//        for (_,v) in error {
//            for i in v {
//                text += " \(i) "
//            }
//        }
//        return text
//    }
}


