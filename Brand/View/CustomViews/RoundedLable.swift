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
        self.backgroundColor = .pink
        self.textColor = .white
        self.textAlignment = .center
        self.font = UIFont(name: .fontL, size: 12)
  
    }
    
}
