//
//  CheckoutProductView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class productCheckout: UIView {
    
    
    lazy var namelabel:DescriptionLabel12 = {
        let label = DescriptionLabel12()
        return label
    }()
    lazy var Qlabel:DescriptionLabel12 = {
        let label = DescriptionLabel12()
        label.textAlignment = .center
        return label
    }()
    lazy var Pricelabel:DescriptionLabel12 = {
        let label = DescriptionLabel12()
//        label.textColor = .black
        label.textAlignment = .center
//        label.font = UIFont(name: "Avenir-Medium", size: 12)
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
        addSubview(Qlabel)
        addSubview(Pricelabel)
    }
    private func setup(){
        if MOLHLanguage.currentAppleLanguage() == "en" {
            namelabel.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: Qlabel.leftAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            //namelabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.50).isActive = true
            Pricelabel.anchor(top: nil, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Pricelabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.27).isActive = true
            Qlabel.anchor(top: nil, left: nil, bottom: nil, right: Pricelabel.leftAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Qlabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.13).isActive = true
        }else{
            namelabel.anchor(top: nil, left: Qlabel.rightAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            //namelabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.50).isActive = true
            Pricelabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Pricelabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.27).isActive = true
            Qlabel.anchor(top: nil, left: Pricelabel.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            Qlabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.13).isActive = true
        }
    }
}
