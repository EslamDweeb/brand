//
//  CellItemDetailsFirstTab.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FirstTabItemDetails : UIView {
    
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(self.parentInScrollView)
        self.parentInScrollView.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        self.parentInScrollView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    lazy private var parentInScrollView : UIView = {
        let v = UIView()
        
        return v
    }()
    
    let detailView = DetailsViewFirstCell()
    let descriptionView = DescriptionViewFirstCell()
    let configOptionsView = ConfigOptionViewFirstCell()
    let footerView = FooterView()
    
    var heightTableConfigs : NSLayoutConstraint?
    var footerViewHeightConstraint:NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    private func initViews () {
        self.backgroundColor = .white
        addViews()
        configOptionsView.reloadData()

    }
    
    private func addViews () {
        addSubview(scrollView)
        parentInScrollView.addSubview(detailView)
        parentInScrollView.addSubview(descriptionView)
        parentInScrollView.addSubview(configOptionsView)
        parentInScrollView.addSubview(footerView)
        
        scrollView.anchor(top: self.safeAreaLayoutGuide.topAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor )
        
        detailView.anchor(top: self.parentInScrollView.topAnchor , leading: parentInScrollView.leadingAnchor , trailing: parentInScrollView.trailingAnchor )
        descriptionView.anchor(top: detailView.bottomAnchor , leading: parentInScrollView.leadingAnchor , trailing: parentInScrollView.trailingAnchor , paddingTop: 8 )
        configOptionsView.anchor(top: descriptionView.bottomAnchor , leading: parentInScrollView.leadingAnchor , trailing: parentInScrollView.trailingAnchor   , paddingTop: 8 , paddingLeft: 0, paddingBottom: 8 , paddingRight: 8 )
        heightTableConfigs = configOptionsView.heightAnchor.constraint(equalToConstant: 5 )
        heightTableConfigs?.isActive = true
        configOptionsView.heightTableConfigs = heightTableConfigs
        
        footerView.anchor(top: configOptionsView.bottomAnchor , leading: parentInScrollView.leadingAnchor , bottom: parentInScrollView.bottomAnchor , trailing: parentInScrollView.trailingAnchor   , paddingTop: 8 , paddingBottom : 8 )
        footerViewHeightConstraint = footerView.heightAnchor.constraint(equalToConstant: 10)
        footerViewHeightConstraint?.isActive = true
        
        
    }
    
    
    func getFooterViewData(configs:[DetailedConfig]?,simpleConfig:[Config]?){
        footerView.configs = configs
        footerView.productCollectionView.reloadData()
        if configs?.count != 0{
            footerView.titleLbl.isHidden = false
            footerViewHeightConstraint?.constant = 220
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }else{
            footerViewHeightConstraint?.constant = 0
            footerView.titleLbl.isHidden = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
    
    
}

