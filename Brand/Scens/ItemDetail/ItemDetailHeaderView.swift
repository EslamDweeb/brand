//
//  ItemDetailHeaderView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos
class ItemDetailHeaderView: UIView {
    
    let cellID = "cellID"
    weak var actionDelegate:ButtonActionDelegate?
    
    lazy var imageCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(BannerCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        return collection
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrow-back-rtl"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return button
    }()
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .pink
        pc.pageIndicatorTintColor = .white
        return pc
    }()
    lazy var titlelable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        lable.textColor = .white
        lable.textAlignment = .center
        return lable
    }()
    lazy var finalPriceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Heavy", size: 20)
        lable.textColor = .white
        lable.textAlignment = .center
        return lable
    }()
    lazy var priceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        lable.textColor = .white
        return lable
    }()
    lazy var discountLbl: DiscountLable = {
        let lbl = DiscountLable()
        return lbl
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 10
        rate.settings.filledImage = #imageLiteral(resourceName: "emptyStar")
        rate.settings.emptyImage = #imageLiteral(resourceName: "fill")
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
    lazy var numberOFReviewerLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Medium", size: 11)
        lable.textColor = .white
        return lable
    }()
    lazy var stackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.addArrangedSubview(priceLable)
        stack.addArrangedSubview(discountLbl)
        stack.addArrangedSubview(rateView)
        stack.addArrangedSubview(numberOFReviewerLable)
        return stack
    }()
    init(_ collectionDelegate:UICollectionViewDelegate,_ collectionDataSource:UICollectionViewDataSource,_ buttonAction:ButtonActionDelegate){
        super.init(frame: .zero)
        self.actionDelegate = buttonAction
        imageCollectionView.delegate = collectionDelegate
        imageCollectionView.dataSource = collectionDataSource
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        addSubViews()
        addConstraintsToSubViews()
    }
    private func addSubViews(){
        addSubview(imageCollectionView)
        addSubview(backBtn)
        addSubview(titlelable)
        addSubview(stackView)
    }
    private func addConstraintsToSubViews(){
        imageCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 42, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
         pageControl.anchor(top: nil, left: nil, bottom: imageCollectionView.bottomAnchor, right:nil, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0 , height: 0, paddingCenterX: 0, paddingCenterY: 0)
        titlelable.anchor(top: pageControl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        stackView.anchor(top: titlelable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        finalPriceLable.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        priceLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLable.widthAnchor.constraint(equalToConstant: 65).isActive = true
        discountLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        discountLbl.widthAnchor.constraint(equalToConstant: 42).isActive = true
        rateView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rateView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        numberOFReviewerLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        numberOFReviewerLable.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
