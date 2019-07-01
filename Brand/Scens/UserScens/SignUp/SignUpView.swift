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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoName")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var createlabel :UILabel = {
        let createaccount = UILabel()
        let title = NSLocalizedString("createAccount", comment: "")
        createaccount.text = title
        createaccount.font = UIFont(name: "Avenir-Heavy", size: 20)
        createaccount.textAlignment = .center
        createaccount.textColor = UIColor.black
        return createaccount
    }()
    
    lazy var  FirstTextFeild : DefaultTextField = {
        let first = DefaultTextField()
        first.clearButtonMode = .whileEditing
        let title = NSLocalizedString("firstName", comment: "")
        first.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        first.font = UIFont(name: "Avenir-Roman", size: 16)
        return first
    }()
    
    lazy var  LastTextFeild : DefaultTextField = {
        let last = DefaultTextField()
        last.clearButtonMode = .whileEditing 
        let title = NSLocalizedString("lastName", comment: "")
        last.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        last.font = UIFont(name: "Avenir-Roman", size: 16)
        return last
    }()
    
    lazy var  phoneTextFeild : DefaultTextField = {
        let phone = DefaultTextField()
        phone.clearButtonMode = .whileEditing
        let title = NSLocalizedString("phone", comment: "")
        phone.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        phone.font = UIFont(name: "Avenir-Roman", size: 16)
        return phone
    }()
    
    lazy var  EmailTextFeild : DefaultTextField = {
        let email = DefaultTextField()
        email.clearButtonMode = .whileEditing
           let title = NSLocalizedString("email", comment: "")
        email.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        email.font = UIFont(name: "Avenir-Roman", size: 16)
        return email
    }()
    
    lazy var  PasswordTextFeild : DefaultTextField = {
        let password = DefaultTextField()
        password.clearButtonMode = .whileEditing
        let title = NSLocalizedString("password", comment: "")
        password.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        password.font = UIFont(name: "Avenir-Roman", size: 16)
        password.isSecureTextEntry = true
        return password
    }()
    lazy var eyeBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 26, height: 16)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
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
    lazy var Memberlabel :UILabel = {
        let memberlabel = UILabel()
        let title = NSLocalizedString("already_a_member_login", comment: "")
        memberlabel.text = title
        memberlabel.font = UIFont(name: "Avenir-Medium", size: 16)
        memberlabel.textAlignment = .center
        memberlabel.textColor = #colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
        return memberlabel
    }()
    lazy var CreateButton: GradBtn = {
        let button = GradBtn()
        let title = NSLocalizedString("signup", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        return button
    }()
    lazy var LoginButton: UIButton = {
        let button = UIButton()
        let title = NSLocalizedString("login", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .pink, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        return button
    }()
    lazy var Descriptionlabel :UILabel = {
        let descriptionlabel = UILabel()
        let title = NSLocalizedString("by_signing_up_you_accept_terms_and_privacy_policy", comment: "")
        descriptionlabel.text = title
        descriptionlabel.font = UIFont(name: "Avenir-Roman", size: 16)
        descriptionlabel.textAlignment = .center
        descriptionlabel.textColor = UIColor.lightgray3
        descriptionlabel.numberOfLines = 0
        return descriptionlabel
    }()
    public weak var ActionDelegate:ButtonActionDelegate?

    func setup(){
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(logoImage)
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
        
        FirstTextFeild.setPadding(left: 16, right: 16)
        LastTextFeild.setPadding(left: 16, right: 16)
        PasswordTextFeild.setPadding(left: 16, right: 16)
        phoneTextFeild.setPadding(left: 16, right: 16)
        EmailTextFeild.setPadding(left: 16, right: 16)
        PasswordTextFeild.rightView = eyeBtn
        PasswordTextFeild.rightViewMode = .always
        
        
        FirstTextFeild.delegate =  self
        LastTextFeild.delegate = self
        PasswordTextFeild.delegate = self
        phoneTextFeild.delegate = self
        EmailTextFeild.delegate = self
        
      scrollView.anchor(top: topAnchor, left: leftAnchor , bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        logoImage.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 150, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        createlabel.anchor(top: logoImage.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 40, paddingCenterX: 0, paddingCenterY: 0)
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
        FirstTextFeild.setPadding(left: 16, right: 16)
        LastTextFeild.setPadding(left: 16, right: 16)
        PasswordTextFeild.setPadding(left: 16, right: 16)
        phoneTextFeild.setPadding(left: 16, right: 16)
        EmailTextFeild.setPadding(left: 16, right: 16)
        eyeBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 16)
        eyeBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
