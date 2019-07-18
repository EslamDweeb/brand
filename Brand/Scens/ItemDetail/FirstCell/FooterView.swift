//
//  FooterView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FooterView:UIView{
    let cellID = "cellID"
    lazy var titleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: .fontH, size: 16)
        lbl.text = NSLocalizedString("relatedProduct", comment: "")
        return lbl
    }()
    lazy var seeall:UIButton = {
        let lbl = UIButton()
        lbl.setTitle(NSLocalizedString("seeAll", comment: ""), for: .normal)
        return lbl
    }()
    lazy var productCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(WishCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        addSubViews()
        addConstraintsToViews()
    }
    private func addSubViews() {
        addSubview(titleLbl)
        addSubview(seeall)
        addSubview(productCollectionView)
    }
    private func addConstraintsToViews() {
        titleLbl.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 90, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        seeall.anchor(top: topAnchor, left: nil, bottom: nil, right:rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        productCollectionView.anchor(top: titleLbl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200, paddingCenterX: 0, paddingCenterY: 0)
    }
}
