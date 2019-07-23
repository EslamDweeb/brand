//
//  DescriptionView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DescriptionView:UIView{
    
    lazy var descripTitleLbl:UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont(name: .fontH, size: 16)
        lbl.text = NSLocalizedString("description", comment: "")
        return lbl
    }()
    lazy var descripLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: .fontL, size: 12)
        lbl.numberOfLines = 0
        lbl.text = NSLocalizedString("description", comment: "")
        return lbl
    }()
    lazy var lineView:UIView = {
        let line = UIView()
        line.backgroundColor = .lightgray3
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        backgroundColor = .white
        addSubViews()
        addConstraintsToViews()
    }
    private func addSubViews() {
        addSubview(descripLbl)
        addSubview(descripTitleLbl)
        addSubview(lineView)
    }
    private func addConstraintsToViews() {
        descripTitleLbl.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 90, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        descripLbl.anchor(top: descripTitleLbl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        descripLbl.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        lineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
    }
}
