
//
//  shippingMethodCell.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit

class ShippingMethodCell : UICollectionViewCell {
    var name : ShippingMethod? {
        didSet{
            guard let name = name
                else {return}
            namelbl.text = name.name
            
        }
    }
    lazy var view: ShadowView = {
        let view = ShadowView()
        return view
    }()
    
    lazy var Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash01")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var namelbl : DescriptionLabel12 = {
        let lbl = DescriptionLabel12()
        lbl.textAlignment = .center
        lbl.textColor = UIColor.lightGray
        return lbl
    }()
    lazy var defaultview: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.isHidden = true
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    func SetupView()  {
        addSetupViews()
        addSetupComstrains()
    }
    func addSetupViews()  {
        
        //self.layer.borderWidth = 1
        view.addSubview(namelbl)
        view.addSubview(Image)
        view.addSubview(defaultview)
        addSubview(view)
        
    }
    func addSetupComstrains()  {
        view.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        //        view.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.5, shadowRaduis: 1)
        defaultview.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: -15)
        namelbl.anchor(top: nil, left: defaultview.rightAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    
    
}
