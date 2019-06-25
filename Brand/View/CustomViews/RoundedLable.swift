//
//  RoundedLable.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class RoundedLable: UILabel {
     var RoundedCorner:UIRectCorner?
     var radius:CGFloat?
     var backGroundColor: UIColor?
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(RoundedCorner!, radius: radius!)
    }
    override init(frame:CGRect) {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = backGroundColor
        self.textColor = .white
        self.font = UIFont(name: "Avenir-Medium", size: 9)
  
    }
}
