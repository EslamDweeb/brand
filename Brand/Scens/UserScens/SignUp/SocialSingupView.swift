//
//  SocialSingupView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SocialSignUPView: UIView , UITextFieldDelegate{
    
    public weak var actionDelegate:ButtonActionDelegate?
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("socialSignUp", comment: "")
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        navView.titlelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        return navView
    }()
    lazy var  FirstTextFeild : DefaultTextField = {
        let first = DefaultTextField()
        first.clearButtonMode = .whileEditing
        let title = NSLocalizedString( "firstName", comment: "")
        first.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return first
    }()
    
    lazy var  LastTextFeild : DefaultTextField = {
        let last = DefaultTextField()
        last.clearButtonMode = .whileEditing
        let title = NSLocalizedString( "lastName", comment: "")
        last.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return last
    }()
    
    lazy var  phoneTextFeild : DefaultTextField = {
        let phone = DefaultTextField()
        phone.clearButtonMode = .whileEditing
        let title = NSLocalizedString( "phone", comment: "")
        phone.keyboardType = .numberPad
        phone.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return phone
    }()
    
    lazy var  EmailTextFeild : DefaultTextField = {
        let email = DefaultTextField()
        email.clearButtonMode = .whileEditing
        let title = NSLocalizedString( "email", comment: "")
        email.keyboardType = .emailAddress
        email.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return email
    }()
    lazy var  PassworfTextFeild : DefaultTextField = {
        let email = DefaultTextField()
        email.clearButtonMode = .whileEditing
        let title = NSLocalizedString( "Password", comment: "")
        email.isSecureTextEntry = true
        email.keyboardType = .emailAddress
        email.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        return email
    }()
    lazy var CreateButton: GradBtn = {
        let button = GradBtn()
        let title = NSLocalizedString( "sign_up", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.signupBtnTapped), for: .touchUpInside)
        return button
    }()
    
    init(buttonAction:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = buttonAction
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addViews()
        addConstraints()
        
    }
    
    
    func addViews()
    {
        self.addSubview(navView)
        self.addSubview(FirstTextFeild)
        self.addSubview(LastTextFeild)
        self.addSubview(phoneTextFeild)
        self.addSubview(EmailTextFeild)
        self.addSubview(PassworfTextFeild)
        self.addSubview(CreateButton)
        FirstTextFeild.setPadding(left: 16, right: 16)
        LastTextFeild.setPadding(left: 16, right: 16)
        phoneTextFeild.setPadding(left: 16, right: 16)
        EmailTextFeild.setPadding(left: 16, right: 16)
        PassworfTextFeild.setPadding(left: 16, right: 16)
        
    }
    
    func addConstraints()
    {
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        FirstTextFeild.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        FirstTextFeild.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        FirstTextFeild.setPadding(left: 16, right: nil)
        LastTextFeild.anchor(top: navView.bottomAnchor, left: FirstTextFeild.rightAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        LastTextFeild.setPadding(left: 16, right: nil)
        phoneTextFeild.anchor(top: FirstTextFeild.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        phoneTextFeild.setPadding(left: 16, right: nil)
        EmailTextFeild.anchor(top: phoneTextFeild.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        EmailTextFeild.setPadding(left: 16, right: nil)
        PassworfTextFeild.anchor(top: EmailTextFeild.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        PassworfTextFeild.setPadding(left: 16, right: nil)
        CreateButton.anchor(top: PassworfTextFeild.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        
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
