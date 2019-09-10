//
//  checkoutView.swift
//  Brand
//
//  Created by nada dyaa on 7/25/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class CheckoutView : UIView {
    
    var order:OrderSummary? {
        didSet{
            guard let order = order else{return}
            self.addressName.text = order.address.addressName
            self.addressDescription.text = order.address.getFullAddressName()
            self.shippinglabel.text =  "\(order.shippingMethod.name)"
            self.billinglabel.text = "\(order.billingMethod.name)"
            self.shippingFee.namelabel.text = "Shipping fee".localized
            self.billingFee.namelabel.text = "Billing Fee".localized
            self.shippingFee.Pricelabel.text = "\(order.shippingMethod.fees)(+\(order.shippingMethod.additionalTax) \("tax".localized))"
            self.billingFee.Pricelabel.text = "\(order.billingMethod.fees)(+\(order.billingMethod.additionalTax) \("tax".localized))"
            self.totalView.namelabel.text = "total".localized
            self.totalView.Pricelabel.text = "\(order.totalPrice)"
            self.subtotal.namelabel.text = "Subtotal".localized
            self.subtotal.Pricelabel.text = "\(order.totalCartItemsPrice)"
        }
    }
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Checkout".localized
        navView.backBtn.addTarget(self.actionDelegete, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return navView
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
   
    lazy var  orderitemsview:ShadowView = {
        let View = ShadowView()
        return View
    }()
    lazy var Orderitemlabel:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Order review".localized
        lable.font = UIFont(name: .fontH, size: 14)
        return lable
    }()
    lazy var  constantorderView:productCheckout = {
        let View = productCheckout()
        View.namelabel.text = "Name".localized
        View.namelabel.font = UIFont(name: .fontH, size: 12)
        View.Qlabel.text = "QTY".localized
        View.Qlabel.font = UIFont(name: .fontH, size: 12)
        View.Pricelabel.text = "Unit price".localized
        View.Pricelabel.font = UIFont(name: .fontH, size: 12)
        return View
    }()
    
    lazy var shippingview: ShadowView = {
        let View = ShadowView()
        return View
    }()
    
    lazy var shippinglabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.font = UIFont(name: .fontH, size: 14)
        return label
    }()
    lazy var img : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash01")
        return img
    }()
    lazy var defaultview1: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    lazy var billingview: ShadowView = {
        let View = ShadowView()
        return View
    }()
    
    lazy var billinglabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.font = UIFont(name: .fontH, size: 14)
        return label
    }()
    lazy var billingimg : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash01")
        return img
    }()
    lazy var billingdefaultview1: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var addressview: ShadowView = {
        let View = ShadowView()
        return View
    }()
    
    
    lazy var addressName: HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        return lable
    }()
    lazy var addressDescription: DescriptionLabel = {
        let lable = DescriptionLabel()
        return lable
    }()
    lazy var defaultview2: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
   
    lazy var  detailsorderView:ShadowView = {
        let View = ShadowView()
        return View
    }()
    lazy var Orderdetailslabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Order_Details".localized
        
        return label
    }()
    
    lazy var  totalView:OrderDetailsView = {
        let View = OrderDetailsView()
        View.namelabel.font = UIFont(name: .fontH, size: 12)
        View.Pricelabel.font = UIFont(name: .fontH, size: 12)
        View.Pricelabel.textColor = .pink
        return View
    }()
    lazy var  subtotal:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    
    lazy var  shippingFee:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    
    lazy var  billingFee:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    

    lazy var confirmBtn: GradBtn = {
        let button = GradBtn()
        let title = "Confirm".localized
        button.setTitle(title, for: .normal)
        return button
    }()
  
    public weak var actionDelegete : ButtonActionDelegate?
    
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        
        addSubview(navView)
        addSubview(scrollView)
        scrollView.addSubview(orderitemsview)
        orderitemsview.addSubview(Orderitemlabel)
        orderitemsview.addSubview(constantorderView)
        scrollView.addSubview(shippingview)
        shippingview.addSubview(shippinglabel)
        shippingview.addSubview(img)
        shippingview.addSubview(defaultview1)
        scrollView.addSubview(billingview)
        billingview.addSubview(billinglabel)
        billingview.addSubview(billingimg)
        billingview.addSubview(billingdefaultview1)
         scrollView.addSubview(addressview)
        addressview.addSubview(addressName)
        addressview.addSubview(addressDescription)
        addressview.addSubview(defaultview2)
         scrollView.addSubview(detailsorderView)
        detailsorderView.addSubview(Orderdetailslabel)
         detailsorderView.addSubview(subtotal)
         detailsorderView.addSubview(shippingFee)
         detailsorderView.addSubview(billingFee)
        detailsorderView.addSubview(totalView)
         scrollView.addSubview(confirmBtn)
        
        
        
        
        navView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        scrollView.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    
        if MOLHLanguage.currentAppleLanguage() == "en" {
            img.anchor(top: shippingview.topAnchor, left: nil, bottom: shippingview.bottomAnchor, right: shippingview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 16, width: 50, height: 0, paddingCenterX: 0, paddingCenterY: 0)
             billingimg.anchor(top: billingview.topAnchor, left: nil, bottom: billingview.bottomAnchor, right: billingview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 16, width: 50, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            defaultview1.anchor(top: shippingview.topAnchor, left: shippingview.leftAnchor, bottom: shippingview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            defaultview2.anchor(top: addressview.topAnchor, left: addressview.leftAnchor, bottom: addressview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            billingdefaultview1.anchor(top: billingview.topAnchor, left: billingview.leftAnchor, bottom: billingview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            
            
            
        }else{
            
            img.anchor(top: shippingview.topAnchor, left: shippingview.leftAnchor, bottom: shippingview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 16, paddingBottom: 5, paddingRight: 0, width: 50, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            billingimg.anchor(top: billingview.topAnchor, left: billingview.leftAnchor, bottom: billingview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 16, paddingBottom: 5, paddingRight: 0, width: 50, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            defaultview1.anchor(top: shippingview.topAnchor, left: nil, bottom: shippingview.bottomAnchor, right: shippingview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            defaultview2.anchor(top: addressview.topAnchor, left: nil, bottom: addressview.bottomAnchor, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            billingdefaultview1.anchor(top: billingview.topAnchor, left: nil, bottom: billingview.bottomAnchor, right: billingview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            
            
            
        }
        
        orderitemsview.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        orderitemsview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderitemlabel.anchor(top: orderitemsview.topAnchor, left: orderitemsview.leftAnchor, bottom: nil, right: orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        constantorderView.anchor(top: Orderitemlabel.bottomAnchor, left: orderitemsview.leftAnchor, bottom: nil, right: orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        shippingview.anchor(top: orderitemsview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 60, paddingCenterX: 0, paddingCenterY: 0)
        shippingview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        shippinglabel.anchor(top: nil, left: shippingview.leftAnchor, bottom: nil, right: shippingview.rightAnchor, centerX: nil, centerY: shippingview.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
      
        billingview.anchor(top: shippingview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 60, paddingCenterX: 0, paddingCenterY: 0)
        billingview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        billinglabel.anchor(top: nil, left: billingview.leftAnchor, bottom: nil, right: billingview.rightAnchor, centerX: nil, centerY: billingview.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
       
       
        addressview.anchor(top: billingview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 75, paddingCenterX: 0, paddingCenterY: 0)
        addressview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        addressName.anchor(top: addressview.topAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
       
        detailsorderView.anchor(top: addressview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        detailsorderView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderdetailslabel.anchor(top: detailsorderView.topAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        subtotal.anchor(top: Orderdetailslabel.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        shippingFee.anchor(top: subtotal.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        billingFee.anchor(top: shippingFee.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        totalView.anchor(top: billingFee.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        
        confirmBtn.anchor(top: detailsorderView.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height:50, paddingCenterX: 0, paddingCenterY: 0)
        
        confirmBtn.addTarget(self.actionDelegete, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        
    }
    init(delegete :  ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegete = delegete
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
   
}
