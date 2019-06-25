//
//  CheckoutView.swift
//  Brands
//
//  Created by Nada Dyaa on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CheckOutView :UIView {
    
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = NSLocalizedString("Checkout", comment: "")
        return navView
    }()
//    lazy var backBtn: UIButton = {
//        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
//        return button
//    }()
//    lazy var titlelabel:UILabel = {
//        let label = UILabel()
//        label.text = "Checkout"
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = UIFont(name: "Avenir-Heavy", size: 14)
//        return label
//    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var label1:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Billing method", comment: "")
        lable.textColor = .black
        // lable.textAlignment = .left
        lable.font = UIFont(name: "Avenir-Heavy", size: 18)
        return lable
    }()
    lazy var viewMethod: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.65)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var viewCashMethod: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.65)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    lazy var viewCreditMethod: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.65)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    lazy var cashBtn: UIButton = {
        let button = UIButton()
       
        return button
    }()
    lazy var creditBtn: UIButton = {
        let button = UIButton()
   
        return button
    }()
    lazy var Cashlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Cash Method", comment: "")
        lable.textColor = UIColor.lightGray
         lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Medium", size: 12)
        return lable
    }()
    lazy var Creditlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Credit Method", comment: "")
        lable.textColor = UIColor.lightGray
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Medium", size: 12)
        return lable
    }()
    lazy var defaultviewcash: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.isHidden = false
        view.layer.masksToBounds = true
        return view
    }()
    lazy var defaultviewcredit: UIView = {
        let view = UIView()
        view.backgroundColor = .pink
        view.layer.cornerRadius = 3
        view.isHidden = true
        view.layer.masksToBounds = true
        return view
    }()
   
    lazy var CachImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "cartAndCash01")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var Credit1Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "masterCardDarkCopy")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var Credit2Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "visaDarkCopy")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var label2:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Shipping Addresses", comment: "")
        lable.textColor = .black
        // lable.textAlignment = .left
        lable.font = UIFont(name: "Avenir-Heavy", size: 18)
        return lable
    }()
    lazy var viewAddress: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.65)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
lazy var viewwithAddress: UIView = {
    let view = UIView()
    view.layer.borderWidth = 1
    view.layer.cornerRadius = 5
    view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.65)
    view.backgroundColor = .white
    view.layer.masksToBounds = true
    view.clipsToBounds = true
    view.isHidden = true
    return view
}()
    lazy var changeBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "invalidName-1"), for: .normal)
        return button
    }()
  
