//
//  CartView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CartView : UIView  {
    var bottomConstrain:NSLayoutConstraint?
    var heightConstrain:NSLayoutConstraint?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
          navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        navView.titlelabel.text = "cart".localized
        return navView
    }()
    lazy var Totalsar:HeaderLabel = {
        let label = HeaderLabel()
        return label
    }()
    
    lazy var ItemsNum:HeaderLabel = {
        let label = HeaderLabel()
        return label
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle( "Checkout_New".localized , for: .normal)
        return button
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView()
       tableView.register(CartCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.backgroundCell
        return tableView
    }()
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
      public weak var actionDelegate: ButtonActionDelegate?
    func setupView() {
        self.backgroundColor = .backgroundColl
        tableView.backgroundColor = .clear
        //add subViews
        addSubview(navView)
        addSubview(scrollView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(Totalsar)
        scrollView.addSubview(ItemsNum)
        scrollView.addSubview(save)
        //add constrains
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        tableView.anchor(top: scrollView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop:16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        bottomConstrain = tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.71)
        bottomConstrain?.isActive = true
        
       Totalsar.anchor(top: tableView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom:0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightConstrain = Totalsar.heightAnchor.constraint(equalToConstant: 20)
        heightConstrain?.isActive = true
        ItemsNum.anchor(top: nil, left: nil, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: Totalsar.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        save.anchor(top: Totalsar.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 40, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        save.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchDragInside)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}
