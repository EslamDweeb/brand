//
//  customLabels.swift
//  Brand
//
//  Created by nada dyaa on 7/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
import MOLH
class DefaultLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font =  self.setFont(name: .fontM, size: 16)
        self.textAlignment = .center
        self.textColor = UIColor.blackColor
       // self.numberOfLines = 0
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
    }
    
}
class HeaderLabel : DefaultLabel {
    
    override func setup() {
       self.numberOfLines = 0
        self.font =  self.setFont(name: .fontH, size: 16)
    }
    
}
class HeaderLabelAlign : DefaultLabel {
    
    override func setup() {
        self.numberOfLines = 0
        self.font =  self.setFont(name: .fontH, size: 16)
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            textAlignment = .right
        }else{
            textAlignment = .left
        }
    }
    
}
class titleLabel : DefaultLabel {
    
    override func setup() {
        self.font =  self.setFont(name: .fontH, size: 18)
        self.textColor = UIColor.white
        
    }
    
}
class DescriptionLabel : DefaultLabel {
    
    override func setup() {
        self.font =  self.setFont(name: .fontM, size: 14)
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            textAlignment = .right
        }else{
        textAlignment = .left
        }
    }
    
}
class DescriptionLabel12 : DefaultLabel {
    
    override func setup() {
        self.font =  self.setFont(name: .fontM, size: 12)
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            textAlignment = .right
        }else{
            textAlignment = .left
        }
    }
    
}

