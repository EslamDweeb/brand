//
//  Order_Details_View.swift
//  Brands
//
//  Created by nada dyaa on 3/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
 import UIKit
 //import MOLH
 import FlexibleSteppedProgressBar

class DetailorderView : UIView , UITextFieldDelegate ,FlexibleSteppedProgressBarDelegate {
    
    var order:Order? {
        didSet{
            guard let order = order else{return}
            self.addressName.text = order.address?.addressName
            self.addressDescription.text = order.address?.getFullAddressName()
            self.totalView.namelabel.text = "totalAmount".localized
             self.ordernum.namelabel.text = "orderNumber".localized
            self.orderdate.namelabel.text = "orderDate".localized
            self.shippingMethod.namelabel.text = "Shipping Method".localized
            self.shippingFee.namelabel.text = "Shipping fee".localized
            self.billingFee.namelabel.text = "Billing Fee".localized
            self.billingMethod.namelabel.text = "Billing Method".localized
            self.totalView.Pricelabel.text = "\(order.totalPrice)"
            self.ordernum.Pricelabel.text = order.referenceNumber
             self.orderdate.Pricelabel.text = order.createdAt.date
             self.shippingMethod.Pricelabel.text = order.shippingMethod?.name
             self.shippingFee.Pricelabel.text = "\(order.shippingMethod?.fees ?? 0)"
             self.billingMethod.Pricelabel.text = order.billingMethod?.name
            self.billingFee.Pricelabel.text = "\(order.billingMethod?.fees ?? 0)"
     
        
           
        }
    }
    
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "Order_Details".localized
        return navView
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
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
    lazy var  ordernum:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var  orderdate:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var  shippingMethod:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var  shippingFee:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var  billingMethod:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var  billingFee:OrderDetailsView = {
        let View = OrderDetailsView()
        return View
    }()
    lazy var orderstatusview: ShadowView = {
        let View = ShadowView()
        return View
    }()
    lazy var Orderstatuslabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "orderStatus".localized
        label.font = UIFont(name: .fontH, size: 14)
        return label
    }()
    lazy var img : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "add-to-the-cart")
        img.isHidden = true
        return img
    }()
    lazy var statuslabel : HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Canceld"
        label.isHidden = true
        return label
    }()
    lazy var Statusbar : FlexibleSteppedProgressBar = {
        let status = FlexibleSteppedProgressBar()
        status.currentSelectedCenterColor = .pink
        status.currentSelectedTextColor = .pink
        status.lastStateCenterColor = .pink
        status.selectedBackgoundColor = .pink
        status.selectedOuterCircleStrokeColor = .pink
        status.backgroundShapeColor = .lightgray3
        status.centerLayerTextColor = .white
        status.numberOfPoints = 4
        status.lineHeight = 5
        status.radius = 12
        status.progressRadius = 12
        status.progressLineHeight = 5
        status.stepTextFont = UIFont(name: .fontM, size: 12)
        return status
    }()
    lazy var addressview: ShadowView = {
        let View = ShadowView()
        return View
    }()
    
  
    lazy var addressName: HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "My Home".localized
        return lable
    }()
    lazy var addressDescription: DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.text = " Ksa - Qussaim - unizaa- 24 freedom st. - 16 block"
        return lable
    }()
    
    lazy var  orderitemsview:ShadowView = {
        let View = ShadowView()
        return View
    }()
    lazy var Orderitemlabel:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Order_Items".localized
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
    
    
    
    lazy var confirmBtn: GradBtn = {
        let button = GradBtn()
        let title = "Cancel Order".localized
        button.setTitle(title, for: .normal)
        return button
    }()
    lazy var notelabel:DescriptionLabel12 = {
        let lable = DescriptionLabel12()
        lable.text = "Cancelorderafter24".localized
        lable.textColor = .lightgray2
        lable.textAlignment = .center
        return lable
    }()
    public weak var actionDelegete : ButtonActionDelegate?
    
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        
        addSubview(navView)
        addSubview(scrollView)
        scrollView.addSubview(detailsorderView)
        detailsorderView.addSubview(Orderdetailslabel)
        detailsorderView.addSubview(totalView)
         detailsorderView.addSubview(ordernum)
         detailsorderView.addSubview(orderdate)
         detailsorderView.addSubview(shippingMethod)
         detailsorderView.addSubview(shippingFee)
         detailsorderView.addSubview(billingMethod)
         detailsorderView.addSubview(billingFee)
        scrollView.addSubview(orderstatusview)
        orderstatusview.addSubview(Orderstatuslabel)
        orderstatusview.addSubview(Statusbar)
        orderstatusview.addSubview(img)
        orderstatusview.addSubview(statuslabel)
        scrollView.addSubview(addressview)
        addressview.addSubview(addressName)
        addressview.addSubview(addressDescription)
        scrollView.addSubview(orderitemsview)
        orderitemsview.addSubview(Orderitemlabel)
        orderitemsview.addSubview(constantorderView)
        scrollView.addSubview(confirmBtn)
        scrollView.addSubview(notelabel)
        
        Statusbar.delegate = self
        navView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        scrollView.anchor(top: navView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        detailsorderView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:0, paddingCenterX: 0, paddingCenterY: 0)
        detailsorderView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
    
        Orderdetailslabel.anchor(top: detailsorderView.topAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        ordernum.anchor(top: Orderdetailslabel.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        orderdate.anchor(top: ordernum.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        shippingMethod.anchor(top: orderdate.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        shippingFee.anchor(top: shippingMethod.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        billingMethod.anchor(top: shippingFee.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        billingFee.anchor(top: billingMethod.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        totalView.anchor(top: billingFee.bottomAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        orderstatusview.anchor(top: detailsorderView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:120, paddingCenterX: 0, paddingCenterY: 0)
        orderstatusview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
         Orderstatuslabel.anchor(top: orderstatusview.topAnchor, left: orderstatusview.leftAnchor, bottom: nil, right: orderstatusview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        img.anchor(top: Orderstatuslabel.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: orderstatusview.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 25
            , paddingCenterX: 0, paddingCenterY: 0)
        statuslabel.anchor(top: img.bottomAnchor, left: nil, bottom: orderstatusview.bottomAnchor, right: nil, centerX: orderstatusview.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Statusbar.anchor(top: Orderstatuslabel.bottomAnchor, left: orderstatusview.leftAnchor, bottom: orderstatusview.bottomAnchor, right: orderstatusview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 22, paddingBottom: 16, paddingRight: 24, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addressview.anchor(top: orderstatusview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 75, paddingCenterX: 0, paddingCenterY: 0)
        addressName.anchor(top: addressview.topAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        orderitemsview.anchor(top: addressview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        orderitemsview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderitemlabel.anchor(top: orderitemsview.topAnchor, left: orderitemsview.leftAnchor, bottom: nil, right: orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        constantorderView.anchor(top: Orderitemlabel.bottomAnchor, left: orderitemsview.leftAnchor, bottom: nil, right: orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        confirmBtn.anchor(top: orderitemsview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        notelabel.anchor(top: confirmBtn.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 32, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
                navView.backBtn.addTarget(self.actionDelegete, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        confirmBtn.addTarget(self.actionDelegete, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        
       
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if position == FlexibleSteppedProgressBarTextLocation.center{
            switch index {
                
            case 0: return "1"
            case 1: return "2"
            case 2: return "3"
            case 3: return "4"
                
            default: return ""
                
            }
        }
        if position == FlexibleSteppedProgressBarTextLocation.bottom {
            switch index {
                
            case 0: return "Placed"
            case 1: return "Prepaired"
            case 2: return "Shipped"
            case 3: return "Deliverd"
                
            default: return "Date"
                
            }
        }
        return ""
    }
}
