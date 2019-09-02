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
     var logotopConstrain : NSLayoutConstraint?
     lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoName")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var closeImg : BtnImage = {
        let btn  = BtnImage()
         btn.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal)
        btn.isHidden = false
        return btn
    }()
     lazy var headerText: HeaderLabel = {
        let lable = HeaderLabel()
        let title = "please_login_to_continue".localized
         lable.font =  self.setFont(name: .fontH, size: 20)
         lable.text = title
        return lable
    }()

    lazy var  email : DefaultTextField = {
        let email = DefaultTextField()
        let title = "email_phone".localized
        email.SetAttributePlaceHeader(Title: title)
        return email
    }()
     lazy var  password : DefaultTextField = {
        let password = DefaultTextField()
        password.isSecureTextEntry = true
        let title = "password".localized
        password.SetAttributePlaceHeader(Title: title)
        return password
    }()
    lazy var eyeBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        return button
    }()
    lazy var forgotBtn: UIButton = {
        let button = UIButton()
        let title = "forgotPassword".localized
        button.setTitle(title, for: .normal)
        button.setTitleColor( .forgotColor, for: .normal)
        button.titleLabel?.font = setFont(name: .fontH, size: 14)
        return button
    }()
     lazy var loginBtn: GradBtn = {
        let button = GradBtn()
         let title = "login".localized
        button.setTitle(title, for: .normal)
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

    lazy var signUpText :DefaultLabel = {
        let memberlabel = DefaultLabel()
        memberlabel.text =  "don_t_have_an_acount".localized
        memberlabel.textColor = .grayColor
        return memberlabel
    }()
     lazy var signUptBtn: UIButton = {
        let button = UIButton()
         let title = "signup".localized
        button.setTitle(title, for: .normal)
        button.setTitleColor( .pink, for: .normal)
        button.titleLabel?.font = setFont(name: .fontH, size: 16)
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
       lazy var socialText: DefaultLabel = {
            let label = DefaultLabel()
        let title = "or_login_with".localized
            label.text = title
            return label
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
       self.addSubview(closeImg)
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
    password.rightView = eyeBtn
    password.rightViewMode = .always
        // Add constrains
     closeImg.isHidden = true
        scrollView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    if MOLHLanguage.currentAppleLanguage() == "en"{
        closeImg.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
    }else{
        closeImg.anchor(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
    }
        logoImage.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 45, paddingCenterX: 0, paddingCenterY: 0)
//        logoImage.topAnchor.constraint(greaterThanOrEqualTo: scrollView.topAnchor, constant: 200).isActive = true
    logotopConstrain = logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0)
    logotopConstrain?.isActive = true
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
     closeImg.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
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
          logotopConstrain?.constant =  self.frame.size.height * 0.12
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
