//
//  ItemDetailsV2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import EasyTipView

class ItemDetailsVC_V2 : UIViewController , DelegateCustomTabBarButton {
    
    lazy var mainView : ItemDetailsView_V2 = {
        let v = ItemDetailsView_V2(buttonActionDelegate: self , scrollDelegate: self )
        v.delegateCustomTabBarButton = self
        return v
    }()
    
    private var slug = ""
    
    init(slug : String) {
        super.init(nibName: nil , bundle: nil )
        self.slug = slug
    }
    
    required init?(coder aDecoder:  NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isShowTip = false
    var tipView : EasyTipView?
    var preferences = EasyTipView.Preferences()

    var presenter : ProItemDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
        presenter = ItemDetailsPresenter(itemView: self  )
        presenter?.getItemDetails(slug: slug)
        
        mainView.paginateReviews = { ()-> Void in
            self.presenter?.getReviewData()
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.headerViewHeightConstraint = mainView.headerView.heightAnchor.constraint(equalToConstant: mainView.headerView.frame.height )
        mainView.headerViewHeightConstraint?.isActive = true
        mainView.headerViewMaxHeight = mainView.headerViewHeightConstraint?.constant ?? 0
        mainView.navView.backBouttonRoundView.layer.cornerRadius =  mainView.navView.backBouttonRoundView.bounds.width / 2

    }
    
    private func addDataToHeader () {
        let config = presenter?.itemDetails?.config
        self.mainView.headerView.imagesSlide = config?.photos ?? []
        self.mainView.headerView.setData(rating: Double(config?.overallRating ?? 0), numberOfuserRating: Double(config?.overallRatingCount ?? 0), price: Float(config?.price ?? 0), sale: Float(config?.sale ?? 0), name: config?.name ?? "", numberOfPages: config?.photos?.count ?? 0, fav: config?.isFavorite ?? false)
        self.mainView.headerView.imageCollectionView.reloadData()
        self.mainView.navView.lableTitle.text = config?.name ?? ""
    }
    
    private func addDataToFirstTab () {
        let config = presenter?.itemDetails?.config
        if presenter?.sallerNote == nil || presenter?.sallerNote == "" {
            mainView.firstTab.detailView.buttonInfo.isHidden = true
        }else {
            mainView.firstTab.detailView.buttonInfo.isHidden = false
        }
        mainView.firstTab.detailView.setData(brandTitle: config?.brand?.name ?? "" , countryTitle: config?.madeIn ?? "" , tags: config?.tags ?? [] )
        mainView.firstTab.detailView.delegate = self // implement DelegateDetailsViewFirstCell
        mainView.firstTab.descriptionView.labelDescriptionData.text = config?.configDescription ?? ""
        mainView.firstTab.configOptionsView.delegateConfigOption = self // implement DelegateConfigOptionViewFirstCell
        mainView.firstTab.configOptionsView.configOptionArray = config?.configOptions ?? []
        mainView.firstTab.getFooterViewData(configs: config?.relatedProducts , simpleConfig: nil )
        mainView.firstTab.footerView.HandelSelectedCellAction = {[weak self] (slug) in
            guard let self = self else{return}
            self.presentViewController(controller: ItemDetailsVC_V2(slug: slug) , transitionModal:.crossDissolve, presentationStyle: nil)
            
        }
    }
    
    private func addDataToSecondTab () {
        let config = presenter?.itemDetails?.config
        mainView.secondTab.specs = config?.specs ?? []
        mainView.secondTab.reloadData()
    }
    
    private func addDataToThirdTab () {
        
        mainView.thirdTab.header.ratingData = presenter?.rateData
        mainView.thirdTab.reviews = presenter?.reviews ?? []
        mainView.thirdTab.reviewTableView.reloadData()
        mainView.thirdTab.handelAddReviewButtonTapped = { [weak self] in
            guard let self = self else{return}
            if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
                let dest = AddReviewController()
                dest.catlogId = self.presenter?.itemDetails?.config.catalogID
                dest.editeFlag = false
                dest.mainView.setHeaderViewData(self.presenter?.itemDetails?.config.brand?.name ?? "", self.presenter?.itemDetails?.config.name ?? "",5, self.presenter?.itemDetails?.config.mainPhoto?.path)
                self.present(dest, animated: true, completion: nil)
            }else{
                self.presentLoginViewController(loginDismiss: true)
            }
        }

    }
    
