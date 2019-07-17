//
//  CustomTabBar.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CustomTabBar: UIView {
    lazy var detainBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "infoCircleAnticon"), for: .normal)
        return btn
    }()
    lazy var specsBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "specsEmpty"), for: .normal)
        return btn
    }()
    lazy var reviewBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "areaChartAnticon"), for: .normal)
        return btn
    }()
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
//        stack.spacing = 5
//        stack.addArrangedSubview(priceLable)
//        stack.addArrangedSubview(discountLbl)
//        stack.addArrangedSubview(rateView)
//        stack.addArrangedSubview(numberOFReviewerLable)
        return stack
    }()
    
}
