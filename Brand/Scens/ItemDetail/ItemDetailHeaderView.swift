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
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var backBouttonRoundView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0.1962489298)
        view.addSubview(backBtn)
        return view
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        //button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return button
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
    init(_ collectionDelegate:UICollectionViewDelegate,_ collectionDataSource:UICollectionViewDataSource,_ buttonAction:ButtonActionDelegate){
        super.init(frame: .zero)
        self.actionDelegate = buttonAction
        imageCollectionView.delegate = collectionDelegate
        imageCollectionView.dataSource = collectionDataSource
        setupView()
    }
    
    
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
        addSubview(backBouttonRoundView)
        addSubview(titlelable)
        addSubview(customtabBar)
        addSubview(favBtn)
        addSubview(cartBtn)
        addSubview(finalPriceLable)
        addSubview(priceLable)
        addSubview(discountLbl)
        addSubview(rateView)
        addSubview(numberOFReviewerLable)
    }
    private func addConstraintsToSubViews(){
        imageCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230, paddingCenterX: 0, paddingCenterY: 0)
        backBouttonRoundView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(centerX: backBouttonRoundView.centerXAnchor, centerY: backBouttonRoundView.centerYAnchor)
        pageControl.anchor(top: nil, left: nil, bottom: imageCollectionView.bottomAnchor, right:nil, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 0, width: 0 , height: 0, paddingCenterX: 0, paddingCenterY: 0)
        titlelable.anchor(top: imageCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        priceLable.anchor(top: titlelable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: -70, paddingCenterY: 0)
        //priceLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 64).isActive = true
        discountLbl.anchor(top: nil, left: priceLable.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        rateView.anchor(top: nil, left: discountLbl.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: discountLbl.centerYAnchor, paddingTop: 0, paddingLeft:8, paddingBottom: 0, paddingRight: 0, width: 65, height: 20, paddingCenterX: 0, paddingCenterY: 5)
         numberOFReviewerLable.anchor(top: nil, left: rateView.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: priceLable.centerYAnchor, paddingTop: 0, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 50, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        finalPriceLable.anchor(top: priceLable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        customtabBar.anchor(top: finalPriceLable.bottomAnchor, left: leftAnchor, bottom: nil , right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        
        cartBtn.anchor(top: nil , left: leftAnchor , bottom: bottomAnchor , right: nil , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0 , paddingBottom: 0 , paddingRight: 16 , width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
      
        favBtn.anchor(top: nil , left: nil , bottom: bottomAnchor , right: rightAnchor , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0 , paddingBottom: 0 , paddingRight: 16 , width: 45, height: 45, paddingCenterX: 0, paddingCenterY: 0)
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
          backBouttonRoundView.layer.cornerRadius = backBouttonRoundView.frame.width / 2
    }
}

class ItemDetailCollHeader:UICollectionReusableView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ButtonActionDelegate{
    var photos = [Media]()
    let cellID = "cellID"
    var dismissVC: (()->())?
    var handelTabBarTapped: ((_ tag:UITapGestureRecognizer)->())?
    var handelFlowBtnTapped: ((_ sender:UIButton)->())?
    //weak var actionDelegate:ButtonActionDelegate?
    lazy var header:ItemDetailHeaderView = {
        let header = ItemDetailHeaderView(self, self, self)
        header.backgroundColor = .white
        return header
    }()
    var senderTag:String?
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(header)
        header.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:0, paddingCenterX: 0, paddingCenterY: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setData(rating:Double,numberOfuserRating:Double,price:Float,sale:Float,name:String,numberOfPages:Int){
        header.rateView.rating = rating
        header.titlelable.text = name
        header.priceLable.setAttributeStringWithStrike("\(price)")
        header.discountLbl.text = ReturnPricepersent(sale: Double(sale))
        header.numberOFReviewerLable.text = "(\(numberOfuserRating) user)"
        header.finalPriceLable.text = "\(getFinalPrice(price:Double(price), sale: Double(sale)))"
        header.pageControl.numberOfPages = numberOfPages
    }
    private func getFinalPrice(price:Double,sale:Double) -> Double{
//        "\(con.ReturnPriceAfterSale(price: con.price , sale: Double(con.sale).roundToDecimal(3))) \("sar".localized)"
        
       return (price - (price * sale).roundToDecimal(1))
       // return price - (price * (sale ?? 1))
    }
     func ReturnPricepersent(sale:Double) -> String{
        return "\( Int(Double(round(sale * 100) / 100).roundToDecimal(1) * 100)) %"
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BannerCell else{return UICollectionViewCell()}
        cell.bannerImage.contentMode = .scaleAspectFit
        cell.photo = photos[indexPath.row]
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
    func dissmisController() {
        self.dismissVC?()
    }
    func customTabBarTapped(_ sender: UITapGestureRecognizer) {
        self.handelTabBarTapped?(sender)
    }
    func flowButtonTapped(_ sender: UIButton) {
        self.handelFlowBtnTapped?(sender)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        header.pageControl.currentPage = Int(x/self.frame.width)
    }
}
