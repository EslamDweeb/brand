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
import MOLH

class ReviewCell: UICollectionViewCell {
    
    var review:Ratingable? {
        didSet{
            guard let review = review else{return}
            let url = URL(string: review.subObjectMedia?.path ?? "")
            image.kf.setImage(with: url)
            rateView.rating = Double(review.value)
            brandName.text = review.object?.brand.name
            productName.text = review.objectName
            reviewLbl.text = review.review
            
        }
    }
    var editeBtnTapped: ( (_ review: Ratingable,_ flag:Bool) -> () )?
    
    lazy var containerView:ShadowView = {
        let view = ShadowView()
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
        img.image = #imageLiteral(resourceName: "defaultImage")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    lazy var brandName: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontH, size: 10)
        lbl.textColor = .blackColor
        return lbl
    }()
    lazy var productName: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontH, size: 12)
        lbl.numberOfLines = 2
        lbl.textColor = .blackColor
        return lbl
    }()
    lazy var reviewLbl: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontM, size: 10)
        lbl.numberOfLines = 2
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        return lbl
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    lazy var editeBtn: BtnImage = {
        let btn = BtnImage()
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
        containerView.addSubview(stackView)
        //containerView.addSubview(brandName)
        containerView.addSubview(productName)
        containerView.addSubview(editeBtn)
        //containerView.addSubview(rateView)
        containerView.addSubview(reviewLbl)
  if MOLHLanguage.currentAppleLanguage() == "en"{
        stackView.addArrangedSubview(brandName)
        stackView.addArrangedSubview(rateView)
  }else {
     stackView.addArrangedSubview(rateView)
      stackView.addArrangedSubview(brandName)
        }
    }
    private func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         reviewLbl.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
       
        if MOLHLanguage.currentAppleLanguage() == "en"{
            editeBtn.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 2, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
            image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            productName.anchor(top: containerView.topAnchor, left: image.rightAnchor   , bottom: nil, right: editeBtn.leftAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 12, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
             stackView.anchor(top: productName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 2, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
          //  brandName.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           
          //  rateView.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)

        }else{
            editeBtn.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
            image.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            productName.anchor(top: containerView.topAnchor, left: editeBtn.rightAnchor, bottom: nil, right: image.leftAnchor , centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 12, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
              stackView.anchor(top: productName.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 2, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
//            brandName.anchor(top: productName.bottomAnchor, left: nil, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
//            rateView.anchor(top: nil, left: nil, bottom: nil, right: brandName.leftAnchor, centerX: nil, centerY: brandName.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 40, height: 20, paddingCenterX: 0, paddingCenterY: 3)
          //  brandName.textAlignment = .right
           // productName.textAlignment = .right
        }
    }
    @objc func handelEditeTapped(){
        guard let review = review else{return}
        editeBtnTapped?(review,true)
    }
}
