//
//  MenuView_V2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class MenuView_V2 : UIView {
    
    private var actionDelegate:ButtonActionDelegate?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = YString.menu
        navView.backBtn.isHidden = true
        return navView
    }()
    
    lazy var tableViewMenu : UITableView = {
       let t = UITableView()
        t.register(MenuCell.self, forCellReuseIdentifier: MenuCell.getIdentifier() )
        t.allowsMultipleSelection = false
        t.separatorStyle = .none
        return t
    }()
    

    init(delegate:UITableViewDelegate,
         dataSource:UITableViewDataSource,
         actionDelegate:ButtonActionDelegate) {
            super.init(frame: .zero)
            tableViewMenu.delegate = delegate
            tableViewMenu.dataSource = dataSource
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
        self.addSubview(tableViewMenu)
    }
    
    private func SetContraintToUI() {
    
        navView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
         tableViewMenu.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor , right: self.rightAnchor, centerX:nil , centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 50 , paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    
    }
    
    
}
