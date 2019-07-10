//
//  StringExt.swift
//  Brand
//
//  Created by nada dyaa on 7/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
import Foundation
import  UIKit
import MOLH
extension String {
    static let fontM  =  "Avenir-Medium"
    static let fontL  =  "Avenir-Light"
    static let fontH  =  "Avenir-Heavy"
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
    
    
}
