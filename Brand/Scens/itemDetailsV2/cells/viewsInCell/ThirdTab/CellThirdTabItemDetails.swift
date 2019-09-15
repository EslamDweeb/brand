//
//  CellThirdTabItemDetails.swift
//  Brand
//
//  Created by iOS on 9/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class CellThirdTabItemDetails : UITableViewCell {
    
    
    var review:Ratingable? {
        didSet{
            guard let review = review else{return}
            let url = URL(string: review.userPhoto?.path ?? "")
            imageViewRound.kf.setImage(with: url)
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
    
    
    lazy var imageViewRound : RoundedImageView = {
       let i = RoundedImageView(frame: .zero )
        return i
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
        lbl.numberOfLines = 0
        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        lbl.textColor = .lightgray3
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        //        image.layer.cornerRadius = image.frame.width / 2
        //        image.clipsToBounds = true
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews(){
        contentView.addSubview(containerView)
        containerView.addSubview(imageViewRound)
        containerView.addSubview(nameLbl)
        containerView.addSubview(reviewLbl)
        containerView.addSubview(rateView)
    }
    
    private func addConstrainsToUI() {
        
        containerView.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingLeft: 16 , paddingRight: 16 )
        
        reviewLbl.anchor(top: imageViewRound.bottomAnchor, leading : containerView.leadingAnchor , bottom: containerView.bottomAnchor , trailing : containerView.trailingAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8 )
 
        imageViewRound.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor , paddingTop: 20 , paddingLeft: 5 , width: 75 , height: 75 )
        nameLbl.anchor(top: containerView.topAnchor , leading: imageViewRound.trailingAnchor , trailing: trailingAnchor , paddingTop: 20 , paddingLeft: 16 , paddingRight: 16 , height: 20 )
        rateView.anchor(top: nameLbl.bottomAnchor  , leading: imageViewRound.trailingAnchor ,  paddingTop: 8 , paddingLeft: 16 , paddingRight: 16 , width : 50  , height: 20 )

    }
    
    
}
