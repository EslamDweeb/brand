//
//  ItemDetailCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FirstCell:UICollectionViewCell{
    let detailView = DetailView()
    let descriptionView = DescriptionView()
    let footerView = FooterView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubViews()
        addConstraintstoViews()
    }
    private func addSubViews(){
        addSubview(detailView)
        addSubview(descriptionView)
        addSubview(footerView)
    }
    private func addConstraintstoViews(){
        detailView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100, paddingCenterX: 0, paddingCenterY: 0)
        descriptionView.anchor(top: detailView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120, paddingCenterX: 0, paddingCenterY: 0)
        footerView.anchor(top: descriptionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150, paddingCenterX: 0, paddingCenterY: 0)
    }
}
