//
//  CellBackgroundView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CellBackgroundView: UIView {
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconsFinalMyAddressesEmptyState")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lable:UILabel = {
        let lbl = UILabel()
        lbl.text = "Sorry you didn’t add any wishes yet"
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        lbl.font = UIFont(name: "Avenir-Medium", size: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    lazy var button:GradBtn = {
        let btn = GradBtn()
        btn.setTitle("Wishes", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 16)
        btn.addTarget(delegate, action: #selector(ButtonActionDelegate.wishBtnTapped), for: .touchUpInside)
        return btn
    }()
    weak var delegate:ButtonActionDelegate?
    init(delegate:ButtonActionDelegate){
        super.init(frame: .zero)
        self.delegate = delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        self.backgroundColor = .backgroundColl
        addSubViews()
        addConstarinsToUI()
    }
    private func addSubViews() {
        addSubview(image)
        addSubview(lable)
        addSubview(button)
    }
    private func addConstarinsToUI() {
        image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 200, paddingCenterX: 0, paddingCenterY: -70)
        
        lable.anchor(top: image.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        button.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 40, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
    }
}
