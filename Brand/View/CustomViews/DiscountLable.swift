//
//  DiscountLable.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DiscountLable: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    private func setup() {
        font = UIFont(name: "Avenir-Heavy", size: 13)
        self.textColor = .white
        self.textAlignment = .center
        self.backgroundColor = .pink
        self.roundCorners(.allCorners, radius: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
