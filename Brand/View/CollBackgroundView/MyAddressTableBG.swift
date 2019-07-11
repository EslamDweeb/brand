//
//  MyAddressTableBG.swift
//  Brands
//
//  Created by nada dyaa on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class MyAddressTableBG : UIView{
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconsFinalMyAddressesEmptyState")
        img.contentMode = .scaleAspectFit
        return img
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    lazy var lable:DefaultLabel = {
        let lbl = DefaultLabel()
        lbl.text = "didn’t_have_Address".localized
        return lbl
    }()
    lazy var addbtn: GradBtn = {
        let button = GradBtn()
        button.setTitle("New Address".localized, for: .normal)
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
        addSubview(addbtn)
        
    }
    private func addConstarinsToUI() {
        image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 200, paddingCenterX: 0, paddingCenterY: -70)
        
        lable.anchor(top: image.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: self.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addbtn.anchor(top: lable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: self.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        addbtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        addbtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
    }
}
