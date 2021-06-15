//
//  ThirdCellReviewCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/25/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher
import MOLH

class ThirdCellReviewCell:UICollectionViewCell{
    var review:Ratingable? {
        didSet{
            guard let review = review else{return}
            let url = URL(string: review.userPhoto?.path ?? "")
            image.kf.setImage(with: url)
            rateView.rating = Double(review.value)
            nameLbl.text = review.userFullName
            reviewLbl.text = review.review
        }
    }
    lazy var containerView:ShadowView = {
        let view = ShadowView()
        return view
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 14
        rate.settings.emptyImage = #imageLiteral(resourceName: "fill")
        rate.settings.filledImage = #imageLiteral(resourceName: "emptyStar")
        rate.settings.filledColor = .pink
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
    lazy var image: RoundedImageView = {
        let img = RoundedImageView(frame: .zero)
//        img.image = #imageLiteral(resourceName: "XSMax")
//        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var nameLbl: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontM, size: 15)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        return lbl
    }()
    lazy var reviewLbl: DescriptionLabel = {
        let lbl = DescriptionLabel()
        lbl.font = UIFont(name: .fontM, size: 13)
        lbl.numberOfLines = 2
        lbl.textColor = .lightgray3
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setup(){
//        image.layer.cornerRadius = image.frame.width / 2
//        image.clipsToBounds = true
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews(){
        contentView.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(nameLbl)
        containerView.addSubview(reviewLbl)
       containerView.addSubview(rateView)
    }
    private func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        reviewLbl.anchor(top: image.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        
        if MOLHLanguage.currentAppleLanguage() == "en"{
            image.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            nameLbl.anchor(top: containerView.topAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            rateView.anchor(top: nameLbl.bottomAnchor, left: image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            image.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            nameLbl.anchor(top: containerView.topAnchor, left: leftAnchor, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            rateView.anchor(top: nameLbl.bottomAnchor, left: nil, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }
    }
}
