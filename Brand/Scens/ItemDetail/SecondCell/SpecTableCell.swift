//
//  SpecTableCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SpecTAbleCell:UITableViewCell{
    var spec:Spec?{
        didSet{
            guard let sp = spec else{return}
            keyLable.text = sp.specKey.name
            valLable.text = "\(sp.value) \(sp.specKey.unit.name)"
        }
    }
    lazy var keyLable:UILabel = {
        let lbl = UILabel()
        lbl.font = setFont(name: .fontH, size: 14)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    lazy var valLable:UILabel = {
        let lbl = UILabel()
        lbl.font = setFont(name: .fontM, size: 13)
        lbl.textColor = .lightgray2
        lbl.textAlignment = .left
        return lbl
    }()
    lazy var stackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.addArrangedSubview(keyLable)
        stack.addArrangedSubview(valLable)
        return stack
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        //keyLable.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        keyLable.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
