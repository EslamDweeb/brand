//
//  Order_Details_View.swift
//  Brands
//
//  Created by nada dyaa on 3/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
 import UIKit

 import FlexibleSteppedProgressBar
class DetailsOrder_View : UIView , UITextFieldDelegate ,FlexibleSteppedProgressBarDelegate {
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("Order_Details", comment: "")
        return navView
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var  detailsorderView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var Orderdetailslabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = NSLocalizedString("Order_Details", comment: "")
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var  totalView:OrderDetailsView = {
        let View = OrderDetailsView()
        View.namelabel.text = NSLocalizedString("Amount", comment: "")
        View.namelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.text = NSLocalizedString("10293 SAR", comment: "")
        View.Pricelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.textColor = .pink
        return View
    }()
    lazy var orderstatusview: UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var Orderstatuslabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = NSLocalizedString("Order_Status", comment: "")
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.textAlignment = .left
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
        status.currentIndex = 2
        status.stepTextFont = UIFont(name: "Avenir-Medium", size: 12)
        return status
    }()
    lazy var addressview: UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    
  
    lazy var addressName: UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("My Home", comment: "")
        
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        return lable
    }()
    lazy var addressDescription: UILabel = {
        let lable = UILabel()
        lable.text = " Ksa - Qussaim - unizaa- 24 freedom st. - 16 block"
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        lable.textColor = .black
        return lable
    }()
    
    lazy var  orderitemsview:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var Orderitemlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Order_Items", comment: "")
        lable.textColor = .black
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        return lable
    }()
    lazy var  constantorderView:productCheckout = {
        let View = productCheckout()
        View.namelabel.text = NSLocalizedString("Name", comment: "")
        View.namelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Qlabel.text = NSLocalizedString("QTY", comment: "")
        View.Qlabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.text = NSLocalizedString("Unit price", comment: "")
        View.Pricelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        return View
    }()
    
    
    
    lazy var confirmBtn: GradBtn = {
        let button = GradBtn()
        let title = NSLocalizedString("Cancel Order", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        return button
    }()
    lazy var notelabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Cancelorderafter24", comment: "")
        lable.textColor = .lightgray2
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Medium", size: 12)
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
        scrollView.addSubview(orderstatusview)
        orderstatusview.addSubview(Orderstatuslabel)
        orderstatusview.addSubview(Statusbar)
        scrollView.addSubview(addressview)
        addressview.addSubview(addressName)
        addressview.addSubview(addressDescription)
        scrollView.addSubview(orderitemsview)
        orderitemsview.addSubview(Orderitemlabel)
        orderitemsview.addSubview(constantorderView)
        scrollView.addSubview(confirmBtn)
        scrollView.addSubview(notelabel)
        
        Statusbar.delegate = self
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        detailsorderView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:0, paddingCenterX: 0, paddingCenterY: 0)
        detailsorderView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderdetailslabel.anchor(top: detailsorderView.topAnchor, left: detailsorderView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        totalView.anchor(top: nil, left: detailsorderView.leftAnchor, bottom: detailsorderView.bottomAnchor, right: detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        orderstatusview.anchor(top: detailsorderView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:120, paddingCenterX: 0, paddingCenterY: 0)
        orderstatusview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderstatuslabel.anchor(top: orderstatusview.topAnchor, left: orderstatusview.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
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
