//
//  mapView.swift
//  Al_Ula
//
//  Created by nada dyaa on 5/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
import GoogleMaps
import MOLH

class mapVieww: UIView , UITextFieldDelegate  {
    
   
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString( "pick_location", comment: "")
        return navView
    }()
    
    lazy var mapview : GMSMapView = {
        let map = GMSMapView()
      
        return map
    }()
   
    lazy var  lat : DefaultTextField = {
        let textField = DefaultTextField()
        textField.clearButtonMode = .whileEditing
        textField.textColor = .lightGray
        textField.backgroundColor = .white
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
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Avenir-Roman", size: 16)
        textField.attributedPlaceholder = NSAttributedString(string:NSLocalizedString( "langVal", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return textField
    }()
   
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString( "save", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        return button
    }()
    
    lazy var centerLocation:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Group 2-1"), for: .normal)
        return btn
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(navView)
        mapview.addSubview(lat)
        mapview.addSubview(lang)
        mapview.addSubview(save)
        mapview.addSubview(centerLocation)
        self.addSubview(mapview)
        lat.delegate = self
        lang.delegate = self
     
        
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
     mapview.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        lat.setPadding(left: 16, right: 16)
        lang.setPadding(left: 16, right: 16)
        if MOLHLanguage.currentAppleLanguage() == "en"{
             centerLocation.anchor(top: nil, left: nil, bottom: lat.topAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 16, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        }else{
             centerLocation.anchor(top: nil, left: self.leftAnchor, bottom: lat.topAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        }
        lat.anchor(top: nil, left: self.leftAnchor, bottom: lang.topAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        lang.anchor(top: nil, left: self.leftAnchor, bottom: save.topAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        save.anchor(top: nil, left: self.leftAnchor, bottom: mapview.bottomAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 24, paddingRight: 16, width: 0, height: 48, paddingCenterX: 0, paddingCenterY: 0)

        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        centerLocation.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
        save.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        
    
    }
    //MARK:- View Inits
//    init(delegate:ButtonActionDelegate) {
//        super.init(frame: .zero)
//        self.actionDelegate = delegate
//        setupView()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
            lat.setPadding(left: 16, right: 16)
            lang.setPadding(left: 16, right: 16)
        
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
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        textView.layer.borderColor = UIColor.magenta.cgColor
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor.lightgray.cgColor
    }
}
