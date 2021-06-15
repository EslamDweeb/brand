//
//  OrderBackgroundView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class OrderBackgroundView: ReviewBGView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image.image = #imageLiteral(resourceName: "iconsFinalMyOrdersEmptyState")
        self.lable.text = "Sorry you didn’t complete any order yet"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
