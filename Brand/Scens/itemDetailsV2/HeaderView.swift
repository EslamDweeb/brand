//
//  HeaderView.swift
//  Brand
//
//  Created by Eslam Dweeb on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class HeaderView: UIView {
    let cellID = "cellID"
    weak var actionDelegate:ButtonActionDelegate?
    
    lazy var imageCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(BannerCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .pink
        pc.pageIndicatorTintColor = .white
        pc.numberOfPages = 4
        return pc
    }()
    lazy var titlelable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Heavy", size: 16)
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6999411387)
        lable.textAlignment = .center
        lable.text = "fdslhinflkdsnlk"
        return lable
    }()
    lazy var finalPriceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Heavy", size: 20)
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6999411387)
        lable.textAlignment = .center
        lable.text = "fdslhinflkdsnlk"
        return lable
    }()
    lazy var priceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        lable.textColor = UIColor.lightDarkGray
        lable.text = "fdslhinflkdsnlk"
        return lable
    }()
    lazy var discountLbl: DiscountLable = {
        let lbl = DiscountLable()
        lbl.text = "30"
        lbl.backgroundColor = .pink
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
        lable.textColor = UIColor.lightDarkGray
        lable.text = "200"
        return lable
    }()
    lazy var customtabBar = CustomTabBar(actionDelegate: actionDelegate!)
    lazy var favBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
        btn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.flowButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    lazy var cartBtn:UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "cart22")
        btn.setImage(image, for: .normal)
        btn.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.flowButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    init(_ buttonAction:ButtonActionDelegate) {
    super.init(frame: .zero)
    self.actionDelegate = buttonAction
    imageCollectionView.delegate = self
    imageCollectionView.dataSource = self
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
        addSubview(pageControl)
        addSubview(titlelable)
        addSubview(finalPriceLable)
        addSubview(customtabBar)
        addSubview(favBtn)
        addSubview(cartBtn)
        addSubview(priceLable)
        addSubview(discountLbl)
        addSubview(rateView)
        addSubview(numberOFReviewerLable)
    }
    private func addConstraintsToSubViews(){
        imageCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230, paddingCenterX: 0, paddingCenterY: 0)
        pageControl.anchor(top: nil, left: nil, bottom: imageCollectionView.bottomAnchor, right:nil, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 0, width: 0 , height: 0, paddingCenterX: 0, paddingCenterY: 0)
        titlelable.anchor(top: imageCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        priceLable.anchor(top: titlelable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: -70, paddingCenterY: 0)
        //priceLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 64).isActive = true
        discountLbl.anchor(top: nil, left: priceLable.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 42, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        rateView.anchor(top: nil, left: discountLbl.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: discountLbl.centerYAnchor, paddingTop: 0, paddingLeft:8, paddingBottom: 0, paddingRight: 0, width: 65, height: 20, paddingCenterX: 0, paddingCenterY: 5)
        numberOFReviewerLable.anchor(top: nil, left: rateView.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        finalPriceLable.anchor(top: priceLable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        customtabBar.anchor(top: finalPriceLable.bottomAnchor, left: leftAnchor, bottom: nil , right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        
        cartBtn.anchor(top: nil , left: leftAnchor , bottom: bottomAnchor , right: nil , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0 , paddingBottom: 0 , paddingRight: 16 , width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
        
        favBtn.anchor(top: nil , left: nil , bottom: bottomAnchor , right: rightAnchor , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0 , paddingBottom: 0 , paddingRight: 16 , width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
    }
}

// Don't forget PageController number of pages
extension HeaderView:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BannerCell else{return UICollectionViewCell()}
        cell.bannerImage.contentMode = .scaleAspectFit
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