    private func openShowTips () {
        preferences.drawing.font = UIFont(name: .fontM, size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = .gray
        EasyTipView.globalPreferences = preferences
        
        if isShowTip == false{
            guard let text = presenter?.sallerNote else{
                return
            }
            tipView = EasyTipView(text: text , preferences: preferences)
            
            tipView?.show(forView: mainView.firstTab.detailView.buttonInfo , withinSuperview: self.mainView)
            self.isShowTip = !self.isShowTip
        }else{
            tipView?.dismiss()
            self.isShowTip = !self.isShowTip
        }
    }
    
}

extension ItemDetailsVC_V2 : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , DelegateDetailsViewFirstCell , DelegateConfigOptionViewFirstCell {
    
    func selectedConfigOptions(selectedDec: [String : Int] , selectedOptionID : Int ) {
       // print("selectedDec : \(selectedDec)")
        
        presenter?.getConfigSlug(productID: presenter?.itemDetails?.config.productID ?? 0 , values: selectedDec.map({$0.value}) , clickedId:  selectedOptionID )
    }
    
    
    func actionButtonInfo(_ sender: UIButton) {
      //  print("click on info")
        openShowTips()
    }
    
    func actionTapOnTag(tag: Tag) {
       // print("tag : \(tag.name)")
        let s = searchVC()
        s.tagSearch = tag
        self.presentViewController(controller: s , transitionModal:.crossDissolve, presentationStyle: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let config = presenter?.itemDetails?.config
//        if indexPath.row == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellItemDetailsFirstTab.getIdentifier() , for: indexPath) as! CellItemDetailsFirstTab
//            cell.scrollView.delegate = self
//            if presenter?.sallerNote == nil || presenter?.sallerNote == "" {
//                cell.detailView.buttonInfo.isHidden = true
//            }else {
//                cell.detailView.buttonInfo.isHidden = false
//            }
//            cell.detailView.setData(brandTitle: config?.brand?.name ?? "" , countryTitle: config?.madeIn ?? "" , tags: config?.tags ?? [] )
//            cell.detailView.delegate = self // implement DelegateDetailsViewFirstCell
//            cell.descriptionView.labelDescriptionData.text = config?.configDescription ?? ""
//            cell.configOptionsView.delegateConfigOption = self // implement DelegateConfigOptionViewFirstCell
//            cell.configOptionsView.configOptionArray = config?.configOptions ?? []
//            cell.getFooterViewData(configs: config?.relatedProducts , simpleConfig: nil )
//            cell.footerView.HandelSelectedCellAction = {[weak self] (slug) in
//                guard let self = self else{return}
//                self.presentViewController(controller: ItemDetailsVC_V2(slug: slug) , transitionModal:.crossDissolve, presentationStyle: nil)
//
//            }
//
//            return cell
//
//        }else if indexPath.row == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondeCell.getIdentifier() , for: indexPath) as! SecondeCell
//            cell.tableView.delegate = self
//            cell.specs = config?.specs ?? []
//            cell.tableView.reloadData()
//            return cell
//        }else if indexPath.row == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCell.getIdentifier() , for: indexPath) as! ThirdCell
//            cell.scrollView.delegate = self
//            cell.header.ratingData = presenter?.rateData
//            cell.reviews = presenter?.reviews ?? []
//            cell.reviewCollectionView.reloadData()
//            cell.handelAddReviewButtonTapped = { [weak self] in
//                guard let self = self else{return}
//                if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
//                    let dest = AddReviewController()
//                    dest.catlogId = self.presenter?.itemDetails?.config.catalogID
//                    dest.editeFlag = false
//                    dest.mainView.setHeaderViewData(self.presenter?.itemDetails?.config.brand?.name ?? "", self.presenter?.itemDetails?.config.name ?? "",5, self.presenter?.itemDetails?.config.mainPhoto?.path)
//                    self.present(dest, animated: true, completion: nil)
//                }else{
//                    self.presentLoginViewController(loginDismiss: true)
//                }
//            }
//            cell.handelPaging = { [weak self] in
//                guard let self = self else{return}
//              //  self.handelThirdCellPaging?()
//            }
//            return cell
//        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height )
    }
    
}

extension ItemDetailsVC_V2 : ButtonActionDelegate {
    
