//
//  CartView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CartView : UIView  {
    
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
        label.text = "Cart"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var Totalsar:UILabel = {
        let label = UILabel()
        label.text = "Total 1245 Sar"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 15)
        return label
    }()
    
    lazy var ItemsNum:UILabel = {
        let label = UILabel()
        label.text = "8 item"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 15)
        return label
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString("Checkout New", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        return button
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView()
       tableView.register(CartCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.backgroundCell
        return tableView
    }()
      public weak var actionDelegate: ButtonActionDelegate?
    func setupView() {
        self.backgroundColor = .backgroundColl
        tableView.backgroundColor = .clear
        //add subViews
        addSubview(navView)
        addSubview(tableView)
        navView.addSubview(backBtn)
        navView.addSubview(titlelabel)
        addSubview(Totalsar)
        addSubview(ItemsNum)
        addSubview(save)
        //add constrains
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        titlelabel.anchor(top: nil, left: nil, bottom: navView.bottomAnchor, right: nil, centerX: navView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 120, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: nil, left: navView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)

        tableView.anchor(top: navView.bottomAnchor, left:  leftAnchor, bottom: Totalsar.topAnchor, right:  rightAnchor, centerX: nil, centerY: nil, paddingTop:24, paddingLeft: 8, paddingBottom: 24, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
       Totalsar.anchor(top: nil, left: self.leftAnchor, bottom: save.topAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom:16, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        ItemsNum.anchor(top: nil, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: Totalsar.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        save.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 40, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        save.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchDragInside)
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
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
