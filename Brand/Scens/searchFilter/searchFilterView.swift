//
//  searchFilterView.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
import MOLH
import Cosmos
class searchFilterView : UIView , UITextFieldDelegate{
    
//    var brand:[String]? {
//        didSet {
//            guard let brand = self.brand else{return}
//            for country in cant {
//                //  self.stateList = country.states
//                self.country.dropView.dropDownOptions.append(["name":country.name ?? "hhh","id":country.id])
//                self.country.dropView.tableView.reloadData()
//            }
//        }
//    }
    
    
    lazy var containerView: ShadowView = {
        let view = ShadowView()
        return view
    }()
    
    lazy var ExitBtn: BtnImage = {
        let button = BtnImage()
        button.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return button
    }()
    lazy var line : lineView = {
        let view = lineView()
        return view
    }()
    lazy var filterlabel:HeaderLabel = {
        let label = HeaderLabel()
        label.text = "filter".localized
        return label
    }()
    lazy var brandlabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Brand".localized
        return label
    }()
    lazy var brandDD:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.lightgray3, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        return btn
    }()
    lazy var Pricelabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Price".localized
        return label
    }()
    lazy var  fromTextFeild : DefaultTextField = {
        let from = DefaultTextField()
        from.SetAttributePlaceHeader(Title: "from".localized)
        return from
    }()
    lazy var  toTextFeild : DefaultTextField = {
        let to = DefaultTextField()
        to.SetAttributePlaceHeader(Title: "to".localized)
        return to
    }()
    lazy var Madelabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Made in".localized
        return label
    }()
    lazy var madeInDD:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.lightgray3, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        return btn
    }()
   
   
    lazy var ratelabel:HeaderLabelAlign = {
        let label = HeaderLabelAlign()
        label.text = "Rate".localized
        return label
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 14
        rate.settings.emptyBorderColor = .gray
        rate.settings.filledBorderColor = .pink
        rate.settings.emptyColor = .clear
        rate.settings.filledColor = .pink
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
   
    lazy var SaveButton: GradBtn = {
        let button = GradBtn()
        button.setTitle("apply".localized, for: .normal)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        return button
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    //MARK:- View Inits
    init(delegate:ButtonActionDelegate) {
        super.init(frame: .zero)
        self.actionDelegate = delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        toTextFeild.delegate = self
        fromTextFeild.delegate = self
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(containerView)
        containerView.addSubview(filterlabel)
        containerView.addSubview(line)
        containerView.addSubview(ExitBtn)
         containerView.addSubview(filterlabel)
         containerView.addSubview(brandlabel)
         containerView.addSubview(brandDD)
         containerView.addSubview(Pricelabel)
        containerView.addSubview(fromTextFeild)
        containerView.addSubview(toTextFeild)
         containerView.addSubview(Madelabel)
         containerView.addSubview(madeInDD)
         containerView.addSubview(ratelabel)
         containerView.addSubview(rateView)
        containerView.addSubview(SaveButton)
        containerView.anchor(top: nil, left: safeAreaLayoutGuide.leftAnchor, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 300, paddingCenterX: 0, paddingCenterY: 0)
        
        filterlabel.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            ExitBtn.anchor(top: nil, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: filterlabel.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            ExitBtn.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: filterlabel.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        }
        line.anchor(top: filterlabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 3, paddingCenterX: 0, paddingCenterY: 0)
          brandDD.anchor(top: line.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        brandlabel.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: brandDD.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        toTextFeild.anchor(top: brandDD.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 60, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        fromTextFeild.anchor(top: brandDD.bottomAnchor, left: nil, bottom: nil, right: toTextFeild.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 60, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        madeInDD.anchor(top: toTextFeild.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        Madelabel.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: madeInDD.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        rateView.anchor(top: madeInDD.bottomAnchor, left: nil, bottom: nil, right: nil , centerX: containerView.centerXAnchor, centerY: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        ratelabel.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: rateView.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        SaveButton.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
      
        brandDD.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        brandDD.imageEdgeInsets = UIEdgeInsets(top: 0, left: brandDD.frame.size.width - 28, bottom: 0, right: 8)
        madeInDD.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        madeInDD.imageEdgeInsets = UIEdgeInsets(top: 0, left: madeInDD.frame.size.width - 28, bottom: 0, right: 8)
        
        
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
