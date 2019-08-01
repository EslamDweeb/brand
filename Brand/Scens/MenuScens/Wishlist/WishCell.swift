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
            brandName.text = con.brand?.name ?? ""
            if config?.isFavorite == false {
                let image = UIImage(named: "emptyHeart")
                favBtn.setImage(image, for: .normal)
            }else if config?.isFavorite == true{
                let image = UIImage(named: "filledHeart")
                favBtn.setImage(image, for: .normal)
            }
            if con.sale != 0  {
                priceLbl.setAttributeStringWithStrike("\(con.price)")
                discountLbl.text = "\(con.ReturnPricepersent(sale: Double(con.sale).roundToDecimal(3)))"
                discountPrice.text = "\(con.ReturnPriceAfterSale(price: (Double(priceLbl.text ?? "0") ?? 0), sale: Double(discountLbl.text ?? "0") ?? 0))"
            }else{
                 priceLbl.text = "\(con.price)"
                 priceLbl.textColor = .black
                 discountLbl.isHidden = true
                 discountPrice.isHidden = true
            }
        }
    }
    lazy var containerView:ShadowView = {
        let view = ShadowView()
        return view
    }()
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var brandName: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var productName: DescriptionLabel = {
        let lbl = DescriptionLabel()
        return lbl
    }()
    lazy var priceLbl: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.textColor = .lightDarkGray
        return lbl
    }()
    lazy var discountLbl: RoundedLable = {
        let lbl = RoundedLable()
        lbl.RoundedCorner = [.bottomRight,.topRight]
        lbl.radius = 5
        return lbl
    }()
    lazy var discountPrice: HeaderLabel = {
        let lbl = HeaderLabel()
        lbl.font = setFont(name: .fontH, size: 14)
        return lbl
    }()
    lazy var favBtn: UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "emptyHeart")
        btn.setImage(image, for: .normal)
        btn.addTarget(self, action: #selector(addToWishList), for: .touchUpInside)
        return btn
    }()
    var isFav = true
    @objc func addToWishList(){
        if isFav == false {
            let image = UIImage(named: "emptyHeart")
            favBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(named: "filledHeart")
            favBtn.setImage(image, for: .normal)
        }
        APIClient.toggleFav(id: config?.id ?? 0) { (result) in
            switch result {
            case.success(let data):
                print(data)
                self.isFav = !self.isFav
            case .failure(_):
                break
            }
        }
    }
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
        
        image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120, paddingCenterX: 0, paddingCenterY: 0)
        
        brandName.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        productName.anchor(top: brandName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)

        priceLbl.anchor(top: productName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountLbl.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        discountPrice.anchor(top: productName.bottomAnchor, left: priceLbl.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width:0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        cartBtn.anchor(top: nil, left: nil, bottom: image.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
    }
}

