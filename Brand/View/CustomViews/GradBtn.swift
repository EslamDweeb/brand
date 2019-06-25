//
//  GradBtn.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class GradBtn: UIButton {
    var Enabledd:Bool?

    init(enabledd : Bool? = nil ) {
        super.init(frame: .zero)
        Enabledd = enabledd ?? true
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup(){
        
        setCornerRadius(radius: 3)
        
        if Enabledd ?? true  {
            self.backgroundColor = .pink
        self.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 1, shadowRaduis: 4)
        }else{
             self.backgroundColor = .lightgray
        }
    }
}

