//
//  searchView.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class searchView : UIView  , UITextFieldDelegate {
    public weak var actionDelegate: ButtonActionDelegate?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        navView.titlelabel.text = "Search".localized
        return navView
    }()
    lazy var searchtextFeild : DefaultTextField = {
        let text = DefaultTextField()
        let title = "iphone".localized
        text.SetAttributePlaceHeader(Title: title)
        return text
    }()
    
    lazy var searchCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(WishCell.self, forCellWithReuseIdentifier: "cellID")
        return coll
    }()
    lazy var searchBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        return button
    }()
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        searchCollection.delegate = delegate
        searchCollection.dataSource = dataSource
        self.actionDelegate = actionDelegate
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
   
    func setupView() {
        self.backgroundColor = .backgroundColl
        addSubview(navView)
        addSubview(searchtextFeild)
        addSubview(searchCollection)
        searchtextFeild.delegate = self
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
          searchtextFeild.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        searchCollection.anchor(top: searchtextFeild.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en" {
           searchtextFeild.leftView = searchBtn
            searchtextFeild.leftViewMode = .always
        }else{
            searchtextFeild.rightView = searchBtn
            searchtextFeild.rightViewMode = .always
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.pink.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightgray.cgColor
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.resignFirstResponder() {
            return false
        }
        return true
    }
   
}
