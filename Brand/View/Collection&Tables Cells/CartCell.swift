//
//  CartCell.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class  CartCell: UITableViewCell {
    
    var cart: Cart? {
        didSet {
            guard let cart = cart else{return}
            Image.image = cart.image
            brandName.text = cart.brandName
            productName.text = cart.productName
            discountPrice.text = cart.priceSAR
            discountLbl.text = cart.DisCount
            let disPrice = NSMutableAttributedString(string: cart.lastprice)
            disPrice.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.lightGray], range: NSRange(location: 0, length: disPrice.length))
            priceLbl.attributedText = disPrice
            QTY.text = cart.QTY
            if cart.outStack == true{
                Out.isHidden = false
            }else{
                Out.isHidden = true
            }
            }
        }

    lazy var containerView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return view
    }()
    lazy var infoBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "group3"), for: .normal)
        btn.addTarget(self, action: #selector(handelinfoTapped), for: .touchUpInside)
        return btn
    }()
    lazy var Image: UIImageView = {
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
        lbl.textAlignment = .left
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
    lazy var QTY: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.textColor = .black
        return lbl
    }()
    lazy var Out: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.textColor = #colorLiteral(red: 0.9814127088, green: 0.4449456334, blue: 0.8044757247, alpha: 1)
        lbl.text = "Out of stock"
        lbl.textAlignment = .right
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
        Image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, centerX: nil, centerY: containerView.centerYAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 80, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        brandName.anchor(top: containerView.topAnchor, left: Image.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 50, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        productName.anchor(top: brandName.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        priceLbl.anchor(top: productName.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         discountLbl.anchor(top: productName.bottomAnchor, left: priceLbl.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLbl.centerYAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        QTY.anchor(top: priceLbl.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 150, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Out.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: QTY.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         discountPrice.anchor(top: QTY.bottomAnchor, left: Image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 200, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         infoBtn.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: discountPrice.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
       
    }
    @objc func handelinfoTapped(){
      
    }
}
