//
//  GradBtn.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DefaultButtom: UIButton {
    var Enabledd:Bool?
    
    init(enabledd : Bool? = nil ) {
        super.init(frame: .zero)
          self.Enabledd = enabledd ?? true
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup(){
        self.titleLabel?.font = setFont(name: .fontH, size: 20)
        setCornerRadius(radius: 3)
      
    }
}
class GradBtn  : DefaultButtom {
    
   override func setup(){
    
     self.setTitleColor( .white, for: .normal)
        if Enabledd ?? true  {
            self.backgroundColor = .pink
            self.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 1, shadowRaduis: 4)
            setCornerRadius(radius: 3)
            
        }else{
             setCornerRadius(radius: 3)
            self.backgroundColor = .lightgray
        }
    }
}

class borderColoredButtom : DefaultButtom {
    override  func setup() {
        self.layer.borderColor = UIColor.pink.cgColor
        self.setTitleColor( UIColor.pink, for: .normal)
        self.layer.borderWidth = 1
    }
}
class BtnImage : DefaultButtom {
  override  func setup() {
        self.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
