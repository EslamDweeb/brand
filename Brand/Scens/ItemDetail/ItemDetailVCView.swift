//
//  ItemDetailVCView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailVCView:UIView {
    let headerID = "headerID"
    let cellID = "cellID"
    lazy var mainCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let coll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coll.register(ItemDetailCollHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        coll.register(MainCollCell.self, forCellWithReuseIdentifier: cellID)
        //coll.isPagingEnabled = true
        return coll
    }()
    lazy var scrollView:UIScrollView = {
       let scroll = UIScrollView()
        scroll.contentInset = .zero
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    init(collectionDelegate:UICollectionViewDelegate,CollectionDataSource:UICollectionViewDataSource) {
        super.init(frame: .zero)
        mainCollectionView.delegate = collectionDelegate
        mainCollectionView.dataSource = CollectionDataSource
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(mainCollectionView)
        mainCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        mainCollectionView.backgroundColor = .white
        mainCollectionView.contentInset.top = -UIApplication.shared.statusBarFrame.height
        mainCollectionView.heightAnchor.constraint(lessThanOrEqualToConstant: 920).isActive = true
    }
}
