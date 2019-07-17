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
        lbl.text = "opps! Your cart is empty"
        lbl.textAlignment = .center
        return lbl
    }()
    lazy var startbtn: GradBtn = {
        let button = GradBtn()
        button.setTitle("Start shopping".localized, for: .normal)
        return button
    }()
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
        startbtn.anchor(top: lable.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight:0, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}
