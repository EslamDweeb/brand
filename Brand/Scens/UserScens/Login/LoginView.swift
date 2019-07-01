//
//  LoginView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class LoginView: UIView, UITextFieldDelegate {
    
     lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoName")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
     lazy var headerText: UITextView = {
        let textView = UITextView()
        let title = NSLocalizedString("please_login_to_continue", comment: "")
        textView.text = title
        textView.font  = UIFont(name: "Avenir-Heavy", size: 20)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()

    lazy var  email : DefaultTextField = {
        let email = DefaultTextField()
        email.clearButtonMode = .whileEditing
        email.font = UIFont(name: "Avenir-Roman", size: 16)
        let title = NSLocalizedString("email_phone", comment: "")
        email.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return email
    }()
     lazy var  password : DefaultTextField = {
        let password = DefaultTextField()
        password.isSecureTextEntry = true
        let title = NSLocalizedString("password", comment: "")
        password.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        password.font = UIFont(name: "Avenir-Roman", size: 16)
        return password
    }()
    lazy var eyeBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 26, height: 16)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    lazy var forgotBtn: UIButton = {
        let button = UIButton()
        let title = NSLocalizedString("forgotPassword", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .forgotColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        return button
    }()
     lazy var loginBtn: GradBtn = {
        let button = GradBtn()
         let title = NSLocalizedString("login", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        return button
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()

    lazy var signUpText :UILabel = {
        let memberlabel = UILabel()
        let title = NSLocalizedString("don_t_have_an_acount", comment: "")
        memberlabel.text = title
        memberlabel.font = UIFont(name: "Avenir-Medium", size: 16)
        memberlabel.textAlignment = .center
        memberlabel.textColor = #colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
        return memberlabel
    }()
     lazy var signUptBtn: UIButton = {
        let button = UIButton()
         let title = NSLocalizedString("signup", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .pink, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        return button
    }()
    lazy var lineView1: UIView = {
        let view = UIView()
        view.backgroundColor = .forgotColor
        return view
    }()
     lazy var lineView2: UIView = {
        let view = UIView()
        view.backgroundColor = .forgotColor
        return view
    }()
       lazy var socialText: UITextView = {
            let textView = UITextView()
        let title = NSLocalizedString("or_login_with", comment: "")
            textView.text = title
            textView.textColor = #colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
            textView.font  = UIFont(name: "Avenir-Heavy", size: 16)
            textView.textAlignment = .center
            textView.isScrollEnabled = false
            textView.isEditable = false
            return textView
        }()
    
    lazy var FBButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        button.setCornerRadius(radius: nil)
        return button
    }()
   lazy var TWButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        button.setCornerRadius(radius: nil)
        return button
    }()
    lazy var signupStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
         stackView.spacing = 0
        return stackView
    }()
   lazy var socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    
   func setupView(){
        // add subViews
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(logoImage)
        scrollView.addSubview(headerText)
        scrollView.addSubview(stackView)
        scrollView.addSubview(forgotBtn)
        scrollView.addSubview(loginBtn)
        scrollView.addSubview(signupStackView)
        scrollView.addSubview(lineView1)
        scrollView.addSubview(lineView2)
        scrollView.addSubview(socialText)
        scrollView.addSubview(socialStackView)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
       signupStackView.addArrangedSubview(signUpText)
       signupStackView.addArrangedSubview(signUptBtn)
        socialStackView.addArrangedSubview(TWButton)
        socialStackView.addArrangedSubview(FBButton)
    
    // set textfield delegate
        email.delegate = self
       password.delegate = self
    // add padding to text view
  
    email.setPadding(left: 16, right: 16)
    password.setPadding( left: 16, right: 16)
    password.rightView = eyeBtn
    password.rightViewMode = .always
        // Add constrains

        scrollView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    
        logoImage.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        logoImage.topAnchor.constraint(greaterThanOrEqualTo: scrollView.topAnchor, constant: 200).isActive = true
    
        headerText.anchor(top: logoImage.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 35, paddingCenterX: 0, paddingCenterY: 0)
        
        stackView.anchor(top: headerText.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        email.anchor(top:nil, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        
        password.anchor(top:nil, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        
        forgotBtn.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 130, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        loginBtn.anchor(top: forgotBtn.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
         //signUpText.widthAnchor.constraint(equalToConstant: 150).isActive = true
    
        signupStackView.anchor(top: loginBtn.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    
        socialText.anchor(top: signupStackView.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        
        lineView1.anchor(top: nil , left: scrollView.leftAnchor, bottom: nil, right: socialText.leftAnchor, centerX: nil, centerY: socialText.centerYAnchor, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 5)
        
        lineView2.anchor(top: nil , left: socialText.rightAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: socialText.centerYAnchor, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 5)
        
        socialStackView.anchor(top: socialText.bottomAnchor, left: nil , bottom: scrollView.bottomAnchor, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
    
        
        FBButton.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        
        TWButton.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
    
    loginBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.normalLogin), for: .touchUpInside)
    signUptBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.signupBtnTapped), for: .touchUpInside)
    FBButton.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.faceBookLogin), for: .touchUpInside)
    TWButton.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.twitterLogin), for: .touchUpInside)
   
    eyeBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.togglePassword(_:)), for: .touchUpInside)
    forgotBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.forgotPassword), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if MOLHLanguage.currentAppleLanguage() == "en" {
            email.textAlignment = .left
            password.textAlignment = .left
        }else{
            email.textAlignment = .right
            password.textAlignment = .right
        }
        eyeBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 16)
        eyeBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        email.setPadding(left: 16, right: 16)
        password.setPadding( left: 16, right: 16)
        password.rightView = eyeBtn
        password.rightViewMode = .always
    }
    //MARK:- TextField Delgate Functions
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
