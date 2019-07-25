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
        return coll
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageCollectionView)
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
            if itemDetails?.config.configOptions != nil {
                cell.getSizeViewData(configOption: (itemDetails?.config.configOptions[0])!)
                cell.getColorViewData(configOption: (itemDetails?.config.configOptions[1])!)
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCell, for: indexPath)as? SecondeCell else{return UICollectionViewCell()}
            cell.specs = itemDetails?.config.specs
            cell.tableView.reloadData()
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdCell, for: indexPath)as? ThirdCell else{return UICollectionViewCell()}
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
}
