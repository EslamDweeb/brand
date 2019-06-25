//
//  FlashCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FlashCell:UICollectionViewCell {
    
    var flash:FlashSale? {
        didSet {
            guard let flash = flash else{return}
            image.image = flash.image
            timeLbl.text = flash.time
            discountLbl.text = flash.discountVal
            productName.text = flash.productName
            if flash.quant == 0 {
                soldView.isHidden = false
            }
        }
    }
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.backgroundCell.cgColor
        view.backgroundColor = .white
        return view
    }()
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        return img
    }()
    lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.textColor = .black
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    lazy var discountLbl: RoundedLable = {
        let lbl = RoundedLable()
          lbl.textAlignment = .center
          lbl.radius = 5
          lbl.RoundedCorner = [UIRectCorner.bottomRight,UIRectCorner.topRight]
          lbl.backGroundColor = .pink
        return lbl
    }()
    lazy var timeLbl: RoundedLable = {
        let lbl = RoundedLable()
        lbl.textAlignment = .center
        lbl.backGroundColor = .discountColor
        lbl.radius = 5
        lbl.RoundedCorner = [UIRectCorner.bottomLeft,UIRectCorner.topLeft]
        return lbl
    }()
    lazy var soldView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
        v.layer.cornerRadius = 5
        v.isHidden = true
        return v
    }()
    lazy var soldlbl: UILabel = {
        let v = UILabel()
        v.textColor = .white
        v.text = "Sold out"
        v.font = UIFont(name: "Avenir-Medium", size: 24)
        v.textAlignment = .center
        v.setShadow(shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 5), shadowOpacity: 0.8, shadowRaduis: 1)
        return v
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(productName)
        containerView.addSubview(discountLbl)
        containerView.addSubview(timeLbl)
        contentView.addSubview(soldView)
        soldView.addSubview(soldlbl)
    }
    private  func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil
            , centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        discountLbl.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 45, height: 18, paddingCenterX: 0, paddingCenterY: 0)
          timeLbl.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 2, width: 45, height: 18, paddingCenterX: 0, paddingCenterY: 0)
        image.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 32, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 145, height: 145, paddingCenterX: 0, paddingCenterY: 0)
        productName.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        soldView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil
            , centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        soldlbl.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: soldView.centerXAnchor, centerY: soldView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 35, paddingCenterX: 0, paddingCenterY: 0)
    }
}
