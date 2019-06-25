//
//  WishCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class WishCell: UICollectionViewCell {
    var wishe:Wishes? {
        didSet{
            guard let wishe = wishe else{return}
            image.image = wishe.image
            brandName.text = wishe.brandName
            productName.text = wishe.productName
            discountPrice.text = wishe.discountPrice
            discountLbl.text = wishe.disountVal
            let disPrice = NSMutableAttributedString(string: wishe.price)
               disPrice.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.lightGray], range: NSRange(location: 0, length: disPrice.length))
            priceLbl.attributedText = disPrice
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
    lazy var brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.textColor = .lightgray
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
        lbl.textColor = .lightgray
        return lbl
    }()
    lazy var discountLbl: DiscountLable = {
        let lbl = DiscountLable()
        return lbl
    }()
    lazy var discountPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.textColor = .black
        return lbl
    }()
    lazy var trendingLbl: RoundedLable = {
        let lbl = RoundedLable()
        lbl.radius = 5
        lbl.backGroundColor = .pink
        lbl.RoundedCorner = [UIRectCorner.topRight,UIRectCorner.bottomRight]
       lbl.text = "Trending"
        return lbl
    }()
    lazy var favBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "invalidName"), for: .normal)
        return btn
    }()
    lazy var cartBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "addToTheCart"), for: .normal)
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
         containerView.addSubview(trendingLbl)
        containerView.addSubview(discountPrice)
         containerView.addSubview(favBtn)
         containerView.addSubview(cartBtn)
    }
    private func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        favBtn.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 15, height: 15, paddingCenterX: 0, paddingCenterY: 0)
        
        image.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 145, height: 145, paddingCenterX: 0, paddingCenterY: 0)
        
        trendingLbl.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 1, paddingBottom: 0, paddingRight: 0, width: 44, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        brandName.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        productName.anchor(top: brandName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
        
        priceLbl.anchor(top: productName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountLbl.anchor(top: productName.bottomAnchor, left: priceLbl.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountPrice.anchor(top: priceLbl.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        cartBtn.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: discountPrice.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}

