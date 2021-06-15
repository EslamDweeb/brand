//
//  popupDateView.swift
//  Brands
//
//  Created by Nada Dyaa on 2/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class DatePopupView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCornerRadius(radius: 3)
        return view
    }()
    lazy var  navView:UIView = {
        let navView = UIView()
        return navView
    }()
    lazy var Datelabel:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("date", comment: "")
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        return label
    }()
    lazy var SaveButton: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString("save", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        
        return button
    }()
    lazy var datepicker : UIDatePicker = {
        let date = UIDatePicker()
        
        date.datePickerMode = .date
        date.backgroundColor = UIColor.white
        return date
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
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(containerView)
        containerView.addSubview(navView)
        navView.addSubview(Datelabel)
        containerView.addSubview(datepicker)
        containerView.addSubview(SaveButton)
        containerView.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        navView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         navView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.2).isActive = true
      Datelabel.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: navView.centerXAnchor, centerY: navView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        datepicker.anchor(top: navView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        datepicker.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        SaveButton.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        
        navView.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 0), location: [0,0.5,1])
       SaveButton.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1), location: [0,0.5,1])
    }
}
