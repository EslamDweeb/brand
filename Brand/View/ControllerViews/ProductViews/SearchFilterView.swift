//
//  SearchFilterView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class SearchFilterView: UIView {
    
    weak var delegate:ButtonActionDelegate?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCornerRadius(radius: 5)
        return view
    }()
    lazy var HeaderView: UIView = {
        let v = UIView()
        return v
    }()
    lazy var titleLable:UILabel = {
        let title = UILabel()
        title.text = "Search filter"
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
    lazy var brandLable:UILabel = {
        let title = UILabel()
        title.text = "Brand"
        title.textColor = .black
        title.textAlignment = .center
        title.font = UIFont(name: "Avenir-Heavy", size: 14)
        return title
    }()
    lazy var bradDropDown:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.black, for: .normal)
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
         //btn.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        return btn
    }()
    lazy var priceLable:UILabel = {
        let title = UILabel()
        title.text = "Price"
        title.textColor = .black
          title.font = UIFont(name: "Avenir-Heavy", size: 14)
        title.textAlignment = .center
        return title
    }()
    lazy var  fromTextFeild : DefaultTextField = {
        let from = DefaultTextField()
       // let title = NSLocalizedString("firstName", comment: "")
        from.clearButtonMode = .whileEditing
        from.attributedPlaceholder = NSAttributedString(string: "From", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        from.layer.borderColor = UIColor.lightgray.cgColor
        return from
    }()
    lazy var  toTextFeild : DefaultTextField = {
        let to = DefaultTextField()
        // let title = NSLocalizedString("firstName", comment: "")
       to.clearButtonMode = .whileEditing
       to.attributedPlaceholder = NSAttributedString(string: "To", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        to.layer.borderColor = UIColor.lightgray.cgColor
        return to
    }()
    lazy var madeInLable:UILabel = {
        let rate = UILabel()
        rate.text = "Made in"
        rate.textColor = .black
        rate.font = UIFont(name: "Avenir-Heavy", size: 14)
        rate.textAlignment = .center
        return rate
    }()
    lazy var madeInDropDown:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.black, for: .normal)
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        //btn.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        return btn
    }()
    lazy var sizeLable:UILabel = {
        let title = UILabel()
        title.text = "Size"
        title.textColor = .black
          title.font = UIFont(name: "Avenir-Heavy", size: 14)
        title.textAlignment = .center
        return title
    }()
    lazy var sizeDropDown:DropDownBtn = {
        let btn = DropDownBtn()
        btn.setTitleColor(.black, for: .normal)
        btn.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        btn.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        //btn.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        return btn
    }()
    lazy var rateLable:UILabel = {
        let rate = UILabel()
        rate.text = "Rate"
        rate.textColor = .black
        rate.font = UIFont(name: "Avenir-Heavy", size: 14)
        rate.textAlignment = .center
        return rate
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = true
        rate.settings.starSize = 25
        rate.settings.emptyBorderColor = .lightgray
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
        button.setTitle(NSLocalizedString("Apply", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        button.addTarget(delegate, action: #selector(ButtonActionDelegate.applyBtnTapped), for: .touchUpInside)
        return button
    }()
    
    init(delegate:ButtonActionDelegate){
        super.init(frame: .zero)
        setup()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToSuperview() {
        containerView.bringSubviewToFront(bradDropDown.dropView)
        containerView.bringSubviewToFront(sizeDropDown.dropView)
        containerView.bringSubviewToFront(madeInDropDown.dropView)
        
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
       containerView.addSubview(sizeLable)
        containerView.addSubview(madeInLable)
        containerView.addSubview(madeInDropDown)
        containerView.addSubview(sizeDropDown)
        containerView.addSubview(rateLable)
        containerView.addSubview(rateView)

    }
    private func addConstrainsToUI() {
        containerView.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, centerX: self.centerXAnchor, centerY: self.centerYAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 380, paddingCenterX: 0, paddingCenterY: 0)
        addConstraintToHeaderView()
        
        brandLable.anchor(top: HeaderView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           priceLable.anchor(top: brandLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
         madeInLable.anchor(top: priceLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 65, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           sizeLable.anchor(top: madeInLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           rateLable.anchor(top: sizeLable.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 45, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        bradDropDown.anchor(top: nil, left: brandLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: brandLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
          textStackView.anchor(top: nil, left: priceLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
            madeInDropDown.anchor(top: nil, left: madeInLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: madeInLable.centerYAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
          sizeDropDown.anchor(top: nil, left: sizeLable.rightAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: sizeLable.centerYAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
          rateView.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: containerView.centerXAnchor, centerY: rateLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 30, paddingCenterX: 10, paddingCenterY: 0)
        

        fromTextFeild.heightAnchor.constraint(equalToConstant: 30).isActive = true
        toTextFeild.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        applyButton.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
    }
    private func addConstraintToHeaderView() {
        HeaderView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        titleLable.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: HeaderView.centerXAnchor, centerY: HeaderView.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        dissBtn.anchor(top: nil, left: nil, bottom: nil, right: HeaderView.rightAnchor, centerX: nil, centerY: titleLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        lineView.anchor(top: nil, left: HeaderView.leftAnchor, bottom: HeaderView.bottomAnchor, right: HeaderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
    }
}