//
//  textFieldExt.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
extension UITextField {
    
    func setPadding( left: CGFloat? = nil, right: CGFloat? = nil){
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        if let right = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    func isValidEmail(_ email: String?) -> Bool {
         guard email != nil else { return false }
        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    // at least one uppercase,
    // at least one digit
    // at least one lowercase
    // 8 characters total
    //(?=.*[A-Z])
    //(?=.*[a-z])
    func isValidPassword(_ password: String?) -> Bool {
        guard password != nil else { return false }
        if password!.count < 6 {
            return false
        }else{
            return true
        }
    }
    func isValidPhone(_ password: String?) -> Bool {
        guard password != nil else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","[0-9]{9,14}")
        return passwordTest.evaluate(with: password)
    }
    func isValidLastName(_ lastName: String?) -> Bool {
        guard lastName != nil else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Za-zء-ي]).{3,}")
        return passwordTest.evaluate(with: lastName)
    }
//    func isValidPostal(_ Postal: String?) -> Bool {
//        guard Postal != nil else { return false }
//        let PostalTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9]).{5,5}")
//        return PostalTest.evaluate(with: Postal)
//    }
//    func isValidlatlng(_ latlng: String?) -> Bool {
//        guard latlng != nil else { return false }
//        let latlngTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9]).{,}")
//        return latlngTest.evaluate(with: latlng)
//    }
}
