//
//  shippingView.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
class ShippingView :UIView {
     var HeightConstrain:NSLayoutConstraint?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text =  "Shipping".localized
        navView.backBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var shippinglbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Shipping Addresses".localized
        return lable
    }()
    
    lazy var viewwithAddress: ShadowView = {
        let view = ShadowView()
        view.isHidden = true
        return view
    }()
    lazy var changeBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "invalidName-1"), for: .normal)
        return button
    }()
    
    lazy var addressName: HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        return lable
    }()
    lazy var addressDescription: DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.textColor = .lightGray
        return lable
    }()
    
    lazy var defaultview: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.isHidden = false
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var viewnoaddress: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    lazy var addnewaddBtn: GradBtn = {
        let button = GradBtn()
        button.setTitle("Add New Address".localized, for: .normal)
        return button
    }()
    
    lazy var addresstext: DefaultLabel = {
        let lable = DefaultLabel()
        lable.text = "You did Not have address yet".localized
        return lable
    }()
    lazy var AddressImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconsFinalMyAddressesEmptyState")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var shippingMethodlbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Shipping method".localized
        return lable
    }()
    lazy var shippingCollectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(shippingMethodCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor  = .white
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle("Continue".localized, for: .normal)
        return button
    }()
    public weak var actionDelegete : ButtonActionDelegate?
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        addSubview(navView)
        addSubview(scrollView)
        scrollView.addSubview(shippinglbl)
        scrollView.addSubview(viewwithAddress)
        viewwithAddress.addSubview(addressName)
        viewwithAddress.addSubview(addressDescription)
        viewwithAddress.addSubview(defaultview)
        viewwithAddress.addSubview(changeBtn)
        scrollView.addSubview(viewnoaddress)
        viewnoaddress.addSubview(AddressImage)
        viewnoaddress.addSubview(addresstext)
        viewnoaddress.addSubview(addnewaddBtn)
       scrollView.addSubview(shippingMethodlbl)
        scrollView.addSubview(shippingCollectionview)
        scrollView.addSubview(save)
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
      
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
       
        shippinglbl.anchor(top: scrollView.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
       
        
        viewwithAddress.anchor(top: shippinglbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 90, paddingCenterX: 0, paddingCenterY: 0)
        defaultview.anchor(top: viewwithAddress.topAnchor, left: viewwithAddress.leftAnchor, bottom: viewwithAddress.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addressName.anchor(top: viewwithAddress.topAnchor, left: viewwithAddress.leftAnchor, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: viewwithAddress.leftAnchor, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        self.viewwithAddress.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha:0.24).cgColor, shadowOffset: CGSize(width: 0, height: 3), shadowOpacity: 0.6, shadowRaduis: 1)
        changeBtn.anchor(top: viewwithAddress.topAnchor, left: nil, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 6, paddingLeft: 0, paddingBottom: 0, paddingRight: 6, width: 35, height: 35, paddingCenterX: 0, paddingCenterY: 0)
        
        viewnoaddress.anchor(top: shippinglbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 90, paddingCenterX: 0, paddingCenterY: 0)
        AddressImage.anchor(top: viewnoaddress.topAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 100, paddingCenterX: 0, paddingCenterY: 0)
        addresstext.anchor(top: AddressImage.bottomAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addnewaddBtn.anchor(top: addresstext.bottomAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        shippingMethodlbl.anchor(top: viewwithAddress.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
       shippingCollectionview.anchor(top: shippingMethodlbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        HeightConstrain = shippingCollectionview.heightAnchor.constraint(equalToConstant: 0)
        HeightConstrain?.isActive = true
        save.anchor(top: shippingCollectionview.bottomAnchor, left: self.leftAnchor, bottom: scrollView.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        changeBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.changeBtn), for: .touchUpInside)
       addnewaddBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.addBtn), for: .touchUpInside)
        
       
        
        
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

