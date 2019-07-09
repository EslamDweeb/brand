//
//  Myprofile.swift
//  Brands
//
//  Created by nada dyaa on 1/30/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class ProfileView : UIView , UITextFieldDelegate{
    public weak var ActionDelegate:ButtonActionDelegate?
    lazy var dateBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "dateRangeMaterial"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 46, height: 16)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return button
    }()
    lazy var doneBtn: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        return button
    }()
    @objc func doneAction() {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyy-MM-dd"
        dateTextFeild.text = dateFormate.string(from: datePicker.date)
        dateTextFeild.endEditing(true)
    }
    lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        toolBar.setItems([doneBtn], animated: true)
        return toolBar
    }()
    lazy var datePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        return date
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
        
    }()
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("personal_information", comment: "")
        return navView
    }()
  
  
    lazy var myprofileImage: RoundedImageView = {
        let imageView = RoundedImageView(frame: .zero)
        imageView.addGestureRecognizer(tapGesture)
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var Namelabel :UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: " Avenir-Heavy", size: 20)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.isHidden = true
        return label
    }()
    
    lazy var lineView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightgray
        view.isHidden = true
        return view
    }()
    lazy var  accountView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        View.isHidden = true
        return View
    }()
    lazy var EditBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        button.addTarget(ActionDelegate, action: #selector(ButtonActionDelegate.editeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    lazy var Accountinfolabel:UILabel = {
        let label = UILabel()
        let title = NSLocalizedString("personal_information", comment: "")
        label.text = title
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        return label
    }()
    lazy var  FirstTextFeild : DefaultTextField = {
        let first = DefaultTextField()
        let title = NSLocalizedString("firstName", comment: "")
        first.clearButtonMode = .whileEditing
        first.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        first.font = UIFont(name: "Avenir-Roman", size: 16)
        first.textColor = .lightgray3
        first.isUserInteractionEnabled = false
        return first
    }()
    lazy var  LastTextFeild : DefaultTextField = {
        let last = DefaultTextField()
        last.clearButtonMode = .whileEditing
        let title = NSLocalizedString("lastName", comment: "")
        last.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        last.font = UIFont(name: "Avenir-Roman", size: 16)
        last.isUserInteractionEnabled = false
        last.textColor = .lightgray3
        return last
    }()
    lazy var  phoneTextFeild : DefaultTextField = {
        let phone = DefaultTextField()
        phone.clearButtonMode = .whileEditing
        let title = NSLocalizedString("phone", comment: "")
        phone.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        phone.font = UIFont(name: "Avenir-Roman", size: 16)
        phone.isUserInteractionEnabled = false
        phone.textColor = .lightgray3
        phone.keyboardType = .numberPad
        return phone
    }()
    lazy var  EmailTextFeild : DefaultTextField = {
        let email = DefaultTextField()
        email.clearButtonMode = .whileEditing
        let title = NSLocalizedString("email", comment: "")
        email.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        email.font = UIFont(name: "Avenir-Roman", size: 16)
        email.textColor = .lightgray3
        email.keyboardType = .emailAddress
        email.isUserInteractionEnabled = false
        return email
    }()
    lazy var  dateTextFeild : DefaultTextField = {
        let date = DefaultTextField()
        date.textColor = .lightgray3
        date.clearButtonMode = .whileEditing
        let title = NSLocalizedString("birth_date", comment: "")
        date.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        date.font = UIFont(name: "Avenir-Roman", size: 16)
        date.inputAccessoryView = toolBar
        date.inputView = datePicker
        date.isUserInteractionEnabled = false
        return date
    }()
    
    lazy var Genderview:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.setTitle( NSLocalizedString("select_gender", comment: ""), for: .normal)
        btn.setTitleColor(.lightgray3, for: .normal)
        btn.dropView.dropDownOptions = [["name":NSLocalizedString("Male", comment: "")],["name":NSLocalizedString( "Female", comment: "")]]
        btn.isEnabled = false
        return btn
    }()
    lazy var  securityView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        View.isHidden = true
        return View
    }()
    lazy var EditsecurBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        button.addTarget(ActionDelegate, action: #selector(ButtonActionDelegate.editeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    lazy var Securityinfolabel:UILabel = {
        let label = UILabel()
        let title = NSLocalizedString("security_info", comment: "")
        label.text = title
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        return label
    }()
    lazy var  SecurityTextFeild : UITextField = {
        let security = UITextField()
        security.clearButtonMode = .whileEditing
        let title = NSLocalizedString("stars", comment: "")
        security.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightgray3,NSAttributedString.Key.font : UIFont(name: "Avenir-Roman", size: 16)!])
        security.font = UIFont(name: "Avenir-Roman", size: 16)
        security.isSecureTextEntry = true
        security.isUserInteractionEnabled = false
        return security
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: ActionDelegate, action: #selector(ActionDelegate!.imageViewTapped))
        return tap
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if MOLHLanguage.currentAppleLanguage() == "en" {
            Genderview.contentHorizontalAlignment = .left
            Genderview.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
            Genderview.imageEdgeInsets = UIEdgeInsets(top: 0, left: Genderview.frame.size.width - 28, bottom: 0, right: 8)
        }else{
            Genderview.contentHorizontalAlignment = .right
            Genderview.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 1)
            Genderview.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: Genderview.frame.size.width - 28)
        }
        
        FirstTextFeild.setPadding(left: 16, right: 16)
        LastTextFeild.setPadding(left: 16, right: 16)
        phoneTextFeild.setPadding(left: 16, right: 16)
        EmailTextFeild.setPadding(left: 16, right: 16)
        dateTextFeild.setPadding(left: 16, right: 16)
        SecurityTextFeild.setPadding(left: 16, right: 16)
        dateTextFeild.rightView = dateBtn
        dateTextFeild.rightViewMode = .always
    }
    
    func setup(){
        self.backgroundColor = .white
        self.addSubview(navView)
   
        self.addSubview(scrollView)
        scrollView.addSubview(myprofileImage)
        scrollView.addSubview(Namelabel)
        scrollView.addSubview(lineView1)
        scrollView.addSubview(accountView)
        accountView.addSubview(EditBtn)
        accountView.addSubview(Accountinfolabel)
        accountView.addSubview(stackView)
        stackView.addArrangedSubview(FirstTextFeild)
        stackView.addArrangedSubview(LastTextFeild)
        accountView.addSubview(dateTextFeild)
        accountView.addSubview(phoneTextFeild)
        accountView.addSubview(EmailTextFeild)
        accountView.addSubview(Genderview)
        scrollView.addSubview(securityView)
        securityView.addSubview(EditsecurBtn)
        securityView.addSubview(Securityinfolabel)
        securityView.addSubview(SecurityTextFeild)
    
        
        FirstTextFeild.delegate =  self
        LastTextFeild.delegate = self
        phoneTextFeild.delegate = self
        EmailTextFeild.delegate = self
        dateTextFeild.delegate = self
        SecurityTextFeild.delegate = self
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
            Genderview.contentHorizontalAlignment = .left
            Genderview.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
            Genderview.imageEdgeInsets = UIEdgeInsets(top: 0, left: Genderview.frame.size.width - 28, bottom: 0, right: 8)
            SecurityTextFeild.textAlignment = .left
            FirstTextFeild.textAlignment = .left
            LastTextFeild.textAlignment = .left
            EmailTextFeild.textAlignment = .left
            phoneTextFeild.textAlignment = .left
            dateTextFeild.textAlignment = .left

            EditBtn.anchor(top: nil , left: nil, bottom: nil, right: accountView.rightAnchor, centerX: nil, centerY: Accountinfolabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            EditsecurBtn.anchor(top: nil , left: nil, bottom: nil, right: securityView.rightAnchor, centerX: nil, centerY: Securityinfolabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            Genderview.contentHorizontalAlignment = .right
            Genderview.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 1)
            Genderview.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: Genderview.frame.size.width - 28)
            SecurityTextFeild.textAlignment = .right
            FirstTextFeild.textAlignment = .right
            LastTextFeild.textAlignment = .right
            EmailTextFeild.textAlignment = .right
            phoneTextFeild.textAlignment = .right
            dateTextFeild.textAlignment = .right
            EditBtn.anchor(top: nil , left: accountView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: Accountinfolabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            EditsecurBtn.anchor(top: nil , left: securityView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: Securityinfolabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        myprofileImage.anchor(top: self.scrollView.topAnchor, left: nil, bottom: nil, right: nil, centerX: self.scrollView.centerXAnchor, centerY: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140, paddingCenterX: 0, paddingCenterY: 0)
        Namelabel.anchor(top: myprofileImage.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 18, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        lineView1.anchor(top: Namelabel.bottomAnchor , left:self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
        accountView.anchor(top: lineView1.bottomAnchor, left: self.scrollView.leftAnchor, bottom: nil, right: self.scrollView.rightAnchor, centerX: self.scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 380, paddingCenterX: 0, paddingCenterY: 0)
        accountView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 3), shadowOpacity: 0.5, shadowRaduis: 1)
        
        Accountinfolabel.anchor(top: accountView.topAnchor , left: nil, bottom: nil, right: nil, centerX: accountView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        stackView.anchor(top: Accountinfolabel.bottomAnchor, left: accountView.leftAnchor, bottom: nil, right: accountView.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 35, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        FirstTextFeild.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        FirstTextFeild.setPadding(left: 8, right: nil)
        LastTextFeild.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        LastTextFeild.setPadding(left: 8, right: nil)
        EmailTextFeild.anchor(top: LastTextFeild.bottomAnchor, left: accountView.leftAnchor, bottom: nil, right: accountView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        EmailTextFeild.setPadding(left: 8, right: nil)
       
        phoneTextFeild.anchor(top: EmailTextFeild.bottomAnchor, left: accountView.leftAnchor, bottom: nil, right: accountView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        phoneTextFeild.setPadding(left: 8, right: nil)
        Genderview.anchor(top: phoneTextFeild.bottomAnchor, left: accountView.leftAnchor, bottom: nil, right: accountView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
         dateTextFeild.setPadding(left: 8, right: nil)
        dateTextFeild.anchor(top: Genderview.bottomAnchor, left: accountView.leftAnchor, bottom: nil, right: accountView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
       
        securityView.anchor(top: accountView.bottomAnchor, left: self.scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: self.scrollView.rightAnchor, centerX: self.scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 10, paddingRight: 8, width: 0, height: 110, paddingCenterX: 0, paddingCenterY: 0)
        securityView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 3), shadowOpacity: 0.5, shadowRaduis: 1)
        
        Securityinfolabel.anchor(top: securityView.topAnchor , left: nil, bottom: nil, right: nil, centerX: securityView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        SecurityTextFeild.anchor(top: Securityinfolabel.bottomAnchor, left: securityView.leftAnchor, bottom: nil, right: securityView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 25, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        SecurityTextFeild.setPadding(left: 8, right: nil)
       navView.backBtn.addTarget(ActionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
    }
    init(delegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.ActionDelegate = delegate
        setup()
    }
    override func didMoveToSuperview() {
        accountView.bringSubviewToFront(Genderview.dropView)
        self.sendSubviewToBack(securityView)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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


