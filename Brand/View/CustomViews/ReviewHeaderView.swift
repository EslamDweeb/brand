//
//  ReviewHeaderView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class ReviewHeaderView: UIView {
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        return img
    }()
    lazy var brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 10)
        lbl.text = "Apple"
        lbl.textColor = .black
        return lbl
    }()
    lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.text = "iPhone XS Max all colors 64 GB 4G LTE"
        lbl.numberOfLines = 2
        lbl.textColor = .black
        return lbl
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 25
        rate.settings.emptyBorderColor = .pink
        rate.settings.filledBorderColor = .pink
        rate.settings.emptyColor = .clear
        rate.settings.filledColor = .pink
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.161286387)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
        addSubview(image)
        addSubview(productName)
        addSubview(brandName)
        addSubview(rateView)
    }
    private func addConstrainsToUI() {
        image.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
        productName.anchor(top: topAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 80, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        brandName.anchor(top: productName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        rateView.anchor(top: brandName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 80, width:0, height: 25, paddingCenterX: 0, paddingCenterY: 0)
    }
}
