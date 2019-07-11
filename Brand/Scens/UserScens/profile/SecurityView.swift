//
//  SecurityView.swift
//  Al_Ula
//
//  Created by nada dyaa on 4/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class securityinfoView : UIView , UITextFieldDelegate{
    
    lazy var containerView: shadowView = {
        let view = shadowView()
        return view
    }()
    lazy var eyeBtnCurrent: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.togglePassword(_:)), for: .touchUpInside)
        return button
    }()
    lazy var eyeBtnNew: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "eye-slash - FontAwesome"), for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.togglePassword(_:)), for: .touchUpInside)
        return button
    }()
    lazy var ExitBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return button
    }()
    lazy var Securitylabel:HeaderLabel = {
        let label = HeaderLabel()
        label.text = "security_info".localized
        return label
    }()
    lazy var  CurrentPassTextFeild : DefaultTextField = {
        let CurrentPass = DefaultTextField()
        CurrentPass.SetAttributePlaceHeader(Title: "current_password".localized)
        CurrentPass.isSecureTextEntry = true
        return CurrentPass
    }()
    lazy var  NewPassTextFeild : DefaultTextField = {
        let New = DefaultTextField()
        New.SetAttributePlaceHeader(Title: "new_password".localized)
        New.isSecureTextEntry = true
        return New
    }()
    lazy var SaveButton: GradBtn = {
        let button = GradBtn()
        button.setTitle("save".localized, for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        return button
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    //MARK:- View Inits
    init(delegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        NewPassTextFeild.delegate = self
        CurrentPassTextFeild.delegate = self
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(containerView)
        containerView.addSubview(Securitylabel)
        containerView.addSubview(ExitBtn)
        containerView.addSubview(CurrentPassTextFeild)
        containerView.addSubview(NewPassTextFeild)
        containerView.addSubview(SaveButton)
        containerView.anchor(top: nil, left: safeAreaLayoutGuide.leftAnchor, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 240, paddingCenterX: 0, paddingCenterY: 0)
        
        Securitylabel.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en"{
              ExitBtn.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: Securitylabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            ExitBtn.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: Securitylabel.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        }
        
        CurrentPassTextFeild.anchor(top: Securitylabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        NewPassTextFeild.anchor(top: CurrentPassTextFeild.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        SaveButton.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
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
    override func layoutSubviews() {
        super.layoutSubviews()
        if MOLHLanguage.currentAppleLanguage() == "en"{
            CurrentPassTextFeild.textAlignment = .left
            NewPassTextFeild.textAlignment = .left
        }else if MOLHLanguage.currentAppleLanguage() == "ar"{
            CurrentPassTextFeild.textAlignment = .right
            NewPassTextFeild.textAlignment = .right
        }
        CurrentPassTextFeild.rightView = eyeBtnCurrent
        CurrentPassTextFeild.rightViewMode = .always
        NewPassTextFeild.rightView = eyeBtnNew
        NewPassTextFeild.rightViewMode = .always
    }
}
