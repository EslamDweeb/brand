//
//  UIButtonExt.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
