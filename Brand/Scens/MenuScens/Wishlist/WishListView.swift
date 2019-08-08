//
//  WishListView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class WishListView: UIView {
    private let cellID = "cellID"
    
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "wishlist".localized
        
        return navView
        
    }()
 
    lazy var wishCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(WishCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        wishCollection.delegate = delegate
        wishCollection.dataSource = dataSource
        self.ActionDelegete = actionDelegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        addSubViews()
         addConstrainsToUI()
    }
    public weak var ActionDelegete : ButtonActionDelegate?
    private func addSubViews() {
        addSubview(navView)
  
        addSubview(wishCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
   
        wishCollection.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.backBtn.addTarget(ActionDelegete, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        navView.searchBtn.addTarget(ActionDelegete, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
        
    }
}
