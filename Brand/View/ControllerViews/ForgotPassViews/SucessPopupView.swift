//
//  SucessPopupView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SuccessPopupView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCornerRadius(radius: 3)
        return view
    }()
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "iconsFinalPasswordResetSuccessfully")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    lazy var lable:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("password_has_been_reset_successfully", comment: "")
        lable.textColor = .lightgray
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        return lable
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
        containerView.addSubview(logoImage)
        containerView.addSubview(lable)
        containerView.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        logoImage.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 140, paddingCenterX: 0, paddingCenterY: -20)
        lable.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 10, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}