lazy var addressName: UILabel = {
    let lable = UILabel()
      lable.text = "My Home"
    lable.textColor = .black
    lable.font = UIFont(name: "Avenir-Heavy", size: 16)
    return lable
}()
lazy var addressDescription: UILabel = {
    let lable = UILabel()
    lable.text = "Ksa - Qussaim - unizaa- 24 freedom st. - 16 block "
      lable.textColor = UIColor.lightGray
    lable.numberOfLines = 0
    lable.font = UIFont(name: "Avenir-Medium", size: 14)
    lable.textColor = .lightgray
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
        return view
    }()
    lazy var addnewaddBtn: UIButton = {
        let button = UIButton()
       button.setTitle("Add New Address", for: .normal)
        button.setTitleColor(.pink, for: .normal)
         button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        button.layer.borderColor = UIColor.pink.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var addresstext: UILabel = {
        let lable = UILabel()
        lable.text = "You did Not have address yet"
        lable.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        lable.font = UIFont(name: "Avenir-Medium", size: 16)
        lable.textAlignment = .center
        return lable
    }()
    lazy var AddressImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconsFinalMyAddressesEmptyState")
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString("Continue", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        return button
    }()
    lazy var  BGView:UIView = {
        let View = UIView()
        View.isHidden = true
        View.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        return View
    }()

//    lazy var  ExchangeView:AnimatedView = {
//                let View = AnimatedView()
//        
//                return View
//            }()
    lazy var  ExchangeView:UIView = {
        let View = UIView()
        View.backgroundColor = .white
        View.layer.cornerRadius = 5
        return View
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(MyAddressCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        return tableView
    }()
    lazy var youraddlabel:UILabel = {
        let lable = UILabel()
        lable.text = NSLocalizedString("Your Addresses", comment: "")
        lable.textColor = .black
        lable.textAlignment = .left
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        return lable
    }()
    lazy var addnewadd: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)

       // button.isHidden = true
        return button
    }()

    public weak var actionDelegete : ButtonActionDelegate?
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        
        addSubview(navView)
      //  navView.addSubview(backBtn)
      //  navView.addSubview(titlelabel)
        addSubview(scrollView)
       scrollView.addSubview(label1)
        scrollView.addSubview(viewMethod)
        viewMethod.addSubview(stackView)
        stackView.addArrangedSubview(viewCashMethod)
        stackView.addArrangedSubview(viewCreditMethod)
        viewCashMethod.addSubview(defaultviewcash)
        viewCashMethod.addSubview(CachImage)
        viewCashMethod.addSubview(Cashlabel)
        viewCashMethod.addSubview(cashBtn)
        viewCreditMethod.addSubview(Creditlabel)
        viewCreditMethod.addSubview(Credit1Image)
        viewCreditMethod.addSubview(Credit2Image)
        viewCreditMethod.addSubview(defaultviewcredit)
        viewCreditMethod.addSubview(creditBtn)
      scrollView.addSubview(label2)
      scrollView.addSubview(viewAddress)
        viewAddress.addSubview(viewwithAddress)
        viewwithAddress.addSubview(addressName)
        viewwithAddress.addSubview(addressDescription)
        viewwithAddress.addSubview(defaultview)
        viewwithAddress.addSubview(changeBtn)
        viewAddress.addSubview(viewnoaddress)
        viewnoaddress.addSubview(AddressImage)
        viewnoaddress.addSubview(addresstext)
        viewnoaddress.addSubview(addnewaddBtn)
        scrollView.addSubview(save)
        addSubview(BGView)
        addSubview(ExchangeView)
        ExchangeView.addSubview(tableView)
        ExchangeView.addSubview(addnewadd)
        ExchangeView.addSubview(youraddlabel)
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
//        titlelabel.anchor(top: nil, left: nil, bottom: navView.bottomAnchor, right: nil, centerX: navView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 120, height: 20, paddingCenterX: 0, paddingCenterY: 0)
//        backBtn.anchor(top: nil, left: navView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
         scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
      label1.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
          viewMethod.anchor(top: label1.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 180, paddingCenterX: 0, paddingCenterY: 0)
        viewMethod.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        stackView.anchor(top: viewMethod.topAnchor, left: viewMethod.leftAnchor, bottom: viewMethod.bottomAnchor, right: viewMethod.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        viewCashMethod.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150, paddingCenterX: 0, paddingCenterY: 0)
         viewCashMethod.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.5, shadowRaduis: 1)
        viewCreditMethod.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150, paddingCenterX: 0, paddingCenterY: 0)
         viewCreditMethod.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.5, shadowRaduis: 1)
        
        defaultviewcash.anchor(top: viewCashMethod.topAnchor, left: viewCashMethod.leftAnchor, bottom: viewCashMethod.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
         defaultviewcredit.anchor(top: viewCreditMethod.topAnchor, left: viewCreditMethod.leftAnchor, bottom: viewCreditMethod.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
         cashBtn.anchor(top: viewCashMethod.topAnchor, left: defaultviewcash.rightAnchor, bottom: viewCashMethod.bottomAnchor, right: viewCashMethod.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        creditBtn.anchor(top: viewCreditMethod.topAnchor, left: defaultviewcredit.rightAnchor, bottom: viewCreditMethod.bottomAnchor, right: viewCreditMethod.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        CachImage.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: viewCashMethod.centerXAnchor, centerY: viewCashMethod.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60, paddingCenterX: 0, paddingCenterY: 0)
        Cashlabel.anchor(top: nil, left: defaultviewcash.rightAnchor, bottom: viewCashMethod.bottomAnchor, right: viewCashMethod.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        Credit1Image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: viewCreditMethod.centerXAnchor, centerY: viewCreditMethod.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 35, paddingCenterX: 0, paddingCenterY: -22)
        
        Credit2Image.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: viewCreditMethod.centerXAnchor, centerY: viewCreditMethod.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 35, paddingCenterX: 0, paddingCenterY: 22)
        Creditlabel.anchor(top: nil, left: defaultviewcredit.rightAnchor, bottom: viewCreditMethod.bottomAnchor, right: viewCreditMethod.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
         label2.anchor(top: viewMethod.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        viewAddress.anchor(top: label2.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 220, paddingCenterX: 0, paddingCenterY: 0)
        viewAddress.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor , shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.4, shadowRaduis: 1)
        
        viewwithAddress.anchor(top: viewAddress.topAnchor, left: viewAddress.leftAnchor, bottom: nil, right: viewAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 90, paddingCenterX: 0, paddingCenterY: 0)
        defaultview.anchor(top: viewwithAddress.topAnchor, left: viewwithAddress.leftAnchor, bottom: viewwithAddress.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 6, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addressName.anchor(top: viewwithAddress.topAnchor, left: viewwithAddress.leftAnchor, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        addressDescription.anchor(top: addressName.bottomAnchor, left: viewwithAddress.leftAnchor, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        self.viewwithAddress.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha:0.24).cgColor, shadowOffset: CGSize(width: 0, height: 3), shadowOpacity: 0.6, shadowRaduis: 1)
        changeBtn.anchor(top: viewwithAddress.topAnchor, left: nil, bottom: nil, right: viewwithAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 15, height: 15, paddingCenterX: 0, paddingCenterY: 0)
        
         viewnoaddress.anchor(top: viewAddress.topAnchor, left: viewAddress.leftAnchor, bottom: viewAddress.bottomAnchor, right: viewAddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 90, paddingCenterX: 0, paddingCenterY: 0)
        AddressImage.anchor(top: viewnoaddress.topAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 105, paddingCenterX: 0, paddingCenterY: 0)
          addresstext.anchor(top: AddressImage.bottomAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addnewaddBtn.anchor(top: addresstext.bottomAnchor, left: viewnoaddress.leftAnchor, bottom: nil, right: viewnoaddress.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        save.anchor(top: viewAddress.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft:8, paddingBottom: 16, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)


        ExchangeView.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        youraddlabel.anchor(top: ExchangeView.topAnchor, left: ExchangeView.leftAnchor, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 50, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        tableView.anchor(top: youraddlabel.bottomAnchor, left: ExchangeView.leftAnchor, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        addnewadd.anchor(top: ExchangeView.topAnchor, left: nil, bottom: nil, right: ExchangeView.rightAnchor, centerX: nil, centerY: nil, paddingTop: -25, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 50, height: 50, paddingCenterX: 0, paddingCenterY: 0)


        BGView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        cashBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.defaultmethod1), for: .touchUpInside)
          creditBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.defaultmethod2), for: .touchUpInside)
          navView.backBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
          changeBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.changeBtn), for: .touchUpInside)
        addnewaddBtn.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.addBtn), for: .touchUpInside)
       addnewadd.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.addBtn), for: .touchUpInside) 
        save.addTarget(actionDelegete, action:#selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)

        
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
