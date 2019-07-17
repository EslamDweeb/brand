//
//  OrderKeyLable.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/3/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class OrderKeyLable: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
       self.font = UIFont(name: .fontH, size: 12)
       self.textColor = .lightDarkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class OrderValueLable: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont(name: .fontM, size: 12)
        if MOLHLanguage.currentAppleLanguage() == "en" {
           self.textAlignment = .right
        }else {
            self.textAlignment = .left
        }
        self.textColor = #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5254901961, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
