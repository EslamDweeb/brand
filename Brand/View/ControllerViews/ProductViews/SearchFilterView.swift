//
//  SearchFilterView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos
import MOLH
class SearchFilterView: UIView , UITextFieldDelegate{
    
 
    var brands : [String]? {
        didSet {
            guard let brand = brands else {return}
            for i in brand {
                 self.bradDropDown.dropView.dropDownOptions.append(["name" : i])
            }
            self.bradDropDown.dropView.tableView.reloadData()
        }
    }
    
    var madeIn : [String]? {
        didSet {
            guard let made = madeIn else {return}
            for i in made {
                self.madeInDropDown.dropView.dropDownOptions.append(["name" : i])
            }
            self.madeInDropDown.dropView.tableView.reloadData()
        }
    }
    
    
    
    
    weak var delegate:ButtonActionDelegate?
    
    lazy var containerView: ShadowView = {
        let view = ShadowView()
        return view
    }()
    lazy var HeaderView: UIView = {
        let v = UIView()
        return v
    }()
    lazy var titleLable:UILabel = {
        let title = UILabel()
        title.text = "Search filter".localized
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    lazy var dissBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal)
        btn.addTarget(delegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return btn
    }()
    lazy var lineView:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        return v
    }()
    lazy var brandLable:HeaderLabel = {
        let title = HeaderLabel()
        title.text = "Brand".localized
        return title
    }()
    lazy var bradDropDown:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.lightgray3, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
      //  btn.titleLabel?.textAlignment = .center
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        return btn
    }()
    lazy var priceLable:HeaderLabel = {
        let title = HeaderLabel()
        title.text = "price".localized
        return title
    }()
    lazy var  fromTextFeild : DefaultTextField = {
        let from = DefaultTextField()
        from.clearButtonMode = .whileEditing
        from.SetAttributePlaceHeader(Title: "from".localized)
        return from
    }()
    lazy var  toTextFeild : DefaultTextField = {
        let to = DefaultTextField()
        to.SetAttributePlaceHeader(Title: "to".localized)
        return to
    }()
    lazy var madeInLable:HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Made_in".localized
        label.numberOfLines = 0
        return label
    }()
    lazy var madeInDropDown:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.lightgray3, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
      
        return btn
    }()
