//
//  MenuCell.swift
//  Al_Ula
//
//  Created by Eslam Dweeb on 5/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class MenuCell:UITableViewCell{
    
    lazy var icon:UIImageView = {
       let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "")
        return icon
    }()
    lazy var titleLabel:UILabel = {
       let lable = UILabel()
        lable.textColor = .darkGray
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
//        if Language.currentLanguage() == "ar"{
//            lable.textAlignment = .right
//        }else{
//            lable.textAlignment = .right
//        }
        lable.text = "saasas"
        return lable
    }()
    lazy var ContainerView:UIView = {
      let v = UIView()
        v.setCornerRadius(radius: 5)
        v.backgroundColor = .pink
        v.isHidden = true
        v.addSubview(lable)
        return v
    }()
    lazy var lable:UILabel = {
       let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .center
        if MOLHLanguage.currentAppleLanguage() == "en"{
            lable.text = "ar"
        }else{
            lable.text = "en"
        }
        return lable
    }()
    lazy var lineView:UIView = {
        let v = UIView()
        v.backgroundColor = .lightgray3
        return v
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if MOLHLanguage.currentAppleLanguage() == "ar"{
            titleLabel.textAlignment = .right
        }else{
            titleLabel.textAlignment = .left
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView(){
         addSubViews()
        addConstrainsToView()
    }
    private func addSubViews(){
        addSubview(icon)
        addSubview(titleLabel)
        addSubview(ContainerView)
        ContainerView.addSubview(lable)
        addSubview(lineView)
//        self.bringSubviewToFront(lable)
//        self.sendSubviewToBack(ContainerView)
    }
    private func addConstrainsToView() {
        if MOLHLanguage.currentAppleLanguage() == "en" {
            icon.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 25, height: 25, paddingCenterX: 0, paddingCenterY: 0)
            titleLabel.anchor(top: nil, left: icon.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
            ContainerView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 25, paddingCenterX: 0, paddingCenterY: 0)
            lable.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: ContainerView.centerXAnchor, centerY: ContainerView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             lineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            icon.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 25, height: 25, paddingCenterX: 0, paddingCenterY: 0)
            titleLabel.anchor(top: nil, left:nil, bottom: nil, right: icon.leftAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
            ContainerView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 45, height: 25, paddingCenterX: 0, paddingCenterY: 0)
            lable.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: ContainerView.centerXAnchor, centerY: ContainerView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
              lineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
        }
     }
}
