//
//  ExploreView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class ExploreView:UIView{
    let cellID = "cellID"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Explore Brands".localized
        navView.backBtn.isHidden = true
        navView.searchBtn.isHidden = false
        return navView
    }()

    lazy var categoriesLable:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Explore by categories"
        label.font = UIFont(name: .fontH, size: 14)
        return label
    }()
    lazy var brandLable:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Explore All brands"
        label.font = UIFont(name: .fontH, size: 14)
        return label
    }()
    lazy var seeAllBtn: UIButton = {
        let button = UIButton()
        button.setTitle("seeAll".localized, for: .normal)
        button.setTitleColor(.pink, for: .normal)
        button.titleLabel?.font = UIFont(name:.fontH, size: 14)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.handelSeeAllBtn), for: .touchUpInside)
        return button
    }()
    lazy var lineView1:lineView = {
        let view = lineView()
        return view
    }()
    lazy var categoriesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
            coll.register(CatogrieCell.self, forCellWithReuseIdentifier: cellID)
            coll.backgroundColor = .backgroundColl
            coll.isScrollEnabled = false
        return coll
    }()
    lazy var brandCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
              coll.backgroundColor = .backgroundColl
               coll.register(BrandCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    weak var actionDelegate:ButtonActionDelegate?
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        categoriesCollection.delegate = delegate
        categoriesCollection.dataSource = dataSource
        brandCollection.delegate = delegate
        brandCollection.dataSource = dataSource
        self.actionDelegate = actionDelegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() {
        self.backgroundColor = .backgroundColl
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews(){
        addSubview(navView)
        addSubview(seeAllBtn)
        addSubview(categoriesLable)
         addSubview(brandLable)
         addSubview(lineView1)
         addSubview(categoriesCollection)
         addSubview(brandCollection)
        
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        if MOLHLanguage.currentAppleLanguage() == "en"{
            categoriesLable.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            seeAllBtn.anchor(top: navView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
              brandLable.anchor(top: lineView1.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else {
            categoriesLable.anchor(top: navView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            seeAllBtn.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            brandLable.anchor(top: lineView1.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }
        
        
        categoriesCollection.anchor(top: categoriesLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 85, paddingCenterX: 0, paddingCenterY: 0)
        lineView1.anchor(top: categoriesCollection.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
      
        brandCollection.anchor(top: brandLable.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.searchBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.searchTapped), for: .touchUpInside)
    }
}
