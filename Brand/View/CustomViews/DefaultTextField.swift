//
//  DefaultTextField.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class DefaultTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clearButtonMode = .whileEditing
        self.font = setFont(name: .fontM, size: 16)
        layer.borderWidth = 1
        layer.cornerRadius = 3
        layer.borderColor = UIColor.lightgray.cgColor
        setPadding(left: 16, right: 16)
//        if MOLHLanguage.currentAppleLanguage() == "en"{
//           self.textAlignment = .left
//        }else{
//            self.textAlignment = .right
//        }
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
       
    }
}
