//
//  MainCollCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class MainCollCell:UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    let firstCell = "firstCell"
    let secondCell = "secondCell"
    let thirdCell = "thirdCell"
    var itemDetails:ItemDetailInfo?
    var reviews = [Ratingable]()
    var rateData:OverallRating?
    let group = DispatchGroup()
    var row:Int?
    var handelCellSwipe:((_ row:Int) -> ())?
    var handelThirdCellAddReview:(() -> ())?
    var handelFooterViewClouserAction:((_ slug:String)->())?
    var handelThirdCellPaging:(() -> ())?
    var handelFirstCellSelectedConfigOption:((_ selectedArray:[Int],_ SelectedId:Int) -> ())?
    lazy var pageCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coll.register(FirstCell.self, forCellWithReuseIdentifier: firstCell)
        coll.register(SecondeCell.self, forCellWithReuseIdentifier: secondCell)
        coll.register(ThirdCell.self, forCellWithReuseIdentifier: thirdCell)
        coll.isPagingEnabled = true
        coll.delegate = self
        coll.dataSource = self
        //coll.isPagingEnabled = true
        coll.showsHorizontalScrollIndicator = false
        return coll
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageCollectionView)
        self.backgroundColor = .white
        pageCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCell, for: indexPath)as? FirstCell else{return UICollectionViewCell()}
            cell.getDetailViewData(brandName:itemDetails?.config.brand?.name ?? "",madeIN: itemDetails?.config.madeIn ?? "",tags:itemDetails?.config.tags ?? [])
            cell.getDescriptionViewData(description:itemDetails?.config.configDescription ?? "")
            cell.getFooterViewData(configs: itemDetails?.config.relatedProducts ?? [])
            cell.configOptionArray = itemDetails?.config.configOptions
            cell.configOptionTableView.reloadData()
            cell.footerView.HandelSelectedCellAction = {[weak self] (slug) in
                guard let self = self else{return}
                self.handelFooterViewClouserAction?(slug)
                cell.handelSelectedConfigOption = {[weak self] (array,id) in
                    guard let self = self else{return}
                    self.handelFirstCellSelectedConfigOption?(array,id)  
                }
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCell, for: indexPath)as? SecondeCell else{return UICollectionViewCell()}
            cell.specs = itemDetails?.config.specs
            cell.tableView.reloadData()
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdCell, for: indexPath)as? ThirdCell else{return UICollectionViewCell()}
            cell.header.ratingData = self.rateData
            cell.reviews = self.reviews
            cell.reviewCollectionView.reloadData()
            cell.handelAddReviewButtonTapped = { [weak self] in
                guard let self = self else{return}
                self.handelThirdCellAddReview?()
            }
            cell.handelPaging = { [weak self] in
                guard let self = self else{return}
                self.handelThirdCellPaging?()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        ////        guard let thirdCell = collectionView.cellForItem(at: IndexPath(row: 2, section: 0)) as? ThirdCell else{return}
        //        if indexPath.row == 1{
        //            getRatingAndReviewInfo(catlogID: itemDetails?.config.catalogID ?? 0,modalID: Int(itemDetails?.config.modelRatingID ?? 0))
        //        }
          //self.handelCellSwipe?(indexPath.row)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
          let x = targetContentOffset.pointee.x
           self.row = Int(x/self.frame.width)
           self.handelCellSwipe?(row!)
    }
//    func handelSwipe(_ row:Int){
//        pageCollectionView.scrollToItem(at: IndexPath(row: row, section: 0), at: .centeredHorizontally, animated: true)
//    }
}
