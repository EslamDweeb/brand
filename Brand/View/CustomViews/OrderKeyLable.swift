//
//  OrderKeyLable.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/3/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class OrderKeyLable:UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
       self.font = UIFont(name: "Avenir-Heavy", size: 14)
       self.text = "Status"
       self.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
