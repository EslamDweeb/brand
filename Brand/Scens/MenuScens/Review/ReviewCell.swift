//
//  ReviewCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class ReviewCell: UICollectionViewCell {
    
    var review:Ratingable? {
        didSet{
            guard let review = review else{return}
            
            rateView.rating = Double(review.value)
            brandName.text = review.object.brand.name
            productName.text = review.objectName
            reviewLbl.text = review.review
            
        }
    }
    var editeBtnTapped: ( (_ review: Ratingable) -> () )?
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.backgroundCell.cgColor
        view.backgroundColor = .white
        return view
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 14
        rate.settings.emptyBorderColor = .pink
        rate.settings.filledBorderColor = .pink
        rate.settings.emptyColor = .clear
        rate.settings.filledColor = .pink
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        return img
    }()
    lazy var brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 10)
        lbl.textColor = .black
        return lbl
    }()
    lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        return lbl
    }()
    lazy var reviewLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 10)
        lbl.numberOfLines = 2
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        return lbl
    }()
    lazy var editeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "modeEditMaterial"), for: .normal)
        btn.addTarget(self, action: #selector(handelEditeTapped), for: .touchUpInside)
        return btn
    }()
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
        containerView.addSubview(editeBtn)
        containerView.addSubview(rateView)
        containerView.addSubview(reviewLbl)
    }
    private func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        editeBtn.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
         productName.anchor(top: containerView.topAnchor, left: image.rightAnchor   , bottom: nil, right: editeBtn.leftAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 12, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        brandName.anchor(top: productName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 2, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        rateView.anchor(top: nil, left: brandName.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: brandName.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 3)
        reviewLbl.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
    }
    @objc func handelEditeTapped(){
        guard let review = review else{return}
        editeBtnTapped?(review)
    }
}
