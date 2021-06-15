//
//  ReviewView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class ReviewView: UIView {
    private let cellID = "cellID"
    var heightConstraint:NSLayoutConstraint?
    var topConstraint:NSLayoutConstraint?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "myReview".localized
        return navView
    }()

    lazy var myReviews:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "my_reviews".localized
        
        return label
    }()
   
    lazy var reviewCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
      coll.register(ReviewCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        reviewCollection.delegate = delegate
        reviewCollection.dataSource = dataSource
        self.actionDelegate = actionDelegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    public weak var actionDelegate: ButtonActionDelegate?
    private func addSubViews() {
        addSubview(navView)
        addSubview(myReviews)
        addSubview(reviewCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        heightConstraint = myReviews.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint?.isActive = true
       // if MOLHLanguage.currentAppleLanguage() == "en" {
            myReviews.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 18, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
      //  }else{
//            myReviews.anchor(top: navView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
      //  }
        reviewCollection.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        topConstraint = reviewCollection.topAnchor.constraint(equalTo: myReviews.bottomAnchor, constant: 16)
        topConstraint?.isActive = true
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
    }
}
