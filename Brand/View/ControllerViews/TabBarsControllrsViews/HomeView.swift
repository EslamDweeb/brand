//
//  HomeView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher
class HomeView: UIView{
    var setting:Settings?{
        didSet{
            guard let set = setting else{return}
            let url = URL(string: set.photo.path)
            flashSaleImage.kf.setImage(with: url)
        }
    }
    let cellID = "CellID"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Explore Brands"
        navView.backBtn.isHidden = true
        navView.searchBtn.isHidden = false
        navView.searchBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.searchTapped), for: .touchUpInside)
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
    lazy var mainCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(ExploreCell.self, forCellWithReuseIdentifier: cellID)
        coll.isScrollEnabled = false
        return coll
    }()
    lazy var flashSaleImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "adsCopy4")
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    lazy var tap:UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: actionDelegate, action: #selector(ButtonActionDelegate.imageViewTapped))
        return tap
    }()
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    weak var actionDelegate:ButtonActionDelegate?
    init(delegate:UICollectionViewDelegate,dataSource:UICollectionViewDataSource,buttonDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = buttonDelegate
        bannerCollectionView.delegate = delegate
        bannerCollectionView.dataSource = dataSource
        mainCollection.delegate = delegate
        mainCollection.dataSource = dataSource
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
        addSubview(scrollView)
        scrollView.addSubview(mainCollection)
        scrollView.addSubview(bannerCollectionView)
        scrollView.addSubview(flashSaleImage)
    }
    private func SetContraintToUI() {
        navView.anchor(top:topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        bannerCollectionView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 95, paddingCenterX: 0, paddingCenterY: 0)
        
         flashSaleImage.anchor(top: bannerCollectionView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 95, paddingCenterX: 0, paddingCenterY: 0)
        mainCollection.anchor(top: flashSaleImage.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 810, paddingCenterX: 0, paddingCenterY: 0)
    }
}
