//
//  ExploreView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ExploreView:UIView{
    let cellID = "cellID"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Explore Brands"
        navView.backBtn.isHidden = true
        navView.searchBtn.isHidden = false
        return navView
    }()

    lazy var categoriesLable:UILabel = {
        let label = UILabel()
        label.text = "Explore by categories"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var brandLable:UILabel = {
        let label = UILabel()
        label.text = "Explore All brands"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var seeAllBtn: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.pink, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.handelSeeAllBtn), for: .touchUpInside)
        return button
    }()
    lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
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
         addSubview(lineView)
         addSubview(categoriesCollection)
         addSubview(brandCollection)
        
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        categoriesLable.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        seeAllBtn.anchor(top: navView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        categoriesCollection.anchor(top: categoriesLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 85, paddingCenterX: 0, paddingCenterY: 0)
        lineView.anchor(top: categoriesCollection.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
        brandLable.anchor(top: lineView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        brandCollection.anchor(top: brandLable.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
