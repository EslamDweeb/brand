//
//  CartCell.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher
import MOLH
import EasyTipView
class  CartCell: UITableViewCell {
    
//    var preferences = EasyTipView.Preferences()
//
//    preferences.drawing.font = UIFont(name: .fontM, size: 13)!
//    preferences.drawing.foregroundColor = UIColor.white
//    preferences.drawing.backgroundColor = .gray
//    EasyTipView.globalPreferences = preferences
//
    
    var cart: CartItem? {
        didSet {
            guard let cart = cart else{return}
            let url = URL(string: cart.config.mainPhoto?.path ?? "")
            Image.kf.indicatorType = .activity
            Image.kf.setImage(with: url)
            brandName.text = cart.config.brand?.name ??  ""
            productName.text = cart.config.name
            if cart.config.sale != 0 {
                discountLbl.text = cart.config.ReturnPricepersent(sale: cart.config.sale)
                discountPrice.text = "\(cart.config.ReturnTotalPriceAfterSale(price: Double(cart.itemOverallPrice), QTY: Double(cart.qty))) \("sar".localized)"
                priceLbl.setAttributeStringWithStrike("\(cart.config.price) \("sar".localized)")
            }else{
                discountLbl.isHidden = true
                discountPrice.text = "\(cart.config.price) \("sar".localized)"
                priceLbl.isHidden = true
            }
            QTY.text = "\("QTY".localized) \(cart.qty)"
//            if cart.qty != 0{
//                Out.isHidden = true
//            }else if cart.qty < Int(QTY.text ?? "0") ?? 0{
//                Out.text = "exceeded".localized
//            }
            if Int(cart.config.qty )! < cart.qty {
                 Out.isHidden = false
                 Out.text = "exceeded".localized
            }else {
                 Out.isHidden = true
            }
        }
    }
    
    lazy var containerView:ShadowView = {
        let view = ShadowView()
        return view
    }()
    lazy var infoBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "group3"), for: .normal)
       // btn.addTarget(self, action: #selector(handelinfoTapped), for: .touchUpInside)
        return btn
    }()
    lazy var Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        img.contentMode = .scaleToFill
        return img
    }()
    lazy var brandName: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontM, size: 12)
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var productName: HeaderLabelAlign = {
        let lbl = HeaderLabelAlign()
        lbl.font = UIFont(name: .fontH, size: 12)
        lbl.numberOfLines = 2
        return lbl
    }()
    lazy var priceLbl: HeaderLabelAlign = {
        let lbl = HeaderLabelAlign()
        lbl.font = UIFont(name: .fontM, size: 13)
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var discountLbl: DiscountLable = {
        let lbl = DiscountLable()
        return lbl
    }()
    lazy var discountPrice: HeaderLabelAlign = {
        let lbl = HeaderLabelAlign()
        lbl.font = UIFont(name: .fontH, size: 14)
        return lbl
    }()
    lazy var QTY: HeaderLabelAlign = {
        let lbl = HeaderLabelAlign()
        lbl.font = UIFont(name: .fontH, size: 14)
        return lbl
    }()
    lazy var Out: HeaderLabelAlign = {
        let lbl = HeaderLabelAlign()
        lbl.font = UIFont(name: .fontH, size: 14)
        lbl.textColor = #colorLiteral(red: 0.9814127088, green: 0.4449456334, blue: 0.8044757247, alpha: 1)
        lbl.text = "Outofstock".localized
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup(){
        
        backgroundColor = .backgroundColl
        contentView.backgroundColor = .backgroundColl
        
        contentView.addSubview(containerView)
        containerView.addSubview(Image)
        containerView.addSubview(brandName)
        containerView.addSubview(productName)
        containerView.addSubview(priceLbl)
        containerView.addSubview(discountLbl)
        containerView.addSubview(QTY)
        containerView.addSubview(discountPrice)
        containerView.addSubview(infoBtn)
        containerView.addSubview(Out)
        
        
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        containerView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        if MOLHLanguage.currentAppleLanguage() == "en" {
        Image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, centerX: nil, centerY: containerView.centerYAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 80, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        brandName.anchor(top: containerView.topAnchor, left: Image.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 50, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        productName.anchor(top: brandName.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        priceLbl.anchor(top: productName.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        discountLbl.anchor(top: productName.bottomAnchor, left: priceLbl.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLbl.centerYAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        QTY.anchor(top: priceLbl.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 150, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Out.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: QTY.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        discountPrice.anchor(top: QTY.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 200, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        infoBtn.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: discountPrice.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            Image.anchor(top: containerView.topAnchor, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: containerView.centerYAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 8, width: 80, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            brandName.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: Image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 50, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            productName.anchor(top: brandName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: Image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            priceLbl.anchor(top: productName.bottomAnchor, left: nil, bottom: nil, right: Image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            discountLbl.anchor(top: productName.bottomAnchor, left: nil, bottom: nil, right: priceLbl.leftAnchor, centerX: nil, centerY: priceLbl.centerYAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            QTY.anchor(top: priceLbl.bottomAnchor, left: nil, bottom: nil, right: Image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 150, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Out.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: QTY.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            discountPrice.anchor(top: QTY.bottomAnchor, left: nil, bottom: nil, right: Image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 200, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            infoBtn.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: discountPrice.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            
        }
        
    }
//    @objc func handelinfoTapped(){
//        
//    }
}
