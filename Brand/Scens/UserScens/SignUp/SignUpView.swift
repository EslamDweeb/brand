//
//  SignUpView.swift
//  Brands
//
//  Created by nada dyaa on 1/30/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class SignUpView : UIView , UITextFieldDelegate {
    var logotopConstrain : NSLayoutConstraint?
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var closeImg : BtnImage = {
        let btn  = BtnImage()
        btn.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal)
        return btn
    }()
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoName")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var createlabel :HeaderLabel = {
        let createaccount = HeaderLabel()
        let title = "createAccount".localized
        createaccount.font = setFont(name: .fontH, size: 20)
        createaccount.text = title
        return createaccount
    }()
    
    lazy var  FirstTextFeild : DefaultTextField = {
        let first = DefaultTextField()
        let title = "firstName".localized
        first.SetAttributePlaceHeader(Title: title)
        return first
    }()
    
    lazy var  LastTextFeild : DefaultTextField = {
        let last = DefaultTextField()
        let title = "lastName".localized
        last.SetAttributePlaceHeader(Title: title)
        return last
    }()
    
    lazy var  phoneTextFeild : DefaultTextField = {
        let phone = DefaultTextField()
        let title = "phone".localized
        phone.SetAttributePlaceHeader(Title: title)
         phone.keyboardType = .numberPad
        return phone
    }()
    
    lazy var  EmailTextFeild : DefaultTextField = {
        let email = DefaultTextField()
           let title = "email".localized
        email.SetAttributePlaceHeader(Title: title)
        return email
    }()
    
    lazy var  PasswordTextFeild : DefaultTextField = {
        let password = DefaultTextField()
        let title = "password".localized
        password.SetAttributePlaceHeader(Title: title)
        password.isSecureTextEntry = true
        return password
    }()
    lazy var eyeBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        return button
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    lazy var Memberlabel :DefaultLabel = {
        let memberlabel = DefaultLabel()
        let title = "already_a_member_login".localized
        memberlabel.text = title
        memberlabel.textColor = .grayColor
        return memberlabel
    }()
    lazy var CreateButton: GradBtn = {
        let button = GradBtn()
        let title = "signup".localized
        button.setTitle(title, for: .normal)
        return button
    }()
    lazy var LoginButton: UIButton = {
        let button = UIButton()
        let title = "login".localized
        button.setTitle(title, for: .normal)
        button.setTitleColor( .pink, for: .normal)
        button.titleLabel?.font = setFont(name: .fontH, size: 16)
        return button
    }()
    lazy var Descriptionlabel :DefaultLabel = {
        let descriptionlabel = DefaultLabel()
        let title = "by_signing_up_you_accept_terms_and_privacy_policy".localized
        descriptionlabel.text = title
        descriptionlabel.textColor = UIColor.lightgray3
        descriptionlabel.numberOfLines = 0
        return descriptionlabel
    }()
    public weak var ActionDelegate:ButtonActionDelegate?

    func setup(){
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(logoImage)
        self.addSubview(closeImg)
        scrollView.addSubview(createlabel)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(FirstTextFeild)
        stackView.addArrangedSubview(LastTextFeild)
        scrollView.addSubview(phoneTextFeild)
        scrollView.addSubview(PasswordTextFeild)
        scrollView.addSubview(EmailTextFeild)
        scrollView.addSubview(CreateButton)
        scrollView.addSubview(stackView2)
        stackView2.addArrangedSubview(Memberlabel)
        stackView2.addArrangedSubview(LoginButton)
        scrollView.addSubview(Descriptionlabel)

        
        PasswordTextFeild.rightView = eyeBtn
        PasswordTextFeild.rightViewMode = .always
        
        
        FirstTextFeild.delegate =  self
        LastTextFeild.delegate = self
        PasswordTextFeild.delegate = self
        phoneTextFeild.delegate = self
        EmailTextFeild.delegate = self
        
      scrollView.anchor(top: topAnchor, left: leftAnchor , bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        logoImage.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 40, paddingCenterX: 0, paddingCenterY: 0)
                logotopConstrain = logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0)
                logotopConstrain?.isActive = true
        if MOLHLanguage.currentAppleLanguage() == "en"{
            closeImg.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            closeImg.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        }
       
        createlabel.anchor(top: logoImage.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 40, paddingCenterX: 0, paddingCenterY: 0)
            FirstTextFeild.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
          LastTextFeild.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        stackView.anchor(top: createlabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        phoneTextFeild.anchor(top: stackView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
          EmailTextFeild.anchor(top: phoneTextFeild.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
          PasswordTextFeild.anchor(top: EmailTextFeild.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        CreateButton.anchor(top: PasswordTextFeild.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
                stackView2.anchor(top: CreateButton.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
                Descriptionlabel.anchor(top: stackView2.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 10, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)

        LoginButton.addTarget(self.ActionDelegate, action:  #selector(ButtonActionDelegate.loginBtnTapped), for: .touchUpInside)
        CreateButton.addTarget(self.ActionDelegate, action: #selector(ButtonActionDelegate.signup), for: .touchUpInside)
          eyeBtn.addTarget(self.ActionDelegate, action: #selector(ButtonActionDelegate.togglePassword(_:)), for: .touchUpInside)
        closeImg.addTarget(self.ActionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
         setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()

         logotopConstrain?.constant =  self.frame.size.height * 0.12
       // logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: self.frame.size.height * 0.12)
        if MOLHLanguage.currentAppleLanguage() == "en" {
            
            FirstTextFeild.textAlignment = .left
            LastTextFeild.textAlignment = .left
            EmailTextFeild.textAlignment = .left
            phoneTextFeild.textAlignment = .left
            PasswordTextFeild.textAlignment = .left
        }else{
            FirstTextFeild.textAlignment = .right
            LastTextFeild.textAlignment = .right
            EmailTextFeild.textAlignment = .right
            phoneTextFeild.textAlignment = .right
            PasswordTextFeild.textAlignment = .right
        }

        PasswordTextFeild.rightView = eyeBtn
        PasswordTextFeild.rightViewMode = .always
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.pink.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightgray.cgColor
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.resignFirstResponder() {
            return false
        }
        return true
    }
  
    
}
