//
//  GradNavView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class GradNavView: UIView {
    
    lazy var searchBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "search - anticon"), for: .normal)
        button.isHidden = true
        return button
    }()
    lazy var titlelabel:titleLabel = {
        let label = titleLabel()
        return label
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        setup()
    }
    private func addSubViews(){
        addSubview(titlelabel)
        addSubview(searchBtn)
        addSubview(backBtn)
    }
    private func setup(){
       self.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 0), location: [0,0.5,1])
        titlelabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        titlelabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        if MOLHLanguage.currentAppleLanguage() == "en"{
            backBtn.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 16, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
            searchBtn.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 20, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            backBtn.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        }else{
            backBtn.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight:10, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
            searchBtn.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 16, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            backBtn.setImage(#imageLiteral(resourceName: "arrow-back-rtl"), for: .normal)
        }
        
    }
}
