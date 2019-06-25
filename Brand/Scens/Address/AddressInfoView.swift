//
//  AddressInfoView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/30/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class AddressInfoView: UIView , UITextFieldDelegate{
    var cant:[Country]? {
        didSet {
            guard let cant = self.cant else{return}
            for country in cant {
                //  self.stateList = country.states
                self.country.dropView.dropDownOptions.append(["name":country.name ?? "hhh","id":country.id])
                self.country.dropView.tableView.reloadData()
            }
        }
    }
    var stateList:[State]? {
        didSet{
            guard let states = stateList else{return}
            self.state.dropView.dropDownOptions.removeAll()
            for state in states{
                self.state.dropView.dropDownOptions.append(["name":state.name ?? "hhh","id":state.id])
                self.state.dropView.tableView.reloadData()
            }
        }
    }
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString( "address_info", comment: "")
        return navView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var View: UIView = {
        let View = UIView()
        return View
    }()
    //    lazy var logoImage: UIImageView = {
    //        let logo = UIImageView()
    //        logo.image = #imageLiteral(resourceName: "logoName")
    //        logo.contentMode = .scaleAspectFit
    //        return logo
    //    }()
    lazy var  addressinfoView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var  locationView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var lable:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString( "address_info", comment: "")
        lable.textColor = .black
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Heavy", size: 14)
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        return lable
    }()
    lazy var  PersonName : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "person_name", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    
    lazy var  addressName : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string:NSLocalizedString( "address_name", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    
    lazy var state:DropDownBtn = {
        let btn = DropDownBtn()
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        
        return btn
    }()
    lazy var country:DropDownBtn = {
        let btn = DropDownBtn()
        //btn.setTitle("Country", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        
        //        btn.setTitle("Choose your country" , for: .normal)
        //   btn.setTitleColor(.lightGray, for: .normal)
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        return btn
    }()
    lazy var  city : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "city", comment: "") , attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    lazy var  phone : DefaultTextField = {
        let textField = DefaultTextField()
        textField.keyboardType = .numberPad
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "phone", comment: "") , attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    
    lazy var  postalcode : DefaultTextField = {
        let textField = DefaultTextField()
        textField.keyboardType = .numberPad
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "postal_code", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return textField
    }()
    lazy var detailAddress: UITextView = {
        let textView = UITextView()
        textView.text = NSLocalizedString("detailed_address", comment: "")
        textView.textColor = .black
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.lightgray.cgColor
        textView.font = UIFont(name: "Avenir-Roman", size: 16)
        
        return textView
    }()
    
    lazy var  lineView:UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .lightgray
        return lineView
    }()
    lazy var locationlable:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString( "location", comment: "")
        //  lable.text = "Location"
        lable.textColor = .black
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Heavy", size: 14)
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        return lable
    }()
    lazy var  lat : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.textColor = .lightGray
        textField.keyboardType = .numbersAndPunctuation
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "latVal", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    lazy var  lang : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .numbersAndPunctuation
        textField.textColor = .lightGray
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString( "langVal", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
    lazy var pickLocationBtn: GradBtn = {
        let button = GradBtn()
        // button.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "pick_location", comment: ""), for: .normal)
        button.setTitle(NSLocalizedString( "pick_location", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        return button
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString( "save", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        return button
    }()
    
    lazy var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(navView)
        //        navView.addSubview(addresslable)
        //        navView.addSubview(backBtn)
        self.addSubview(scrollView)
        // scrollView.addSubview(logoImage)
        //  logoImage.isHidden = true
        scrollView.addSubview(View)
        scrollView.addSubview(addressinfoView)
        addressinfoView.addSubview(lable)
        addressinfoView.addSubview(PersonName)
        addressinfoView.addSubview(addressName)
        addressinfoView.addSubview(country)
        addressinfoView.addSubview(state)
        addressinfoView.addSubview(city)
        
        addressinfoView.addSubview(phone)
        addressinfoView.addSubview(postalcode)
        addressinfoView.addSubview(detailAddress)
        scrollView.addSubview(locationView)
        locationView.addSubview(locationlable)
        locationView.addSubview(lineView)
        locationView.addSubview(stackView3)
        stackView3.addArrangedSubview(lat)
        stackView3.addArrangedSubview(lang)
        locationView.addSubview(pickLocationBtn)
        scrollView.addSubview(save)
        
        //Add sapce in textFields
        addressName.setPadding(left: 16, right: 16)
        city.setPadding( left: 16, right: 16)
        PersonName.setPadding(left: 16, right: 16)
        phone.setPadding( left: 16, right: 16)
        postalcode.setPadding( left: 16, right: 16)
        lat.setPadding(left: 16, right: 16)
        lang.setPadding(left: 16, right: 16)
        
        // add textfielsdeleget
        PersonName.delegate = self
        addressName.delegate = self
        
        city.delegate = self
        
        phone.delegate = self
        postalcode.delegate = self
        lat.delegate = self
        lang.delegate = self
        detailAddress.delegate = self
        //  self.sendSubviewToBack(addressinfoView)
        addressinfoView.bringSubviewToFront(country.dropView.tableView)
        addressinfoView.bringSubviewToFront(state.dropView.tableView)
        //  self.bringSubviewToFront(View)
        //add constrains
        
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        View.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        //logoImage.anchor(top: scrollView.topAnchor,left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 170, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        addressinfoView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 480, paddingCenterX: 0, paddingCenterY: 0)
        addressinfoView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        lable.anchor(top: addressinfoView.topAnchor, left: nil, bottom: nil, right: nil, centerX: addressinfoView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        PersonName.anchor(top: lable.bottomAnchor, left: addressinfoView.leftAnchor, bottom: nil, right: addressinfoView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        addressName.anchor(top: PersonName.bottomAnchor, left: addressinfoView.leftAnchor, bottom: nil, right: addressinfoView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        country.anchor(top: addressName.bottomAnchor, left: addressinfoView.leftAnchor, bottom: nil, right: addressinfoView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        
        state.anchor(top: country.bottomAnchor, left: addressinfoView.leftAnchor, bottom: nil,  right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width:0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        state.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        city.anchor(top: country.bottomAnchor, left: nil, bottom: nil,  right:addressinfoView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        city.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        
        phone.anchor(top: state.bottomAnchor, left: addressinfoView.leftAnchor, bottom: nil,  right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width:0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        phone.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        postalcode.anchor(top: city.bottomAnchor, left: nil, bottom: nil,  right:addressinfoView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        postalcode.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        
        
        detailAddress.anchor(top: phone.bottomAnchor, left:addressinfoView.leftAnchor, bottom: nil, right: addressinfoView.rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 85, paddingCenterX: 0, paddingCenterY: 0)
        
        locationView.anchor(top: addressinfoView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 30, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 208, paddingCenterX: 0, paddingCenterY: 0)
        locationView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        locationlable.anchor(top: locationView.topAnchor, left: nil, bottom: nil, right: nil, centerX: locationView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        lineView.anchor(top: locationlable.bottomAnchor, left: locationView.leftAnchor, bottom: nil, right: locationView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5, paddingCenterX: 0, paddingCenterY: 0)
        stackView3.anchor(top: lineView.bottomAnchor, left: locationView.leftAnchor, bottom: nil, right: locationView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        lat.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        lang.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        pickLocationBtn.anchor(top: stackView3.bottomAnchor, left: locationView.leftAnchor, bottom: nil, right: locationView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        save.anchor(top: locationView.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 50, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        pickLocationBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.pickButtonTapped), for: .touchUpInside)
        save.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            PersonName.textAlignment = .left
            addressName.textAlignment = .left
            city.textAlignment = .left
            phone.textAlignment = .left
            postalcode.textAlignment = .left
            detailAddress.textAlignment = .left
            lang.textAlignment = .left
            lat.textAlignment = .left
            
        }else{
            PersonName.textAlignment = .right
            addressName.textAlignment = .right
            city.textAlignment = .right
            phone.textAlignment = .right
            postalcode.textAlignment = .right
            detailAddress.textAlignment = .right
            lat.textAlignment = .right
            lang.textAlignment = .right
            
        }
    }
    //MARK:- View Inits
    init(delegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = delegate
        setupView()
        if MOLHLanguage.currentAppleLanguage() == "en" {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    override func didMoveToSuperview() {
        addressinfoView.bringSubviewToFront(country.dropView)
        addressinfoView.bringSubviewToFront(state.dropView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if MOLHLanguage.currentAppleLanguage() == "en"{
            PersonName.textAlignment = .left
            addressName.textAlignment = .left
            city.textAlignment = .left
            phone.textAlignment = .left
            postalcode.textAlignment = .left
            detailAddress.textAlignment = .left
        }else{
            PersonName.textAlignment = .right
            addressName.textAlignment = .right
            city.textAlignment = .right
            phone.textAlignment = .right
            postalcode.textAlignment = .right
            detailAddress.textAlignment = .right
        }
        country.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        country.imageEdgeInsets = UIEdgeInsets(top: 0, left: country.frame.size.width - 28, bottom: 0, right: 8)
        state.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        state.imageEdgeInsets = UIEdgeInsets(top: 0, left: state.frame.size.width - 28, bottom: 0, right: 8)
        detailAddress.textContainerInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        
        addressName.setPadding(left: 16, right: 16)
        city.setPadding( left: 16, right: 16)
        PersonName.setPadding(left: 16, right: 16)
        phone.setPadding( left: 16, right: 16)
        postalcode.setPadding( left: 16, right: 16)
        lat.setPadding(left: 16, right: 16)
        lang.setPadding(left: 16, right: 16)
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        state.dissmisDropDown()
        country.dissmisDropDown()
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
extension AddressInfoView : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        state.dissmisDropDown()
        country.dissmisDropDown()
        if textView.text == NSLocalizedString("detailed_address", comment: ""){
            textView.text = ""
        }
        textView.layer.borderColor = UIColor.pink.cgColor
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = NSLocalizedString("detailed_address", comment: "")
        }
        textView.layer.borderColor = UIColor.lightgray.cgColor
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == postalcode {
            let maxLength = 5
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else {
            return true
        }
        
    }
    
    
}
