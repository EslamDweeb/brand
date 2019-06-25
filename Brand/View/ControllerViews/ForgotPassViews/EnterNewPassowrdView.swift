//
//  EnterNewPassowrdView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class EnterNewPasswordView: UIView,UITextFieldDelegate {
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("reset_password", comment: "")
        return navView
    }()
   
  
    lazy var lable:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("please_type_your_new_password", comment: "")
        lable.textColor = .lightgray
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        return lable
    }()
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "iconsFinalForgetPassword")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    lazy var  textField : DefaultTextField = {
        let textField = DefaultTextField()
         textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("new_password", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    lazy var confirmBtn: GradBtn = {
        let button = GradBtn(enabledd: false)
        button.Enabledd = false
        button.setTitle(NSLocalizedString("confirm_new_password", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        button.isEnabled = false
        return button
    }()
    lazy var eyeBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 26, height: 16)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
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
    func setupView() {
        self.backgroundColor = .white
        //Add subViews
        addSubview(navView)
      
        addSubview(logoImage)
        addSubview(lable)
        addSubview(textField)
        addSubview(confirmBtn)
        //TextFieldDelegate
        textField.delegate = self
        textField.setPadding( left: 20, right: nil)
        textField.rightView = eyeBtn
        textField.rightViewMode = .always
        //Add Constarins
        navView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
      
        logoImage.anchor(top: navView.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, centerX: nil, centerY: nil, paddingTop: 75, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 200, height: 175, paddingCenterX: 0, paddingCenterY: 0)
        lable.anchor(top: logoImage.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        textField.anchor(top: lable.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, centerX: nil, centerY: nil, paddingTop:40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        confirmBtn.anchor(top: textField.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: self.safeAreaLayoutGuide.rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        //Add Button Actions
        navView.backBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        confirmBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.continuePressed), for: .touchUpInside)
         eyeBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.togglePassword), for: .touchUpInside)
        textField.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.changeBtn), for: .editingChanged)
        //do som
        
    }
    //MARK:- TextField Delgate Functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.pink.cgColor
       // confirmBtn.isEnabled = true
        
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
