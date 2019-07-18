//
//  CustomTabBarButton.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CustomTabBarButton: UIView{
    lazy var iconImageView:UIImageView = {
       let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        return iconImageView
    }()
    lazy var titleLable:UILabel = {
        let iconImageView = UILabel()
        iconImageView.font = UIFont(name: "Avenir-Medium", size: 11)
        iconImageView.textColor = .lightgray4
        iconImageView.textAlignment = .center
        return iconImageView
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        setButtonDesign()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setButtonDesign(){
        addSubview(iconImageView)
        addSubview(titleLable)
        iconImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        titleLable.anchor(top: iconImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
    }
}
