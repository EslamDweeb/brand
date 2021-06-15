//
//  MyAddressView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class MyAddressView: UIView {
    
    var heightConstraint:NSLayoutConstraint?
    var topConstraint:NSLayoutConstraint?
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
         navView.titlelabel.text = "My addresses".localized
        return navView
    }()
   
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(MyAddressCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        return tableView
    }()
    lazy var addBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)
        return button
    }()
    lazy var lable:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "My addresses".localized
        lable.font = UIFont(name: .fontH, size: 18)
        return lable
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    func setupView() {
        self.backgroundColor = .backgroundColl
        tableView.backgroundColor = .clear
        //add subViews
        addSubview(navView)
      tableView.addSubview(addBtn)
        addSubview(tableView)
        addSubview(lable)
    
        //add constrains
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
      
        lable.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
       // heightConstraint = lable.heightAnchor.constraint(equalToConstant: 25)
      //  heightConstraint?.isActive = true
        tableView.anchor(top: lable.bottomAnchor, left:  leftAnchor, bottom: self.bottomAnchor, right:  rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
      //  topConstraint = tableView.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 16)
       // topConstraint?.isActive = true
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            addBtn.anchor(top: nil, left: self.safeAreaLayoutGuide.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 80, height: 80, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            addBtn.anchor(top: nil, left: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.safeAreaLayoutGuide.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 80, height: 80, paddingCenterX: 0, paddingCenterY: 0)
        }
       
        addBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
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
