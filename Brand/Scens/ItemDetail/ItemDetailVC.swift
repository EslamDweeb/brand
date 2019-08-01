//
//  ItemDetailVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController,ButtonActionDelegate {
    let headerID = "headerID"
    let cellID = "cellID"
    var itemDetails:ItemDetailInfo?
      let group = DispatchGroup()
    var reviews = [Ratingable]()
    var rateData:OverallRating?
    var globalHeader : ItemDetailCollHeader!
    
    var slug:String?
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
        print("hi!!!!!!!!!!!!!!!!")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getItemDetailInfo()
    }
    private func getItemDetailInfo(){
        //hani-laptop-751586
        //noura-456735
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
        }
        getRatingAndReviewInfo()
    }
    fileprivate func getRatingAndReviewInfo(){
        group.enter()
        getItemData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.group.enter()
            self.getRatingData(id:Int(self.itemDetails?.config.modelRatingID ?? 0))
            self.group.enter()
            self.getReviewData(id:Int(self.itemDetails?.config.catalogID ?? 0))
        }
        group.notify(queue: .main) {
            self.mainView.activityStopAnimating()
            print("finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        }
        //self.pageCollectionView.reloadData()
    }
    fileprivate func getItemData(){
        APIClient.getItemDetail(slug: self.slug ?? "noura-456735") { (result) in
            switch result{
            case .success(let data):
                    self.itemDetails = data
                    self.mainView.mainCollectionView.reloadData()
                    self.group.leave()
                    print(data)
            case .failure(let error):
                self.group.leave()
                print(error)
            }
        }
    }
    fileprivate func getRatingData(id:Int){
        APIClient.getConfigRating(id: id) { (result) in
            switch result{
            case.success(let data):
                print(data)
                self.rateData = data.overallRating
                 self.mainView.mainCollectionView.reloadData()
                self.group.leave()
            case.failure(let error):
                print(error)
                self.group.leave()
            }
        }
    }
    fileprivate func getReviewData(id:Int){
        APIClient.getConfigReviews(id: id) { (result) in
            switch result{
            case.success(let data):
                self.reviews = data.ratingables
                 self.mainView.mainCollectionView.reloadData()
                print(data)
                self.group.leave()
            case.failure(let error):
                print(error)
                self.group.leave()
            }
        }
    }
//    func dissmisController() {
//        self.dismiss(animated: true, completion: nil)
//    }
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
        header.setData(rating: Double(itemDetails?.config.overallRating ?? 0), numberOfuserRating: Double(itemDetails?.config.overallRatingCount ?? 0), price: Double(itemDetails?.config.price ?? 0), sale: Double(itemDetails?.config.sale ?? 0), name: itemDetails?.config.name ?? "", numberOfPages: itemDetails?.config.photos?.count ?? 0)
           header.header.imageCollectionView.reloadData()
        header.handelTabBarTapped = {(sender) in
            self.handelCustomTabBarTappedWork(collectionView, indexPath, header,sender)
        }
        header.handelFlowBtnTapped = { [weak self](sender) in
            guard let self = self else {return}
            if sender == header.header.customtabBar.favBtn{
                APIClient.toggleFav(id: self.itemDetails?.config.id ?? 0) { (result) in
                    switch result {
                    case.success(let data):
                        print(data)
                    case .failure(_):
                        break
                    }
                }
            }else if sender == header.header.customtabBar.cartBtn{
                
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
        cell.reviews = self.reviews
        cell.rateData = self.rateData
        cell.handelCellSwipe = { [weak self](row) in
            guard let self = self else{return}
//            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerID, for: indexPath) as? ItemDetailCollHeader else{return}
            if row == 0 {
                //header.header.customtabBar.detailnBtn.tapGesture.name = "details"
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.detailnBtn.tapGesture.name ?? "",headerView: self.globalHeader)
            }else if row == 1 {
                //header.header.customtabBar.detailnBtn.tapGesture.name = "specs"
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.specsBtn.tapGesture.name ?? "",headerView: self.globalHeader)
            }else if row == 2 {
               //header.header.customtabBar.detailnBtn.tapGesture.name = "review"
                self.changeCustomTabBarBtnColor(name: self.globalHeader.header.customtabBar.reviewBtn.tapGesture.name ?? "",headerView:self.globalHeader)
            }
        }
        cell.pageCollectionView.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
           return CGSize(width: collectionView.frame.width, height: 750)
        case 1:
            return CGSize(width: collectionView.frame.width, height:  collectionView.frame.height)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 770)
        default:
             return CGSize(width: collectionView.frame.width, height: 800)
        }
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
    private func handelFlowButtonTapped(){    }
}