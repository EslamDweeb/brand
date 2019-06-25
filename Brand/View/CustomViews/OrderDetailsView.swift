//
//  OrderDetailsView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit

class OrderDetailsView: UIView {
    
    
    lazy var namelabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Medium", size: 14)
        return label
    }()
   
    lazy var Pricelabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Medium", size: 14)
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
        namelabel.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        //namelabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.50).isActive = true
        Pricelabel.anchor(top: nil, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    
      
    }
}