    func flowButtonTapped(_ sender: UIButton) {
        if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
            if sender == mainView.headerView.favBtn {
                APIClient.toggleFav(id: presenter?.itemDetails?.config.id ?? 0) { (result) in
                    switch result {
                    case.success(let data):
                        self.createAlert(title: nil, erroMessage: data.message ?? "", createButton: nil)
                        if self.mainView.headerView.isfav {
                           self.mainView.headerView.favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
                            self.mainView.headerView.isfav = false
                        }else{
                            self.mainView.headerView.favBtn.setImage(#imageLiteral(resourceName: "fav-outline"), for: .normal)
                             self.mainView.headerView.isfav = true
                        }
                        
                        print(data)
                    case .failure(_):
                        break
                    }
                }
            }else if sender == mainView.headerView.cartBtn {
                self.addViewAddToCart(config: presenter?.itemDetails?.config )
                
            }
        }else{
            self.presentLoginViewController(loginDismiss: true)
        }
    }
    
    func customTabBarTapped(_ tap: UITapGestureRecognizer) {
        if tap.name == "details"{
            changeCustomTabBarBtnColor(name: tap.name ?? "" )
            let point = CGPoint(x: 0 , y: mainView.scrollViewMain.contentOffset.y )
            mainView.scrollViewMain.setContentOffset(point, animated: true )
        }else if tap.name == "specs"{
            changeCustomTabBarBtnColor(name: tap.name ?? "" )
            let point = CGPoint(x: mainView.scrollViewMain.frame.width , y: mainView.scrollViewMain.contentOffset.y )
            mainView.scrollViewMain.setContentOffset(point, animated: true )
        }else if tap.name == "review"{
            changeCustomTabBarBtnColor(name: tap.name ?? "" )
            let point = CGPoint(x: mainView.scrollViewMain.frame.width * 2 , y: mainView.scrollViewMain.contentOffset.y )
            mainView.scrollViewMain.setContentOffset(point, animated: true )
        }
    }
    
    func dissmisController() {
        self.dismiss(animated: true )
    }
    
    func changeCustomTabBarBtnColor(name:String){
        if name == "details"{
            mainView.headerView.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "infofill")
            mainView.headerView.customtabBar.detailnBtn.titleLable.textColor = .pink
            mainView.headerView.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsEmpty")
            mainView.headerView.customtabBar.specsBtn.titleLable.textColor = .lightgray3
            mainView.headerView.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "areaChartAnticon")
            mainView.headerView.customtabBar.reviewBtn.titleLable.textColor = .lightgray3
        }else if name == "specs"{
            mainView.headerView.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "info")
            mainView.headerView.customtabBar.detailnBtn.titleLable.textColor = .lightgray3
            mainView.headerView.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsfill")
            mainView.headerView.customtabBar.specsBtn.titleLable.textColor = .pink
            mainView.headerView.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "areaChartAnticon")
            mainView.headerView.customtabBar.reviewBtn.titleLable.textColor = .lightgray3
        }else if name == "review"{
            mainView.headerView.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "info")
            mainView.headerView.customtabBar.detailnBtn.titleLable.textColor = .lightgray3
            mainView.headerView.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsEmpty")
            mainView.headerView.customtabBar.specsBtn.titleLable.textColor = .lightgray3
            mainView.headerView.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "reviewfill")
            mainView.headerView.customtabBar.reviewBtn.titleLable.textColor = .pink
        }
    }
    
    
}


extension ItemDetailsVC_V2 : ProItemDetailsView {
    func showLoading() {
        self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
    }
    
    func hideLoading() {
        self.mainView.activityStopAnimating()
    }
    
    func onError(_ message: String) {
        hideLoading()
        showMessage(message)
    }
    
    func onFailur(_ message: String) {
        showLoading()
        showMessage(message)
    }
    
    func showMessage(_ message: String) {
        SnackBar.instance.setMessage(message)
    }
    
    func getItemDetails() {
        addDataToHeader()
        addDataToFirstTab()
        addDataToSecondTab()
        addDataToThirdTab()
    }
    
    func getRatingData () {
       addDataToThirdTab()
    }
    func getReviewData () {
       addDataToThirdTab()
    }

}


