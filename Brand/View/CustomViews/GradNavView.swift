//
//  GradNavView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class GradNavView: UIView {
    
    lazy var searchBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "search - anticon"), for: .normal)
        button.isHidden = true
        return button
    }()
    lazy var titlelabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        return button
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
        addSubview(titlelabel)
        addSubview(searchBtn)
        addSubview(backBtn)
    }
    private func setup(){
        self.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 0), location: [0,0.5,1])
        titlelabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        searchBtn.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 20, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
    }
}

