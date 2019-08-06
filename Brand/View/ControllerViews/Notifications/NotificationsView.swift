//
//  NotificationsView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class NotificationView:UIView {
    let cellID = "cellID"
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.backBtn.isHidden = true
        navView.titlelabel.text = YString.notification
        return navView
    }()
 
    lazy var titlelabel:UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var newLable:UILabel = {
        let label = UILabel()
        label.text = "New"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        return label
    }()
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(NotificationCell.self, forCellReuseIdentifier: cellID)
        return table
    }()
    init(delegate:UITableViewDelegate,dataSource:UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        self.backgroundColor = .backgroundColl
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(navView)
       
        addSubview(newLable)
        addSubview(tableView)
 
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        newLable.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        tableView.anchor(top: newLable.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
