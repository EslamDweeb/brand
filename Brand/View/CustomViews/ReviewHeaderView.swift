//
//  ReviewHeaderView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos
import MOLH
import Kingfisher
class ReviewHeaderView: UIView {
    var brandNameHeight:NSLayoutConstraint?
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
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
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.starSize = 25
        rate.settings.filledImage = #imageLiteral(resourceName: "emptyStar")
        rate.settings.emptyImage = #imageLiteral(resourceName: "fill")
        rate.settings.starMargin = 2
        rate.settings.fillMode = StarFillMode.half
        return rate
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 0.161286387)
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
        if MOLHLanguage.currentAppleLanguage() == "en" {
            image.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            productName.anchor(top: topAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 80, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
            brandName.anchor(top: productName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
          rateView.anchor(top: brandName.bottomAnchor, left: image.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width:50, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            image.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 75, height: 75, paddingCenterX: 0, paddingCenterY: 0)
            productName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 80, paddingBottom: 0, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
            brandName.anchor(top: productName.bottomAnchor, left: nil, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
//            setBrandName()
            brandName.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
            rateView.anchor(top: brandName.bottomAnchor, left: nil, bottom: nil, right: image.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width:50, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        }
    }
    func setDataToView(_ BrandName:String,_ ProductName:String, _ RateValue:Double,_ imagePath:String?){
        self.brandName.text = BrandName
        self.productName.text = ProductName
        self.rateView.rating = RateValue
        if imagePath != nil {
            let url = URL(string: imagePath!)
            self.image.kf.setImage(with: url)
            setBrandName()
        }
    }
    func setBrandName(){
        if brandName.text != nil && brandName.text != ""{
            brandNameHeight = brandName.heightAnchor.constraint(equalToConstant: 20)
            brandNameHeight?.isActive = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }else{
            brandNameHeight = brandName.heightAnchor.constraint(equalToConstant: 0)
            brandNameHeight?.isActive = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
}
