//
//  UIlabel_EXt.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension UILabel{
    func setAttributeStringWithStrike(_ title:String){
        let attributeString = NSMutableAttributedString(string: title)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        self.attributedText = attributeString
    }
}
