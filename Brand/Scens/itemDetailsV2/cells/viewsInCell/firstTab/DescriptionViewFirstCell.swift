//
//  DescriptionViewFirstCell.swift
//  Brand
//
//  Created by iOS on 9/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DescriptionViewFirstCell : UIView {

    lazy var labelDescription : UILabel = {
       let l = UILabel()
        l.text = YString.description
        l.font = UIFont(name: "Avenir-Medium", size: 12)
        return l
    }()
    
    lazy var labelDescriptionData : UILabel = {
       let l = UILabel()
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.numberOfLines = 0
        l.font = UIFont(name: "Avenir-Medium", size: 12)
        return l
    }()
    
    lazy var bottomLine : UIView = {
       let l = UIView()
        l.backgroundColor = .lightgray3
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    
    private func initView () {
        addViews()
    }
    
    private func addViews () {
        self.addSubview(labelDescription)
        self.addSubview(labelDescriptionData)
        self.addSubview(bottomLine)
        
        labelDescription.anchor(top: self.topAnchor , leading: self.leadingAnchor  , paddingTop: 8 , paddingLeft: 16 )
        labelDescriptionData.anchor(top: self.labelDescription.bottomAnchor , leading: self.leadingAnchor , bottom: bottomLine.bottomAnchor , trailing: self.trailingAnchor , paddingTop: 8, paddingLeft: 16 , paddingBottom: 8 , paddingRight: 16 )
        bottomLine.anchor( leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor  , paddingBottom: 8 , height: 1 )
        
    }
    
    
    
    
    
}

