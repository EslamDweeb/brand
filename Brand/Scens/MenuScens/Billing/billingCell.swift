//
//  billingCell.swift
//  Brand
//
//  Created by nada dyaa on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
import Foundation
import UIKit
import MOLH
class BillingMethodCell : UICollectionViewCell {
    var name : BillingMethod? {
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
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
             defaultview.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        }else{
             defaultview.anchor(top: self.topAnchor, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            
        }
       
        Image.anchor(top: self.topAnchor, left: nil, bottom: nil, right: nil, centerX: self.centerXAnchor, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60, paddingCenterX: 0, paddingCenterY: 0)
        namelbl.anchor(top: nil, left: self.leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 6, paddingBottom: 4, paddingRight: 6, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    
    
}