//    lazy var sizeLable:UILabel = {
//        let title = UILabel()
//        title.text = "Size"
//        title.textColor = .black
//          title.font = UIFont(name: "Avenir-Heavy", size: 14)
//        title.textAlignment = .center
//        return title
//    }()
//    lazy var sizeDropDown:DropDownBtn = {
//        let btn = DropDownBtn()
//        btn.setTitleColor(.black, for: .normal)
//        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//        //btn.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
//        return btn
//    }()
    lazy var rateLable:HeaderLabel = {
        let rate = HeaderLabel()
        rate.text = "rate".localized
        return rate
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = true
        rate.settings.starSize = 25
        rate.settings.emptyBorderColor = .lightGray
        rate.settings.filledBorderColor = .pink
        rate.settings.emptyColor = .clear
        rate.settings.filledColor = .pink
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        rate.rating = 0
        return rate
    }()
    lazy var textStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 16
     
        return stackView
    }()
    lazy var applyButton: GradBtn = {
        let button = GradBtn()
        button.setTitle("apply".localized, for: .normal)
      //  button.addTarget(delegate, action: #selector(ButtonActionDelegate.saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(delegate:ButtonActionDelegate){
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToSuperview() {
        containerView.bringSubviewToFront(bradDropDown.dropView)
       containerView.bringSubviewToFront(madeInDropDown.dropView)
      //  containerView.bringSubviewToFront(applyButton)
        
    }

    private func setup(){
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        addSubViews()
        addConstrainsToUI()
        fromTextFeild.setPadding(left: 16, right: nil)
        toTextFeild.setPadding( left: 16, right: nil)
    }
    private func addSubViews(){
        self.addSubview(containerView)
      
        containerView.addSubview(HeaderView)
        HeaderView.addSubview(titleLable)
        HeaderView.addSubview(dissBtn)
        HeaderView.addSubview(lineView)

        containerView.addSubview(applyButton)
        containerView.addSubview(brandLable)
        containerView.addSubview(bradDropDown)
        containerView.addSubview(priceLable)
        containerView.addSubview(textStackView)
        textStackView.addArrangedSubview(fromTextFeild)
        textStackView.addArrangedSubview(toTextFeild)
    //   containerView.addSubview(sizeLable)
        containerView.addSubview(madeInLable)
        containerView.addSubview(madeInDropDown)
      //  containerView.addSubview(sizeDropDown)
        containerView.addSubview(rateLable)
        containerView.addSubview(rateView)

        
        toTextFeild.delegate = self
        fromTextFeild.delegate = self
    }
    private func addConstrainsToUI() {
        containerView.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 340, paddingCenterX: 0, paddingCenterY: 0)
        addConstraintToHeaderView()
        if MOLHLanguage.currentAppleLanguage()  == "en" {
          
            brandLable.anchor(top: HeaderView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            priceLable.anchor(top: brandLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            madeInLable.anchor(top: priceLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 65, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            //           sizeLable.anchor(top: madeInLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            fromTextFeild.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            rateLable.anchor(top: madeInLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            bradDropDown.anchor(top: nil, left: brandLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: brandLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            textStackView.anchor(top: nil, left: priceLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            madeInDropDown.anchor(top: nil, left: madeInLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: madeInLable.centerYAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 16, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            //          sizeDropDown.anchor(top: nil, left: sizeLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: sizeLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
            rateView.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: rateLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 30, paddingCenterX: 10, paddingCenterY: 0)
            

            
        }else {
            brandLable.anchor(top: HeaderView.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            priceLable.anchor(top: brandLable.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            madeInLable.anchor(top: priceLable.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 0, paddingCenterX: 0, paddingCenterY: 0)
            //           sizeLable.anchor(top: madeInLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            rateLable.anchor(top: madeInLable.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            bradDropDown.anchor(top: nil, left: containerView.leftAnchor , bottom: nil, right: brandLable.leftAnchor, centerX: nil, centerY: brandLable.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 30, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            textStackView.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: priceLable.leftAnchor, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 30, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            madeInDropDown.anchor(top: nil, left: containerView.leftAnchor, bottom: nil, right: madeInLable.leftAnchor, centerX: nil, centerY: madeInLable.centerYAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 30, width: 0, height: 35, paddingCenterX: 0, paddingCenterY: 0)
            //          sizeDropDown.anchor(top: nil, left: sizeLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: sizeLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
            rateView.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: rateLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 30, paddingCenterX: 10, paddingCenterY: 0)
            
            
        }
      
       
        fromTextFeild.heightAnchor.constraint(equalToConstant: 30).isActive = true
        toTextFeild.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        applyButton.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        applyButton.addTarget(delegate, action: #selector(ButtonActionDelegate.continuePressed), for: .touchUpInside)
    }
    private func addConstraintToHeaderView() {
        HeaderView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        titleLable.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: HeaderView.centerXAnchor, centerY: HeaderView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en" {
            dissBtn.anchor(top: nil, left: nil, bottom: nil, right: HeaderView.rightAnchor, centerX: nil, centerY: titleLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else {
            
           dissBtn.anchor(top: nil, left: HeaderView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: titleLable.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }
        
        lineView.anchor(top: nil, left: HeaderView.leftAnchor, bottom: HeaderView.bottomAnchor, right: HeaderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
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
    override func layoutSubviews() {
        super.layoutSubviews()
         if MOLHLanguage.currentAppleLanguage() == "en" {
        bradDropDown.contentHorizontalAlignment = .left
        bradDropDown.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        bradDropDown.imageEdgeInsets = UIEdgeInsets(top: 0, left: bradDropDown.frame.size.width - 28, bottom: 0, right: 8)
        madeInDropDown.contentHorizontalAlignment = .left
        madeInDropDown.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 28)
        madeInDropDown.imageEdgeInsets = UIEdgeInsets(top: 0, left: madeInDropDown.frame.size.width - 28, bottom: 0, right: 8)
         }else{
            bradDropDown.contentHorizontalAlignment = .right
            bradDropDown.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 1)
            bradDropDown.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: bradDropDown.frame.size.width - 28)
            madeInDropDown.contentHorizontalAlignment = .right
            madeInDropDown.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 1)
            madeInDropDown.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: madeInDropDown.frame.size.width - 28)
        }
        
    }
}
