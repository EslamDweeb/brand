//
//  DefaultTextField.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DefaultTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.cornerRadius = 3
        layer.borderColor = UIColor.lightgray.cgColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
