//
//  OrderDetailsView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
import MOLH

class OrderDetailsView: UIView {
    
    
    lazy var namelabel:DescriptionLabel12 = {
        let label = DescriptionLabel12()
     //   label.textColor =  .lightGray
        return label
    }()
   
    lazy var Pricelabel:DescriptionLabel12 = {
        let label = DescriptionLabel12()
      //   label.textColor =  .lightGray
        return label
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        setup()
    }
    private func addSubViews(){
        addSubview(namelabel)
       addSubview(Pricelabel)
    }
    private func setup(){
        if MOLHLanguage.currentAppleLanguage() == "en" {
        namelabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Pricelabel.anchor(top: nil, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Pricelabel.textAlignment = .right
            namelabel.textAlignment = .left
        }else{
            namelabel.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Pricelabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Pricelabel.textAlignment = .left
            namelabel.textAlignment = .right
        }
      
    }
}
