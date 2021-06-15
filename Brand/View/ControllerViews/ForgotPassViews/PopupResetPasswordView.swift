//
//  PopupResetPasswordView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/27/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class PopupResetPasswordView: UIView,UITextFieldDelegate {
    //MARK:- Add Views
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
         navView.titlelabel.text = "reset_password".localized
        return navView
    }()
   
    lazy var forgotlabel:HeaderLabel = {
        let label = HeaderLabel()
        label.text = "forgot_your_password".localized
        return label
    }()
   
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "iconsFinalForgetPassword")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    lazy var bodyText: HeaderLabel = {
        let textView = HeaderLabel()
        textView.text = "enter_your_email_phone_below_to_reset_your_password".localized
        textView.textColor = .grayColor
       textView.numberOfLines = 0
        return textView
    }()
    lazy var  textField : DefaultTextField = {
        let textField = DefaultTextField()
        let title = "Email/phone".localized
        textField.SetAttributePlaceHeader(Title: title)
        return textField
    }()
    lazy var continueBtn: GradBtn = {
        let button = GradBtn()
        button.setTitle("CONTINUE".localized, for: .normal)
        return button
    }()
   
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
 public weak var actionDelegate: ButtonActionDelegate?
    //MARK:- View Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    //MARK:- Helper Functions
    func setupView(){
        self.backgroundColor = .white
        // Add SubViews
        
        self.backgroundColor = .white
        self.addSubview(navView)
   
        self.addSubview(scrollView)
       
        scrollView.addSubview(logoImage)
       scrollView.addSubview(forgotlabel)
        scrollView.addSubview(textField)
        scrollView.addSubview(continueBtn)
        scrollView.addSubview(bodyText)
//        scrollView.delegate = self
        //Add textFieldViews&Delegate
        textField.delegate = self
        textField.setPadding(left: 16, right: nil)
        //Add Constrains
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
       
        logoImage.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, centerX:scrollView.centerXAnchor, centerY: nil, paddingTop: 35, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 175, paddingCenterX: 0, paddingCenterY: 0)
        forgotlabel.anchor(top: logoImage.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        bodyText.anchor(top: forgotlabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        textField.anchor(top: bodyText.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        continueBtn.anchor(top: textField.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)

        // Add Button Targets
       navView.backBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        continueBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.continuePressed), for: .touchUpInside)
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
