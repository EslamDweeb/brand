//
//  ItemDetailVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import EasyTipView
class ItemDetailVC: UIViewController,ButtonActionDelegate {
    let headerID = "headerID"
    let cellID = "cellID"
    var itemDetails:ItemDetailInfo?
    var reviews = [Ratingable]()
    var rateData:OverallRating?
    var globalHeader : ItemDetailCollHeader!
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    var slug:String?
    var preferences = EasyTipView.Preferences()
    static func create (slug : String) -> ItemDetailVC {
        let vc = ItemDetailVC()
        vc.slug = slug
        return vc
    }
    
    
    lazy var mainView:ItemDetailVCView = {
        let v = ItemDetailVCView(collectionDelegate: self, CollectionDataSource: self)
        v.backgroundColor = .white
        return v
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        preferences.drawing.font = UIFont(name: .fontM, size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = .gray
        EasyTipView.globalPreferences = preferences
        print("hi!!!!!!!!!!!!!!!!")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getItemDetailInfo()
    }
    func infoTapped(_ sender: UIButton) {
        guard let text = self.itemDetails?.config.sellerNotes else{
            return
        }
        let tipView = EasyTipView(text: text , preferences: preferences)
        guard let  cell = mainView.mainCollectionView.cellForItem(at: [0,0]) as? MainCollCell else {
            return
        }
        guard let cell2 = cell.pageCollectionView.cellForItem(at: [0,0]) as? FirstCell else {
            return
        }
        tipView.show(forView: cell2.detailView.infoBtn , withinSuperview: self.mainView)
        
    }
    private func getItemDetailInfo(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
        }
        getRatingAndReviewInfo()
    }
    fileprivate func getRatingAndReviewInfo(){
        getItemData()
    }
    fileprivate func getItemData(){
        APIClient.getItemDetail(slug: self.slug ?? "noura-456735") { (result) in
            switch result{
            case .success(let data):
                self.itemDetails = data
                self.getRatingData(id:Int(self.itemDetails?.config.modelRatingID ?? 0))
                self.getReviewData(id:Int(self.itemDetails?.config.catalogID ?? 0),refresh:true)
                print(data)
            case .failure(let error):
                self.mainView.activityStopAnimating()
                print(error)
            }
        }
    }
    fileprivate func removeAlertController(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.dismissPressentededControllers()
        }
    }
    fileprivate func getRatingData(id:Int){
        APIClient.getConfigRating(id: id) { (result) in
            switch result{
            case.success(let data):
                print(data)
                self.rateData = data.overallRating
            case.failure(let error):
                self.mainView.activityStopAnimating()
                print(error)
            }
        }
    }
    fileprivate func getReviewData(id:Int,refresh:Bool = false){
        APIClient.getConfigReviews(id: id,page: currentPage) { (result) in
            switch result{
            case.success(let data):
                if refresh {
                    self.reviews = data.ratingables
                } else {
                    for conf in data.ratingables {
                        self.reviews.append(conf)
                    }
                }
                self.shouldShowLoadingCell = (data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
                self.mainView.mainCollectionView.reloadData()
                self.mainView.activityStopAnimating()
                print(data)
            case.failure(let error):
                print(error)
                self.mainView.activityStopAnimating()
            }
        }
    }
    func fetchNextPage() {
        currentPage += 1
        self.getReviewData(id: Int(self.itemDetails?.config.catalogID ?? 0))
    }
}
extension ItemDetailVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as? ItemDetailCollHeader else{return UICollectionReusableView()}
        self.globalHeader = header
        header.dismissVC = { [weak self] in
            guard let self = self else{return}
            self.dismiss(animated: true, completion: nil)
        }
        header.photos = itemDetails?.config.photos ?? []
        header.setData(rating: Double(itemDetails?.config.overallRating ?? 0), numberOfuserRating: Double(itemDetails?.config.overallRatingCount ?? 0), price: Float(itemDetails?.config.price ?? 0), sale: Float(itemDetails?.config.sale ?? 0), name: itemDetails?.config.name ?? "", numberOfPages: itemDetails?.config.photos?.count ?? 0)
        header.header.imageCollectionView.reloadData()
        header.handelTabBarTapped = {(sender) in
            self.handelCustomTabBarTappedWork(collectionView, indexPath, header,sender)
        }
        header.handelFlowBtnTapped = { [weak self](sender) in
            guard let self = self else {return}
            if sender == header.header.favBtn{
                APIClient.toggleFav(id: self.itemDetails?.config.id ?? 0) { (result) in
                    switch result {
                    case.success(let data):
                        self.createAlert(title: nil, erroMessage: data.message ?? "", createButton: nil)
                        self.removeAlertController()
                        print(data)
                    case .failure(_):
                        break
                    }
                }
            }else if sender == header.header.cartBtn {
                self.addViewAddToCart(config: self.itemDetails?.config )
                
            }
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MainCollCell else{return UICollectionViewCell()}
        cell.itemDetails = self.itemDetails
       let cell2 = cell.pageCollectionView.cellForItem(at: [0,0]) as? FirstCell
        cell2?.detailView.infoBtn.addTarget(self, action: #selector(ButtonActionDelegate.infoTapped(_:)), for: .touchUpInside)

        cell.reviews = self.reviews
        cell.rateData = self.rateData
        cell.handelCellSwipe = { [weak self](row) in
            guard let self = self else{return}
            if row == 0 {
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.detailnBtn.tapGesture.name ?? "",headerView: self.globalHeader)
            }else if row == 1 {
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.specsBtn.tapGesture.name ?? "",headerView: self.globalHeader)
            }else if row == 2 {
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.reviewBtn.tapGesture.name ?? "",headerView:self.globalHeader)
            }
        }
        handelAddReviewTapped(cell:cell)
        cell.pageCollectionView.reloadData()
        cell.handelFooterViewClouserAction = {[weak self] (slug) in
            guard let self = self else{return}
            self.reloadController(slug: slug)
        }
        cell.handelThirdCellPaging = {[weak self] in
            guard let self = self else{return}
            self.fetchNextPage()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 350) //add your height here
    }
    func handelCustomTabBarTappedWork(_ collection:UICollectionView,_ indexPath:IndexPath,_ headerView:ItemDetailCollHeader,_ tap:UITapGestureRecognizer){
        guard let cell = collection.cellForItem(at: indexPath)as?MainCollCell else{return}
        if tap.name == "details"{
            changeCustomTabBarBtnColor(name: tap.name ?? "", headerView: headerView)
            cell.pageCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        }else if tap.name == "specs"{
            changeCustomTabBarBtnColor(name: tap.name ?? "", headerView: headerView)
            cell.pageCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
        }else if tap.name == "review"{
            changeCustomTabBarBtnColor(name: tap.name ?? "", headerView: headerView)
            cell.pageCollectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    fileprivate func changeCustomTabBarBtnColor(name:String,headerView:ItemDetailCollHeader){
        if name == "details"{
            headerView.header.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "infofill")
            headerView.header.customtabBar.detailnBtn.titleLable.textColor = .pink
            headerView.header.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsEmpty")
            headerView.header.customtabBar.specsBtn.titleLable.textColor = .lightgray3
            headerView.header.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "areaChartAnticon")
            headerView.header.customtabBar.reviewBtn.titleLable.textColor = .lightgray3
        }else if name == "specs"{
            headerView.header.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "info")
            headerView.header.customtabBar.detailnBtn.titleLable.textColor = .lightgray3
            headerView.header.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsfill")
            headerView.header.customtabBar.specsBtn.titleLable.textColor = .pink
            headerView.header.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "areaChartAnticon")
            headerView.header.customtabBar.reviewBtn.titleLable.textColor = .lightgray3
        }else if name == "review"{
            headerView.header.customtabBar.detailnBtn.iconImageView.image = #imageLiteral(resourceName: "info")
            headerView.header.customtabBar.detailnBtn.titleLable.textColor = .lightgray3
            headerView.header.customtabBar.specsBtn.iconImageView.image = #imageLiteral(resourceName: "specsEmpty")
            headerView.header.customtabBar.specsBtn.titleLable.textColor = .lightgray3
            headerView.header.customtabBar.reviewBtn.iconImageView.image = #imageLiteral(resourceName: "reviewfill")
            headerView.header.customtabBar.reviewBtn.titleLable.textColor = .pink
        }
    }
    private func handelAddReviewTapped(cell:MainCollCell){
        cell.handelThirdCellAddReview = {[weak self] in
            guard let self = self else {return}
            let dest = AddReviewController()
            dest.catlogId = self.itemDetails?.config.catalogID
            dest.editeFlag = false
            dest.mainView.setHeaderViewData(self.itemDetails?.config.brand?.name ?? "", self.itemDetails?.config.name ?? "",5, self.itemDetails?.config.mainPhoto?.path)
            self.present(dest, animated: true, completion: nil)
        }
    }
    private func reloadController(slug: String){
        self.presentViewController(controller: ItemDetailVC.create(slug: slug), transitionModal:.crossDissolve, presentationStyle: nil)
    }
}
