//
//  MyAddressCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class MyAddressCell: UITableViewCell {
    
    var address: Address? {
        didSet {
            guard let address = address else{return}
            addressName.text = address.addressName
            if address.detailedAddress != nil {
                addressDescription.text = "\(address.country.name ?? "") - \(address.state.name ?? "") - \(address.city) - \(address.detailedAddress!)"
            }else{
                addressDescription.text = "\(address.country.name ?? "") - \(address.state.name ?? "") - \(address.city)"
                
            }
            if address.main {
                defaultview.isHidden = false
               
            }
        }
    }
    
    lazy var view: ShadowView = {
        let view = ShadowView()
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    lazy var addressName: HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        return lable
    }()
    lazy var addressDescription: DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.numberOfLines = 0
        lable.textColor = .lightgray3
        return lable
    }()
    
    lazy var defaultview: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.isHidden = true
        view.layer.masksToBounds = true
        return view
    }()
    private func setupLayou() {
        self.selectionStyle = .none
        addSubview(view)
        view.addSubview(addressName)
        view.addSubview(addressDescription)
        view.addSubview(defaultview)
        view.layer.masksToBounds = false
        view.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: 100, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            defaultview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            defaultview.anchor(top: view.topAnchor, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        }
        addressName.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        self.view.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha:0.24).cgColor, shadowOffset: CGSize(width: 0, height: 3), shadowOpacity: 0.4, shadowRaduis: 1)
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayou()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayou()
    }
}
