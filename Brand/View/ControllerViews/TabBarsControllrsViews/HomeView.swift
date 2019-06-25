//
//  HomeView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class HomeView: UIView{
    let cellID = "CellID"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Explore Brands"
        navView.backBtn.isHidden = true
        navView.searchBtn.isHidden = false
        return navView
    }()
    
    lazy var bannerCollectionView:UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(BannerCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        return collection
    }()

    lazy var flashSaleImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "adsCopy4")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    init(delegate:UICollectionViewDelegate,dataSource:UICollectionViewDataSource) {
        super.init(frame: .zero)
        bannerCollectionView.delegate = delegate
        bannerCollectionView.dataSource = dataSource
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        self.backgroundColor = .white
        addSubViews()
        SetContraintToUI()
    }
    
    private func addSubViews() {
        addSubview(navView)
        addSubview(bannerCollectionView)
        addSubview(flashSaleImage)
    }
    private func SetContraintToUI() {
        navView.anchor(top:topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        bannerCollectionView.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 95, paddingCenterX: 0, paddingCenterY: 0)
        
         flashSaleImage.anchor(top: bannerCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 95, paddingCenterX: 0, paddingCenterY: 0)
    }
}
