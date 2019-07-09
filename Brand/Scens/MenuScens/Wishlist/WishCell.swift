//
//  WishCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher
class WishCell: UICollectionViewCell {
    
    var config:Config? {
        didSet{
            guard let con = config else{return}
            let url = URL(string:con.mainPhoto?.path ?? "")
            image.kf.setImage(with: url)
            productName.text = con.name
            brandName.text = con.brandName
            if con.sale != 0  {
                priceLbl.setAttributeStringWithStrike("\(con.price)")
                discountLbl.text = "\(Double(con.sale).roundToDecimal(3))"
                discountPrice.text = "\(con.ReturnPriceAfterSale(price: (Double(priceLbl.text ?? "0"))!, sale: Double(discountLbl.text ?? "0")!))"
            }else{
                 priceLbl.text = "\(con.price)"
                 priceLbl.textColor = .black
                 discountLbl.isHidden = true
                 discountPrice.isHidden = true
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
        img.contentMode = .scaleAspectFit 
        return img
    }()
    lazy var brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        return lbl
    }()
    lazy var priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Light", size: 13)
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var discountLbl: RoundedLable = {
        let lbl = RoundedLable()
        lbl.RoundedCorner = [.bottomRight,.topRight]
        lbl.radius = 5
        return lbl
    }()
    lazy var discountPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.textColor = .black
        return lbl
    }()
    lazy var favBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "invalidName"), for: .normal)
        //btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        return btn
    }()
    lazy var cartBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "add-to-the-cart"), for: .normal)
        return btn
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstrainsToUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setup(){
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews(){
      contentView.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(brandName)
         containerView.addSubview(productName)
         containerView.addSubview(priceLbl)
         containerView.addSubview(discountLbl)
        containerView.addSubview(discountPrice)
         containerView.addSubview(favBtn)
         containerView.addSubview(cartBtn)
    }
    private func addConstrainsToUI() {
        containerView.setShadow(shadowColor: #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 0.3), shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.5, shadowRaduis: 2)
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        favBtn.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        
        image.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120, paddingCenterX: 0, paddingCenterY: 0)
        
        brandName.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        productName.anchor(top: brandName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)

        priceLbl.anchor(top: productName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountLbl.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountPrice.anchor(top: productName.bottomAnchor, left: priceLbl.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width:0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        cartBtn.anchor(top: image.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: -8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}

