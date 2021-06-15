//
//  FinalCheckoutView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class FinalCheckOutView :UIView ,UITextFieldDelegate {
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("Checkout", comment: "")
        return navView
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var label1:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Order review", comment: "")
        lable.textColor = .black
        // lable.textAlignment = .left
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        return lable
    }()
    lazy var  productsView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
  
    lazy var  constantproductView:productCheckout = {
        let View = productCheckout()
        View.namelabel.text = NSLocalizedString("Name", comment: "")
        View.namelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Qlabel.text = NSLocalizedString("QTY", comment: "")
        View.Qlabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.text = NSLocalizedString("Unit price", comment: "")
        View.Pricelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        return View
    }()
    lazy var  methodView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var methodlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Pay cash on delivery", comment: "")
        lable.textColor = UIColor.black
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Heavy", size: 14)
        return lable
    }()
    lazy var defaultviewmethod: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
      //  view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    lazy var Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash01")
        img.contentMode = .scaleAspectFit
        return img
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
        lable.text = NSLocalizedString(" Ksa - Qussaim - unizaa- 24 freedom st. - 16 block", comment: "")
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        lable.textColor = .lightgray
        return lable
    }()
    
    lazy var defaultaddressview: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.masksToBounds = true
        return view
    }()
    lazy var  OrderView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var Orderlabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = NSLocalizedString("Order details", comment: "")
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
    lazy var  CopounView:UIView = {
        let View = UIView()
        View.layer.borderWidth = 1
        View.layer.cornerRadius = 5
        View.backgroundColor = .white
        View.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 0.6473371479)
        return View
    }()
    lazy var Copounlabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = NSLocalizedString("Apply Copoun", comment: "")
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    lazy var  CopounTextFeild : DefaultTextField = {
        let copoun = DefaultTextField()
        copoun.clearButtonMode = .whileEditing
        let title = NSLocalizedString("Copoun", comment: "")
        copoun.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return copoun
    }()
    
    lazy var CopounDisclabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = NSLocalizedString("Copoun discount", comment: "")
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    lazy var  CopounAmountView:OrderDetailsView = {
        let View = OrderDetailsView()
        View.namelabel.text = NSLocalizedString("Amount", comment: "")
        View.Pricelabel.text = NSLocalizedString("10293 SAR", comment: "")
        return View
    }()
    lazy var  CopounDiscountView:OrderDetailsView = {
        let View = OrderDetailsView()
        View.namelabel.text = NSLocalizedString("Copoun discount", comment: "")
        View.Pricelabel.text = NSLocalizedString("20%", comment: "")
        return View
    }()
    lazy var  CopountotalView:OrderDetailsView = {
        let View = OrderDetailsView()
        View.namelabel.text = NSLocalizedString("Total Amount", comment: "")
        View.namelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.text = NSLocalizedString("8000 SAR", comment: "")
        View.Pricelabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        View.Pricelabel.textColor = .pink
        return View
    }()
    
    lazy var confirmBtn: GradBtn = {
        let button = GradBtn()
        let title = NSLocalizedString("Confirm & Pay", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        return button
    }()
    public weak var actionDelegete : ButtonActionDelegate?
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        
        addSubview(navView)
        addSubview(scrollView)
        scrollView.addSubview(label1)
        scrollView.addSubview(productsView)
        productsView.addSubview(constantproductView)
        scrollView.addSubview(methodView)
        methodView.addSubview(defaultviewmethod)
        methodView.addSubview(methodlabel)
        methodView.addSubview(Image)
        scrollView.addSubview(addressview)
        addressview.addSubview(addressName)
        addressview.addSubview(addressDescription)
        addressview.addSubview(defaultaddressview)
        scrollView.addSubview(OrderView)
        OrderView.addSubview(Orderlabel)
        OrderView.addSubview(totalView)
        scrollView.addSubview(CopounView)
        CopounView.addSubview(Copounlabel)
         CopounView.addSubview(CopounTextFeild)
         CopounView.addSubview(CopounDisclabel)
         CopounView.addSubview(CopounAmountView)
         CopounView.addSubview(CopounDiscountView)
         CopounView.addSubview(CopountotalView)
        scrollView.addSubview(confirmBtn)
       CopounTextFeild.delegate = self
        navView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        label1.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 24, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        productsView.anchor(top: label1.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        productsView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        constantproductView.anchor(top: productsView.topAnchor, left: productsView.leftAnchor, bottom: nil, right: productsView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        methodView.anchor(top: productsView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60, paddingCenterX: 0, paddingCenterY: 0)
        methodView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        methodlabel.anchor(top: nil, left: methodView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: methodView.centerYAnchor, paddingTop: 0, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        Image.anchor(top: nil, left: nil, bottom: nil, right: methodView.rightAnchor, centerX: nil, centerY: methodView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
              defaultviewmethod.anchor(top: methodView.topAnchor, left: methodView.leftAnchor, bottom: methodView.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addressview.anchor(top: methodView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 75, paddingCenterX: 0, paddingCenterY: 0)
        defaultaddressview.anchor(top: addressview.topAnchor, left: addressview.leftAnchor, bottom: addressview.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addressName.anchor(top: addressview.topAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 24, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: addressview.leftAnchor, bottom: nil, right: addressview.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 24, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressview.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        
        OrderView.anchor(top: addressview.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:0, paddingCenterX: 0, paddingCenterY: 0)
        OrderView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Orderlabel.anchor(top: OrderView.topAnchor, left: OrderView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        totalView.anchor(top: nil, left: OrderView.leftAnchor, bottom: OrderView.bottomAnchor, right: OrderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        CopounView.anchor(top: OrderView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:200, paddingCenterX: 0, paddingCenterY: 0)
        CopounView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        Copounlabel.anchor(top: CopounView.topAnchor, left: CopounView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        CopounTextFeild.anchor(top: Copounlabel.bottomAnchor, left: CopounView.leftAnchor, bottom: nil, right: CopounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        CopounTextFeild.setPadding(left: 16, right: nil)
        CopounDisclabel.anchor(top: CopounTextFeild.bottomAnchor, left: CopounView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        CopounAmountView.anchor(top: CopounDisclabel.bottomAnchor, left: CopounView.leftAnchor, bottom: nil, right: CopounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        CopounDiscountView.anchor(top: CopounAmountView.bottomAnchor, left: CopounView.leftAnchor, bottom: nil, right: CopounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        CopountotalView.anchor(top: CopounDiscountView.bottomAnchor, left: CopounView.leftAnchor, bottom: nil, right: CopounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        confirmBtn.anchor(top: CopounView.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
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
}
