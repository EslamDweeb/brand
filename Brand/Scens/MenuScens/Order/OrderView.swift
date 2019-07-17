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
        navView.titlelabel.text = "myOrders".localized
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
          stackView.addArrangedSubview(Pendingbtn)
          stackView.addArrangedSubview(Deliveredbtn)
          stackView.addArrangedSubview(Otherbtn)
        return stackView
    }()
    
    lazy var Pendingbtn : UIButton = {
        let button = UIButton()
        let title =  "PENDING".localized
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.getPendingTapped), for: .touchUpInside)
        return button
    }()
    lazy var Deliveredbtn : UIButton = {
        let button = UIButton()
        let title =  "DELIVERED".localized
        button.setTitle(title, for: .normal)
       // button.setFont(name: .fontH, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.getDeliveredTapped), for: .touchUpInside)
        
        return button
    }()
    lazy var Otherbtn : UIButton = {
        let button = UIButton()
        let title =  "OTHER".localized
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.getOtherTapped), for: .touchUpInside)
        return button
    }()
    lazy var line1 : lineView = {
        let line = lineView()
        line.backgroundColor = .white
        line.isHidden = false
        return line
    }()
    lazy var line2 : lineView = {
        let line = lineView()
        line.isHidden = true
         line.backgroundColor = .white
        return line
    }()
    lazy var line3 : lineView = {
        let line = lineView()
        line.isHidden = true
         line.backgroundColor = .white
        return line
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
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubViews()
        addConstrainsToUI()
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(navView)
        addSubview(view)
        view.addSubview(stackView)
        view.addSubview(line1)
        view.addSubview(line2)
        view.addSubview(line3)
        addSubview(orderCollection)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        view.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 53, paddingCenterX: 0, paddingCenterY: 0)
         view.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 0), location: [0,0.5,1])
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 3, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)

        line1.anchor(top: stackView.bottomAnchor, left: self.leftAnchor, bottom:nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 3, paddingCenterX: 0, paddingCenterY: 0)
        line1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33333333).isActive = true
        line2.anchor(top: stackView.bottomAnchor, left: line1.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 3, paddingCenterX: 0, paddingCenterY: 0)
          line2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33333333).isActive = true
        line3.anchor(top: stackView.bottomAnchor, left: line2.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 3, paddingCenterX: 0, paddingCenterY: 0)
          line3.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33333333).isActive = true
        orderCollection.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en" {
            Otherbtn.setTitle( "OTHER".localized, for: .normal)
            Pendingbtn.setTitle("PENDING".localized, for: .normal)
        }else{
            Otherbtn.setTitle("PENDING".localized, for: .normal)
            Pendingbtn.setTitle("OTHER".localized, for: .normal)

        }
    
    }
}
