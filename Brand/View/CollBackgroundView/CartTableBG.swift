//
//  CartTableBG.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit

class CartTableBG : UIView{
    
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash02")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lable:DefaultLabel = {
        let lbl = DefaultLabel()
        lbl.text = YString.yourCartIsEmpty 
        lbl.textAlignment = .center
        return lbl
    }()
    lazy var startbtn: GradBtn = {
        let button = GradBtn()
      //  button.isHidden = true
        button.setTitle( "shop".localized, for: .normal)
        button.addTarget(self.delegate, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    private var delegate : ButtonActionDelegate?
    
    init(delegate : ButtonActionDelegate) {
        super.init(frame: .zero )
        self.delegate = delegate
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        self.backgroundColor = .backgroundColl
        addSubViews()
        addConstarinsToUI()
    }
    private func addSubViews() {
        addSubview(image)
        addSubview(lable)
        addSubview(startbtn)
        
    }
    private func addConstarinsToUI() {
        image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 200, paddingCenterX: 0, paddingCenterY: -70)
        
        lable.anchor(top: image.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
     startbtn.anchor(top: lable.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
     //   startbtn.addTarget(self.delegate, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
    }
}

class NotificationBG:UIView{
     private weak var delegate : ButtonActionDelegate?

    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "  notification empty state copy 5")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lable:DefaultLabel = {
        let lbl = DefaultLabel()
        lbl.text = YString.notificationEmpty
        lbl.textAlignment = .center
        return lbl
    }()
    lazy var startbtn: GradBtn = {
        let button = GradBtn()
        button.isHidden = true
        button.setTitle( YString.login, for: .normal)
        button.addTarget( delegate,action: #selector(delegate?.loginBtnTapped),for:.touchUpInside )
        return button
    }()
    init(delegate : ButtonActionDelegate) {
        super.init(frame: .zero )
        self.delegate = delegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        self.backgroundColor = .backgroundColl
        addSubViews()
        addConstarinsToUI()
    }
    private func addSubViews() {
        addSubview(image)
        addSubview(lable)
        addSubview(startbtn)
    }
    private func addConstarinsToUI() {
        image.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 200, paddingCenterX: 0, paddingCenterY: -70)
        
        lable.anchor(top: image.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        startbtn.anchor(top: lable.bottomAnchor, left:leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 16, paddingBottom: 0, paddingRight:16 ,width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}
