//
//  OrderView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class OrderView:UIView {

    private let cellID = "cellID"
    var heightConstraint:NSLayoutConstraint?
    var topConstraint:NSLayoutConstraint?
    var actionDelegate:ButtonActionDelegate?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("myOrders", comment: "")
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    lazy var myOrders:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("myOrders", comment: "")
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        return label
    }()
    lazy var orderCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(OrderCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
       orderCollection.delegate = delegate
       orderCollection.dataSource = dataSource
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
    private func addSubViews() {
        addSubview(navView)
        addSubview(myOrders)
        addSubview(orderCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
            myOrders.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            myOrders.textAlignment = .left

        }else{
            myOrders.anchor(top: navView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            myOrders.textAlignment = .right
        }
        heightConstraint = myOrders.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint?.isActive = true
        
        orderCollection.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        topConstraint = orderCollection.topAnchor.constraint(equalTo: myOrders.bottomAnchor, constant: 16)
        topConstraint?.isActive = true
    }
}
