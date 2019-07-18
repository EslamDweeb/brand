//
//  CustomTabBar.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CustomTabBar: UIView {
    
    lazy var detailnBtn:CustomTabBarButton = {
        let btn = CustomTabBarButton()
        btn.iconImageView.image = #imageLiteral(resourceName: "infoCircleAnticon")
        btn.titleLable.text = "Details"
        return btn
    }()
    lazy var specsBtn:CustomTabBarButton = {
        let btn = CustomTabBarButton()
        btn.iconImageView.image = #imageLiteral(resourceName: "specsEmpty")
        btn.titleLable.text = "Specs"
        return btn
    }()
    lazy var reviewBtn:CustomTabBarButton = {
        let btn = CustomTabBarButton()
        btn.iconImageView.image = #imageLiteral(resourceName: "areaChartAnticon")
        btn.titleLable.text = "Review"
        return btn
    }()
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.addArrangedSubview(detailnBtn)
        stack.addArrangedSubview(specsBtn)
        stack.addArrangedSubview(reviewBtn)
        return stack
    }()
    lazy var favBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
        return btn
    }()
    lazy var cartBtn:UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "cart22")
        btn.setImage(image, for: .normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubViews()
        addConstraintsToViews()
    }
    private func addSubViews(){
        addSubview(stackView)
        addSubview(favBtn)
        addSubview(cartBtn)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setShadowAndBoreder()
    }
    private func addConstraintsToViews(){
        detailnBtn.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        stackView.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        cartBtn.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: -24, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 48, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        favBtn.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: -24, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 48, height: 48, paddingCenterX: 0, paddingCenterY: 0)
        
    }
    private func setShadowAndBoreder(){
        self.setShadow(shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.1, shadowRaduis: 2)
        self.backgroundColor = .white
    }
}
