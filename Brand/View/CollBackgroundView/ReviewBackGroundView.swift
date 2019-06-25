//
//  ReviewBackGroundView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ReviewBGView: UIView {
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconsFinalMyReviewsEmptyState")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lable:UILabel = {
        let lbl = UILabel()
        lbl.text = "Sorry you didn’t add any reviews yet"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        lbl.font = UIFont(name: "Avenir-Medium", size: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        self.backgroundColor = .backgroundCell
        addSubViews()
        addConstarinsToUI()
    }
    private func addSubViews() {
        addSubview(image)
        addSubview(lable)
    }
    private func addConstarinsToUI() {
        image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 200, paddingCenterX: 0, paddingCenterY: -70)
        
        lable.anchor(top: image.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
    }
}
