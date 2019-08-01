//
//  ShadowView.swift
//  Brand
//
//  Created by nada dyaa on 7/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit

class ShadowView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        self.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        self.clipsToBounds = true
    }
    
    
    
}
