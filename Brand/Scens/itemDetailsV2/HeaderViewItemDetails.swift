//
//  HeaderView.swift
//  Brand
//
//  Created by Eslam Dweeb on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class HeaderViewItemDetails : UIView {
    let cellID = "cellID"
    weak var actionDelegate:ButtonActionDelegate?
    var isfav = false
    var imagesSlide : [Media] = []
    
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
        lable.numberOfLines = 0
        lable.text = "                    "
        return lable
    }()
    lazy var finalPriceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Heavy", size: 20)
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6999411387)
        lable.textAlignment = .center
        lable.text = "            "
        return lable
    }()
    lazy var priceLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Medium", size: 14)
        lable.textColor = UIColor.lightDarkGray
        lable.text = "              "
        return lable
    }()
    lazy var discountLbl: DiscountLable = {
        let lbl = DiscountLable()
        lbl.text = "   "
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
        lable.text = "(200 users)"
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
    lazy var horizontalStackView:UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(priceLable)
        stack.addArrangedSubview(discountLbl)
        stack.addArrangedSubview(rateView)
        stack.addArrangedSubview(numberOFReviewerLable)
        //stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 5
        return stack
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
        self.backgroundColor = .white
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
        addSubview(horizontalStackView)
//        addSubview(priceLable)
//        addSubview(discountLbl)
//        addSubview(rateView)
//        addSubview(numberOFReviewerLable)
    }
    private func addConstraintsToSubViews(){
        imageCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, trailing: trailingAnchor,  height: 230)
        pageControl.anchor( bottom: imageCollectionView.bottomAnchor,centerX: centerXAnchor, paddingBottom: 6)
        titlelable.anchor(top: imageCollectionView.bottomAnchor, leading: leadingAnchor, bottom:horizontalStackView.topAnchor ,trailing: trailingAnchor, paddingTop: 8, paddingLeft: 8,paddingBottom:8,paddingRight: 8)
        horizontalStackView.anchor(top: titlelable.bottomAnchor,  centerX: centerXAnchor, paddingTop: 8)
        finalPriceLable.anchor(top: horizontalStackView.bottomAnchor,leading: leadingAnchor, bottom: customtabBar.topAnchor, trailing: trailingAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
       customtabBar.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, height: 50)
        cartBtn.anchor(leading: leadingAnchor,bottom: bottomAnchor,paddingBottom:25 ,paddingRight: 16, width: 45, height: 45)
        favBtn.anchor(bottom: bottomAnchor, trailing: trailingAnchor,paddingBottom:25 ,paddingRight: 16, width: 45, height: 45)
    }
    
    
    func setData(rating:Double,numberOfuserRating:Double,price:Float,sale:Float,name:String,numberOfPages:Int,fav : Bool){
        if sale != 0 {
            self.rateView.rating = rating
            self.titlelable.text = name
            self.priceLable.setAttributeStringWithStrike("\(price)")
            self.discountLbl.text = ReturnPricepersent(sale: Double(sale))
            self.numberOFReviewerLable.text = "(\(numberOfuserRating) user)"
            self.finalPriceLable.text = "\(getFinalPrice(price:Double(price), sale: Double(sale)))"
            self.pageControl.numberOfPages = numberOfPages
        }else{
            self.rateView.rating = rating
            self.titlelable.text = name
            //self.priceLable.setAttributeStringWithStrike("\(price)")
            priceLable.isHidden = true
            discountLbl.isHidden = true
            self.numberOFReviewerLable.text = "(\(numberOfuserRating) user)"
            self.finalPriceLable.text = "\(getFinalPrice(price:Double(price), sale: Double(sale)))"
            self.pageControl.numberOfPages = numberOfPages
        }
         isfav = fav
        if fav {
            favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
           
        }else{

            favBtn.setImage(#imageLiteral(resourceName: "fav-outline"), for: .normal)
        }
       
    }
    private func getFinalPrice(price:Double,sale:Double) -> Double{
        //        "\(con.ReturnPriceAfterSale(price: con.price , sale: Double(con.sale).roundToDecimal(3))) \("sar".localized)"
        
        return (price - (price * sale).roundToDecimal(1))
        // return price - (price * (sale ?? 1))
    }
    func ReturnPricepersent(sale:Double) -> String{
        return "\( Int(Double(round(sale * 100) / 100).roundToDecimal(1) * 100)) %"
    }
    
}

// Don't forget PageController number of pages
extension HeaderViewItemDetails :UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BannerCell else{return UICollectionViewCell()}
        let path = imagesSlide[indexPath.row].path
        cell.bannerImage.kf.setImage(with: URL(string: path)! )
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
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        self.pageControl.currentPage = Int(x/self.frame.width)
    }
}
