//
//  MenuView.swift
//  Brands
//
//  Created by IOS on 3/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    var isLogin = UserDefaults.standard.bool(forKey: Constants.Defaults.isLogin)
    let cellid = "cellid"
    var actionDelegate:ButtonActionDelegate?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("settings" , comment: "")
        navView.backBtn.isHidden = true
        return navView
    }()
    
    lazy var newTable : UITableView = {
        let table = UITableView()
        table.register(MenuCell.self, forCellReuseIdentifier: cellid)
        table.allowsMultipleSelection = false
        //table.allowsSelection = false
        table.isScrollEnabled = false
        table.separatorStyle = .none
        return table
    }()
    lazy var lable:UILabel = {
      let lbl = UILabel()
        lbl.text = NSLocalizedString("followus", comment: "")
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        return lbl
    }()
    lazy var FBButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        button.setCornerRadius(radius: nil)
        return button
    }()
    lazy var TWButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        button.setCornerRadius(radius: nil)
        return button
    }()
    lazy var socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.addArrangedSubview(FBButton)
        stackView.addArrangedSubview(TWButton)
        return stackView
    }()
    lazy var emptyView:UIView = {
        let scroll = UIView()
        return scroll
    }()
    lazy var scrollView:UIScrollView = {
       let scroll = UIScrollView()
        return scroll
    }()
    init(delegate:UITableViewDelegate,dataSource:UITableViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        newTable.delegate = delegate
        newTable.dataSource = dataSource
        self.actionDelegate = actionDelegate
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup() {
        self.backgroundColor = .white
        addSubViews()
        SetContraintToUI()
    }
    
    private func addSubViews() {
        self.addSubview(navView)
        self.addSubview(scrollView)
        scrollView.addSubview(newTable)
        scrollView.addSubview(emptyView)
        scrollView.addSubview(lable)
        scrollView.addSubview(socialStackView)
    }
    private func SetContraintToUI() {
        navView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        newTable.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        lable.anchor(top: newTable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        socialStackView.anchor(top: lable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        emptyView.anchor(top: socialStackView.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           FBButton.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        FBButton.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.faceBookLogin), for: .touchUpInside)
        TWButton.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.twitterLogin), for: .touchUpInside)
        if(isLogin == true)
        {
            newTable.heightAnchor.constraint(equalToConstant: 700).isActive = true
        }
        else
        {
            newTable.heightAnchor.constraint(equalToConstant: 400).isActive = true
        }
        
    }
    
}
