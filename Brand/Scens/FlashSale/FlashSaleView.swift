//
//  FlashSaleView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FlashSaleView: UIView {
    private let cellID = "cellId"
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "flashSale".localized
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    lazy var titlelabel:UILabel = {
        let label = UILabel()
        label.text = "Flash Sale"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var advImage: UIImageView =  {
      let img = UIImageView()
        img.image = #imageLiteral(resourceName: "ads")
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var offersLbl:UILabel = {
        let label = UILabel()
        label.text = "Available offers"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        return label
    }()
    lazy var flashCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
       coll.register(FlashCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,buttonActionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        flashCollection.delegate = delegate
        flashCollection.dataSource = dataSource
        self.actionDelegate = buttonActionDelegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public weak var actionDelegate: ButtonActionDelegate?
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(navView)
        addSubview(flashCollection)
        addSubview(advImage)
        addSubview(offersLbl)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        advImage.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 90, paddingCenterX: 0, paddingCenterY: 0)
        offersLbl.anchor(top: advImage.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 120, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        flashCollection.anchor(top: offersLbl.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
