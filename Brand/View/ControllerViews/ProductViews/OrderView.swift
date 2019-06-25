//
//  OrderView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class OrderView:UIView {

    private let cellID = "cellID"
    var heightConstraint:NSLayoutConstraint?
    var topConstraint:NSLayoutConstraint?
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        return navView
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        return button
    }()
    lazy var titlelabel:UILabel = {
        let label = UILabel()
        label.text = "My Orders"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var myOrders:UILabel = {
        let label = UILabel()
        label.text = "My Orders"
        label.textColor = .black
        label.textAlignment = .center
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
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource) {
        super.init(frame: .zero)
       orderCollection.delegate = delegate
       orderCollection.dataSource = dataSource
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
        navView.addSubview(backBtn)
        navView.addSubview(titlelabel)
        addSubview(myOrders)
        addSubview(orderCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        titlelabel.anchor(top: nil, left: nil, bottom: navView.bottomAnchor, right: nil, centerX: navView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 120, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: nil, left: navView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        myOrders.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 100, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightConstraint = myOrders.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint?.isActive = true
        
        orderCollection.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        topConstraint = orderCollection.topAnchor.constraint(equalTo: myOrders.bottomAnchor, constant: 16)
        topConstraint?.isActive = true
    }
}
