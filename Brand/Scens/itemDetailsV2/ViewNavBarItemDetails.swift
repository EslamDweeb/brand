//
//  ViewNavBarItemDetails.swift
//  Brand
//
//  Created by iOS on 9/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class ViewNavBarItemDetails : UIView {
    
    weak var actionDelegate:ButtonActionDelegate?

    lazy var backBtn: UIButton = {
        let b = UIButton()
       if  MOLHLanguage.currentAppleLanguage().contains( "ar") {
             b.setImage(#imageLiteral(resourceName: "arrow-back-rtl"), for: .normal)
        }else{
            b.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        }
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        b.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return b
    }()
    
    lazy var backBouttonRoundView:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0.1962489298)
        v.addSubview(backBtn)
        backBtn.anchor(top: v.topAnchor, leading:  v.leadingAnchor, bottom:  v.bottomAnchor, trailing:  v.trailingAnchor)
        return v
    }()
    
    lazy var lableTitle : UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14 )
        l.textColor = .white
        l.isHidden = true 
        return l
    }()
    
    init(actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = actionDelegate
        initViews()
    }
    
    override func layoutSubviews() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    
    private func initViews () {
        
        self.addSubview(backBouttonRoundView)
        self.addSubview(lableTitle)
        
        backBouttonRoundView.anchor(  leading: self.leadingAnchor , bottom: self.bottomAnchor , paddingLeft: 16 , paddingBottom: 16 , width: 35 , height: 35 )
        lableTitle.anchor( bottom: self.bottomAnchor , centerX: self.centerXAnchor , paddingBottom: 20 )
        
    }
    
    func transparentView () {
        
        UIView.animate(withDuration: 0.3) {
           self.backBouttonRoundView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0.1962489298)
            self.backgroundColor = .clear
            self.lableTitle.isHidden = true
        }
        
    }
    
    func fillColor () {
        
        
        UIView.animate(withDuration: 0.3) {
            self.backBouttonRoundView.backgroundColor = .clear
            self.backgroundColor = UIColor.pink
            self.lableTitle.isHidden = false
        }
        
    }
    
}
