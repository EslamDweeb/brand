//
//  SearchView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SearchView: UIView {
    private let cellID = "cellID"
    weak var actionDelegate:ButtonActionDelegate?
    
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
        label.text = "Search"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
      lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.removeBackgroundImageView()
        searchBar.placeholder = "What are you looking for?"
       let textfield = searchBar.value(forKey: "searchField") as? UITextField
        textfield?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
        textfield?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textfield?.font = UIFont(name: "Avenir-Heavy", size: 14)
        let glassIconView = textfield!.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8029484161)
        return searchBar
    }()
    lazy var searchLbl:UILabel = {
        let lable = UILabel()
        lable.text = "Search by Product name or brand name or Hashtag"
        lable.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        lable.font = UIFont(name: "Avenir-Heavy", size: 12)
        return lable
    }()
    lazy var searchCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: .zero,collectionViewLayout: layout)
        coll.backgroundColor = .backgroundColl
        coll.register(WishCell.self, forCellWithReuseIdentifier: cellID)
        return coll
    }()
    lazy var filterBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "addButton-1"), for: .normal)
        btn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.filterBtnTapped), for: .touchUpInside)
        return btn
    }()
    init(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource,actionDelegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = actionDelegate
        searchCollection.delegate = delegate
        searchCollection.dataSource = dataSource
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(navView)
        navView.addSubview(backBtn)
        navView.addSubview(titlelabel)
        addSubview(searchBar)
        addSubview(searchLbl)
        addSubview(searchCollection)
        addSubview(filterBtn)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        titlelabel.anchor(top: nil, left: nil, bottom: navView.bottomAnchor, right: nil, centerX: navView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 120, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: nil, left: navView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        searchBar.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        searchLbl.anchor(top: searchBar.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        searchCollection.anchor(top: searchLbl.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        filterBtn.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 32, paddingRight: 20, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        navView.backBtn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
    }
}

extension UISearchBar {
    func removeBackgroundImageView(){
        if let view:UIView = self.subviews.first {
            for curr in view.subviews {
                guard let searchBarBackgroundClass = NSClassFromString("UISearchBarBackground") else {return}
                if curr.isKind(of:searchBarBackgroundClass){
                    if let imageView = curr as? UIImageView{
                        imageView.removeFromSuperview()
                        break
                    }
                }
            }
        }
    }
}
