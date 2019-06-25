//
//  AnimatedAddressView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class AnimatedView : UIView {
 

    lazy var  ExchangeView:UIView = {
        let View = UIView()
        View.backgroundColor = .gray
        View.layer.cornerRadius = 5
        return View
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(MyAddressCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        return tableView
    }()
    lazy var youraddlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Your Addresses", comment: "")
        lable.textColor = .black
        lable.textAlignment = .left
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        return lable
    }()
    lazy var addnewadd: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)
        
        button.isHidden = true
        return button
    }()
    func setup()  {
        
   
    addSubview(ExchangeView)
    ExchangeView.addSubview(tableView)
    ExchangeView.addSubview(addnewadd)
    ExchangeView.addSubview(youraddlabel)
        youraddlabel.anchor(top: ExchangeView.topAnchor, left: ExchangeView.leftAnchor, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 50, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        tableView.anchor(top: youraddlabel.bottomAnchor, left: ExchangeView.leftAnchor, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addnewadd.anchor(top: ExchangeView.topAnchor, left: nil, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: -25, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)
}
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
