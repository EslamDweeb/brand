//
//  ReviewView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ReviewView: UIView {
    private let cellID = "cellID"
    var heightConstraint:NSLayoutConstraint?
    var topConstraint:NSLayoutConstraint?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("myReview", comment: "")
        return navView
    }()

    lazy var myReviews:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("my_reviews", comment: "")
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
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
       
        myReviews.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightConstraint = myReviews.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint?.isActive = true
        
        reviewCollection.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        topConstraint = reviewCollection.topAnchor.constraint(equalTo: myReviews.bottomAnchor, constant: 16)
        topConstraint?.isActive = true
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
    }
}
