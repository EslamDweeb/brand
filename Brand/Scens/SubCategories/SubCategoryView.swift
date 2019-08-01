//
//  SubCategoryView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/7/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SubCtegoryView:UIView{
    weak var actionDelegate:ButtonActionDelegate?
    
    let cellID = "cellID"
    let cellID2 = "cellID2"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("subCategorie", comment: "")
        navView.searchBtn.isHidden = false
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    
    lazy var categoriesLable:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("browesBy", comment: "")
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
    lazy var categoriesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.register(CatogrieCell.self, forCellWithReuseIdentifier: cellID)
        coll.backgroundColor = .backgroundColl
        coll.isScrollEnabled = false
        return coll
    }()
    lazy var configCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(WishCell.self, forCellWithReuseIdentifier: cellID2)
        return coll
    }()
    lazy var categoryLogoImage:UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "ads")
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    var heightCollectionConfig : NSLayoutConstraint?
    
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        categoriesCollection.delegate = delegate
        categoriesCollection.dataSource = dataSource
        configCollection.delegate = delegate
        configCollection.dataSource = dataSource
        self.actionDelegate = actionDelegate
        setupView()
    }
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
         scroll.contentInset = .zero
         scroll.contentInsetAdjustmentBehavior = .never
         scroll.showsVerticalScrollIndicator = false
          return scroll
    }()
    
    lazy var parentViewScrollView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
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
        addSubview(scrollView)
        scrollView.addSubview(parentViewScrollView)
       parentViewScrollView.addSubview(seeAllBtn)
       parentViewScrollView.addSubview(categoriesLable)
       parentViewScrollView.addSubview(categoryLogoImage)
       parentViewScrollView.addSubview(categoriesCollection)
       parentViewScrollView.addSubview(configCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
         scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        parentViewScrollView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor , bottom: scrollView.bottomAnchor , right: scrollView.rightAnchor , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0 , height: 0 , paddingCenterX: 0, paddingCenterY: 0)
        parentViewScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor , multiplier: 1.0).isActive = true
        parentViewScrollView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.0 ).isActive = true
        
        categoriesLable.anchor(top: parentViewScrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        categoriesLable.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        seeAllBtn.anchor(top: parentViewScrollView.topAnchor, left: nil, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        categoriesCollection.anchor(top: categoriesLable.bottomAnchor, left: parentViewScrollView.leftAnchor, bottom: nil, right: parentViewScrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 85, paddingCenterX: 0, paddingCenterY: 0)
        categoryLogoImage.anchor(top: categoriesCollection.bottomAnchor, left: parentViewScrollView.leftAnchor, bottom: nil, right: parentViewScrollView.rightAnchor, centerX: parentViewScrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 100, paddingCenterX: 0, paddingCenterY: 0)
        configCollection.anchor(top: categoryLogoImage.bottomAnchor, left: parentViewScrollView.leftAnchor, bottom: parentViewScrollView.bottomAnchor, right: parentViewScrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightCollectionConfig = configCollection.heightAnchor.constraint(equalToConstant: 200)
    //    heightCollectionConfig?.isActive = true
    }
}
