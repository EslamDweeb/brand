//
//  RateProgressView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class  RateProgressView:UIView{
    
    lazy var numberLable:UILabel = {
        let lbl = UILabel()
        lbl.font = setFont(name: .fontM, size: 8)
        return lbl
    }()
    lazy var progress:LinearProgressBar = {
       let prog = LinearProgressBar()
        prog.trackColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        prog.barColor = .pink
        prog.barThickness = 5.5
        prog.trackPadding = 0
        prog.barPadding = 0
        prog.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        return prog
    }()
    lazy var hStackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 2
        stack.addArrangedSubview(numberLable)
        stack.addArrangedSubview(progress)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(hStackView)
        numberLable.widthAnchor.constraint(equalToConstant: 5).isActive = true
        numberLable.heightAnchor.constraint(equalToConstant: 11).isActive = true
        progress.widthAnchor.constraint(equalToConstant: 157).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 5.5).isActive = true
        hStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
