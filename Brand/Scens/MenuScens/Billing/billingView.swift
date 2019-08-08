//
//  billingView.swift
//  Brand
//
//  Created by nada dyaa on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import  UIKit
import MOLH

class BillingView : UIView ,  UITextFieldDelegate {
    var hieghtConstrainView:NSLayoutConstraint?
      var hieghtConstrainViewcopoun:NSLayoutConstraint?
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
    lazy var copounView : ShadowView = {
        let view = ShadowView()
        return view
    }()
    lazy var copounlbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Apply Copoun".localized
        return lable
    }()
    
    lazy var  copounTextFeild : DefaultTextField = {
        let copoun = DefaultTextField()
        let title = "copoun".localized
        copoun.SetAttributePlaceHeader(Title: title)
        return copoun
    }()
    lazy var copoundiscount:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Copoun_discount".localized
        lable.isHidden = true
        return lable
    }()
    lazy var Amountlbl:DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.text = "Amount".localized
        lable.isHidden = true
        return lable
    }()
    lazy var Copounlbltext:DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.text = "Copoun_discount".localized
        lable.isHidden = true
        return lable
    }()
    lazy var AmountSArlbl:DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.text = "10235 SAR".localized
        lable.isHidden = true
        return lable
    }()
    lazy var CopounSArlbl:DescriptionLabel = {
        let lable = DescriptionLabel()
        lable.text = "20%".localized
        lable.isHidden = true
        return lable
    }()
    lazy var Totallbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "totalAmount".localized
        lable.isHidden = true
        return lable
    }()
    lazy var Sarlbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "8000 SAR".localized
        lable.isHidden = true
        lable.textColor = .pink
        return lable
    }()
    lazy var rightBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "checkSimpleLineIcons"), for: .normal)
         button.isHidden = true
        return button
    }()
    
    lazy var billingMethodlbl:HeaderLabelAlign = {
        let lable = HeaderLabelAlign()
        lable.text = "Pilling_method".localized
        return lable
    }()
    lazy var BillingCollectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BillingMethodCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor  = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    lazy var save: GradBtn = {
        let button = GradBtn()
        button.setTitle("txt_continue".localized, for: .normal)
        return button
    }()
    public weak var actionDelegete : ButtonActionDelegate?
    func setup()  {
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        addSubview(navView)
        addSubview(scrollView)
        addSubview(copounView)
        copounView.addSubview(copounlbl)
        copounView.addSubview(copounTextFeild)
        addSubview(billingMethodlbl)
        addSubview(BillingCollectionview)
        addSubview(save)
        addSubview(copoundiscount)
        addSubview(Amountlbl)
        addSubview(AmountSArlbl)
        addSubview(Copounlbltext)
        addSubview(CopounSArlbl)
        addSubview(Totallbl)
        addSubview(Sarlbl)
        copounTextFeild.delegate = self
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        copounView.anchor(top: scrollView.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        hieghtConstrainViewcopoun = copounView.heightAnchor.constraint(equalToConstant: 120)
        hieghtConstrainViewcopoun?.isActive = true
        copounlbl.anchor(top: copounView.topAnchor, left: copounView.leftAnchor, bottom: nil, right: copounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
         copounTextFeild.anchor(top: copounlbl.bottomAnchor, left: copounView.leftAnchor, bottom: nil, right: copounView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        
        copoundiscount.anchor(top: copounTextFeild.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en" {
            Amountlbl.anchor(top: copoundiscount.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            Copounlbltext.anchor(top: Amountlbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            Totallbl.anchor(top: Copounlbltext.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            AmountSArlbl.anchor(top: copoundiscount.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            CopounSArlbl.anchor(top: AmountSArlbl.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            Sarlbl.anchor(top: CopounSArlbl.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            AmountSArlbl.textAlignment = .right
            CopounSArlbl.textAlignment = .right
            Sarlbl.textAlignment = .right
                 copounTextFeild.textAlignment = .left
        }else{
            Amountlbl.anchor(top: copoundiscount.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            Copounlbltext.anchor(top: Amountlbl.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            Totallbl.anchor(top: Copounlbltext.bottomAnchor, left:nil, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            AmountSArlbl.anchor(top: copoundiscount.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            CopounSArlbl.anchor(top: AmountSArlbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            Sarlbl.anchor(top: CopounSArlbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            AmountSArlbl.textAlignment = .left
            CopounSArlbl.textAlignment = .left
            Sarlbl.textAlignment = .left
            copounTextFeild.textAlignment = .right
            
        }
        
        
        billingMethodlbl.anchor(top: copounView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        BillingCollectionview.anchor(top: billingMethodlbl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        hieghtConstrainView = BillingCollectionview.heightAnchor.constraint(equalToConstant: 0)
        hieghtConstrainView?.isActive = true
        save.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 24, paddingRight: 8, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
      
        save.addTarget(actionDelegete, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        copounTextFeild.addTarget(actionDelegete, action: #selector(ButtonActionDelegate.changeBtn), for: .editingChanged)
        
            copounTextFeild.rightView = rightBtn
            copounTextFeild.rightViewMode = .always
       
        
    }
    init(delegete  : ButtonActionDelegate , collectiondelegete : UICollectionViewDelegate , collectionDatasource : UICollectionViewDataSource ) {
        super.init(frame: .zero)
          self.actionDelegete = delegete
        BillingCollectionview.dataSource = collectionDatasource
        BillingCollectionview.delegate = collectiondelegete
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
