//
//  Fonts.swift
//  Al_Ula
//
//  Created by iOS on 8/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class Fonts {
    
    private enum FontName : String {
        case arLight = "NeoSansArabic-Light"
        case arMedium = "NeoSansArabic-Medium"
        case arSemiBold = "NeoSansArabic"
//        case arBold = "NeoSansArabic-Bold"
//        case arBlack = "NeoSansArabic-Black"
        case enLight = "Avenir-Light"
        case enMedium = "Avenir-Medium"
        case enSemiBold = "Avenir-Heavy"
//        case enBold = "Avenir-Heavy"
//        case enBlack = "Avenir-Heavy"
    }
    
    private static func arLight (size : CGFloat ) -> UIFont {
        guard let customFont = UIFont(name: FontName.arLight.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    private static func enLight (size : CGFloat ) -> UIFont {
        guard let customFont = UIFont(name: FontName.enLight.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    
    private static func arMedium (size : CGFloat) -> UIFont {
        guard let customFont = UIFont(name: FontName.arMedium.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    private static func enMedium (size : CGFloat  ) -> UIFont {
        guard let customFont = UIFont(name: FontName.enMedium.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    private static func arSemiBold (size : CGFloat  ) -> UIFont {
        guard let customFont = UIFont(name: FontName.arSemiBold.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    private static func enSemiBold (size : CGFloat ) -> UIFont {
        guard let customFont = UIFont(name: FontName.enSemiBold.rawValue , size: size ) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
//    private static func arBold (size : CGFloat  ) -> UIFont {
//        guard let customFont = UIFont(name: FontName.arBold.rawValue , size: size ) else {
//            return UIFont.systemFont(ofSize: size)
//        }
//        return UIFontMetrics.default.scaledFont(for: customFont)
//    }
//
//    private static func enBold (size : CGFloat ) -> UIFont {
//        guard let customFont = UIFont(name: FontName.enBold.rawValue , size: size ) else {
//            return UIFont.systemFont(ofSize: size)
//        }
//        return UIFontMetrics.default.scaledFont(for: customFont)
//    }
    
//    private static func arBlack (size : CGFloat ) -> UIFont {
//        guard let customFont = UIFont(name: FontName.arBlack.rawValue , size: size ) else {
//            return UIFont.systemFont(ofSize: size)
//        }
//        return UIFontMetrics.default.scaledFont(for: customFont)
//    }
//
//    private static func enBlack (size : CGFloat ) -> UIFont {
//        guard let customFont = UIFont(name: FontName.enBlack.rawValue , size: size ) else {
//            return UIFont.systemFont(ofSize: size)
//        }
//        return UIFontMetrics.default.scaledFont(for: customFont)
//    }
//
    
    static func fontLight (size : CGFloat = UIFont.labelFontSize) -> UIFont {
        if MOLHLanguage.currentAppleLanguage().contains("en") {
            return enLight(size: size)
        }else {
            return arLight(size: size)
        }
    }
    
    static func fontMedium (size : CGFloat = UIFont.labelFontSize) -> UIFont {
        if MOLHLanguage.currentAppleLanguage().contains("en") {
            return enMedium(size: size)
        }else {
            return arMedium(size: size)
        }
    }
    
    static func fontSemiBold (size : CGFloat = UIFont.labelFontSize) -> UIFont {
        if MOLHLanguage.currentAppleLanguage().contains("en") {
            return enSemiBold(size: size )
        }else {
            return arSemiBold(size: size)
        }
    }
    
//    static func fontBold (size : CGFloat = UIFont.labelFontSize) -> UIFont {
//        if MOLHLanguage.currentAppleLanguage().contains("en") {
//            return enBold(size: size )
//        }else {
//            return arBold(size: size )
//        }
//    }
//    
//    static func fontBlack (size : CGFloat = UIFont.labelFontSize) -> UIFont {
//        if MOLHLanguage.currentAppleLanguage().contains("en") {
//            return enBlack(size: size)
//        }else {
//            return arBold(size: size )
//        }
//    }
//    
}
